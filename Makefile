all: start.o string_length.o v_dec.o
	ld start.o string/string_length.o v_dec.o -o start
start.o: start.s
	as start.s -o start.o -g
string_length.o: string/string_length.s
	as string/string_length.s -o string/string_length.o
v_dec.o: v_dec.s
	as v_dec.s -o v_dec.o
clean:
	rm *.o string/*.o start
