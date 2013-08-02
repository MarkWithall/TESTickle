CC=gcc
CFLAGS=-fms-extensions -std=c99 -Wall -Wextra -Werror -g
BIN=bin
OBJ=obj
RM=rm -f
MKDIR=mkdir -p
PERL=perl

.PHONY: create_build_dirs test clean
.IGNORE: create_build_dirs

all: create_build_dirs $(BIN)/test

create_build_dirs:
	$(MKDIR) $(OBJ) $(BIN)

$(OBJ)/test.o: test.c TESTickle.h
	$(CC) $(CFLAGS) -o $@ -c $<

test_runner.c: test.c
	$(PERL) test_generator.pl $< > $@

$(BIN)/test: test_runner.c $(OBJ)/test.o
	$(CC) $(CFLAGS) -o $@ $^

test:
	prove -f -e "" bin/*

clean:
	$(RM) *_runner.c
	$(RM) $(OBJ)/*.o
	$(RM) -r $(BIN)/*.dSYM
	$(RM) $(BIN)/*
