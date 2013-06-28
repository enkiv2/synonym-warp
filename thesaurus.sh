
wn "$1" -synsn -synsv -synsa -synsr | 
	grep -v '^Sense ' | 
	grep -v '^Synony' | 
	grep -v '^[0-9]' |
	grep -v '\->' |
	grep -v '=>' | 
	sed '	s/INSTANCE OF=>//g;
		s/Also See->//g;
		s/^ *=> //g;
		s/, /\n/g;
		s/^  *//g;
		s/#[0-9][0-9]*//g' | 
	grep .
