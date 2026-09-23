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

install: $(TARGET)
	install -d /usr/local/bin
	install -m 755 $(TARGET) /usr/local/bin/client
	install -d /usr/local/share/man/man3
	install -m 644 man/man3/client.3 /usr/local/share/man/man3/client.3
	@echo "Installation complete."

uninstall:
	rm -f /usr/local/bin/client
	rm -f /usr/local/share/man/man3/client.3
	@echo "Uninstall complete."

.PHONY: all clean install uninstall
