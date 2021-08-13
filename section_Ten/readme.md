# Data Types round 2

VARCHAR vs CHAR

VARCHAR is a VARIABLE-CHAR 
	You can have less than the declared space
	
CHAR is a FIXED LENGTH
	Every entry will be exactly the right character length
	

CHAR WILL ALWAYS be the exact lenght in space that you declared it for 

the length of a char column is fixed to the length that you declare when you create the table. The length can be any value from 0 to 255. When CHAR values are stored, They are right-padded with spaces to the specified length. When char values are retrieved, trailing spaces are removed unless the PAD_CHAR_TO_FULL_LENGTH SQL mode is enabled. 

CHAR IS FASTER 
	If you have a fixed length data entry, you can save RAM and MEMORY by using exact memory details


~~ I skipped other data-types because of knowledge of binary and the ability to look up data-types when I need. 