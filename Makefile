CC = gcc
CFLAGS = -Wall -g -Iinclude
LIB = lib/libmyutils.a
TARGET = bin/client_static

all: $(TARGET)

$(TARGET): obj/main.o $(LIB)
	$(CC) obj/main.o -Llib -lmyutils -o $(TARGET)

$(LIB): obj/mystfunctions.o obj/myfilefunctions.o
	ar rcs $(LIB) obj/mystfunctions.o obj/myfilefunctions.o

obj/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f obj/*.o bin/client_static lib/libmyutils.a

.PHONY: all clean
