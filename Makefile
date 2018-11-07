all: start v_dec string_length string_equals string_print string_toLowerCase string_toUpperCase	string_charAt string_indexOf_1 string_indexOf_2
	ld start.o string/*.o v_dec.o -o start

start: start.s
	as start.s -o start.o -g

v_dec: v_dec.s
	as v_dec.s -o v_dec.o

string_length: string/string_length.s
	as string/string_length.s -o string/string_length.o

string_equals: string/string_equals.s
	as string/string_equals.s -o string/string_equals.o

string_print: string/string_print.s
	as string/string_print.s -o string/string_print.o
	
string_toLowerCase: string/string_toLowerCase.s
	as string/string_toLowerCase.s -o string/string_toLowerCase.o

string_toUpperCase: string/string_toUpperCase.s
	as string/string_toUpperCase.s -o string/string_toUpperCase.o

string_charAt:	string/string_charAt.s
	as string/string_charAt.s -o string/string_charAt.o

string_indexOf_1: string/string_indexOf_1.s
	as string/string_indexOf_1.s -o string/string_indexOf_1.o

string_indexOf_2: string/string_indexOf_2.s
	as string/string_indexOf_2.s -o string/string_indexOf_2.o

clean:
	rm *.o string/*.o start
