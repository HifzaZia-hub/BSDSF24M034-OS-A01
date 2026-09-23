CC = gcc
CFLAGS = -Wall -g -Iinclude
LIB = lib/libmyutils.so
TARGET = bin/client_dynamic

all: $(TARGET)

$(TARGET): obj/main.o $(LIB)
	$(CC) obj/main.o -Llib -lmyutils -o $(TARGET)

$(LIB): obj/mystfunctions.o obj/myfilefunctions.o
	$(CC) -shared obj/mystfunctions.o obj/myfilefunctions.o -o $(LIB)

obj/%.o: src/%.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

clean:
	rm -f obj/*.o bin/client_dynamic lib/libmyutils.so

.PHONY: all clean
