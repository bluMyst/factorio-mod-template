CC=moonc
CFLAGS=

all: *.lua

%.lua: %.moon
	$(CC) $(CFLAGS) $<
