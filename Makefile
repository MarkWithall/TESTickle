CC=gcc
CFLAGS=-fms-extensions -std=c99 -Wall -Wextra -Werror -g
BIN=bin
OBJ=obj
PERL=perl

ifeq ($(OS),Windows_NT)
	RM := cmd /C del
	MKDIR := cmd /C md
	OBJECTS := $(OBJ)\*.o
	BINARIES := $(BIN)\*.exe
	REMOVEDSYM := 
	DOTEXE := .exe
else
	RM := rm -f
	MKDIR := mkdir -p
	OBJECTS := $(OBJ)/*.o
	BINARIES := $(BIN)/*
	REMOVEDSYM := $(RM) -rf $(BIN)/*.dSYM
	DOTEXE := 
endif

.PHONY: all create_build_dirs test clean
.IGNORE: create_build_dirs

BIN_PATTERN=$(BIN)/%$(DOTEXE)
BIN_NAMES=$(basename $(basename $(wildcard *.test.c)))

all: create_build_dirs $(patsubst %,$(BIN_PATTERN),$(BIN_NAMES))

create_build_dirs:
	$(MKDIR) $(OBJ) $(BIN)

$(OBJ)/%.o: %.test.c TESTickle.h
	$(CC) $(CFLAGS) -o $@ -c $<

%_runner.c: %.test.c
	$(PERL) test_generator.pl $< > $@

$(BIN)/%$(DOTEXE): %_runner.c $(OBJ)/%.o
	$(CC) $(CFLAGS) -o $@ $^

test:
	prove -f -e "" bin/*$(DOTEXE)

clean:
	$(RM) *_runner.c
	$(RM) $(OBJECTS)
	$(REMOVEDSYM)
	$(RM) $(BINARIES)
