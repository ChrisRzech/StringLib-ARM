NAME = start
ASFLAGS = -g
SRC = $(wildcard *.s) $(wildcard string/*.s) $(wildcard string/helpers/*.s)
OBJ = $(SRC:.s=.o)

all: $(OBJ)
	ld $(OBJ) /usr/lib/arm-linux-gnueabihf/libc.so -dynamic-linker /lib/ld-linux-armhf.so.3 -o $(NAME)

%.o: $.s
	as $(ASFLAGS) -o $@ $<

clean:
	rm $(OBJ) $(NAME)
