NAME = start
SRC = $(wildcard *.s) $(wildcard string/*.s) $(wildcard string/helpers/*.s)
OBJ = $(SRC:.s=.o)

all: $(OBJ)
	ld $(OBJ) /usr/lib/arm-linux-gnueabihf/libc.so -dynamic-linker /lib/ld-linux-armhf.so.3 -o $(NAME)

%.o: $.s
	as $.s -o $.o -g

clean:
	rm $(OBJ) $(NAME)
