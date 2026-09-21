CC = gcc
CFLAGS = -Wall -g -Iinclude
SRC = src/mystfunctions.c src/myfilefunctions.c src/main.c
OBJ = obj/mystfunctions.o obj/myfilefunctions.o obj/main.o
TARGET = bin/client

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET)

obj/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f obj/*.o bin/client

.PHONY: all clean
