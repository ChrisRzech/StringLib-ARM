NAME = start
FLAGS = -g
SRC = $(wildcard *.s) $(wildcard string/*.s) $(wildcard string/helpers/*.s)
OBJ = $(SRC:.s=.o)

all: $(OBJ)
	ld *.o string/*.o string/helpers/*.o /usr/lib/arm-linux-gnueabihf/libc.so -dynamic-linker /lib/ld-linux-armhf.so.3 -o $(NAME)

%.o: $.s
	as $.s -o $.o $(FLAGS)

clean:
	rm *.o string/*.o string/helpers/*.o $(NAME)
