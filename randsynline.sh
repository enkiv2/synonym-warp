#!/usr/bin/env zsh

replacement_rate=75

line=""
for word in "$@" ; do
	{ echo "$word" | grep -q '^-' } && word=$(echo "$word" | sed 's/^-*//g')
	if [[ $((RANDOM%100)) -lt $replacement_rate ]] ; then
		grep -iq "$word" noise_list || word=$(./randsyn.sh "$word")
	fi
	line="$line $word"
done
echo "$line" | sed 's/^ //g'

