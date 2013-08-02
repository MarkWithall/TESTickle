CC=gcc
CFLAGS=-fms-extensions -std=c99 -Wall -Wextra -Werror -g
BIN=bin
RM=rm -f

.PHONY: clean

all: $(BIN)/test

$(BIN)/test: test.c TESTickle.h
	$(CC) $(CFLAGS) -o $@ $^

clean:
	$(RM) -r $(BIN)/*.dSYM
	$(RM) $(BIN)/*
