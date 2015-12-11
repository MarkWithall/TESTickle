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

.PHONY: all banner create_build_dirs test clean
.IGNORE: create_build_dirs

SRC_FILES=$(wildcard *.test.c)

OBJ_NAMES=$(patsubst %.test.c,%.o,$(SRC_FILES))
OBJ_PATTERN=$(OBJ)/%
OBJ_PATHS=$(patsubst %,$(OBJ_PATTERN),$(OBJ_NAMES))

BIN_NAMES=$(patsubst %.test.c,%,$(SRC_FILES))
BIN_PATTERN=$(BIN)/%$(DOTEXE)
BIN_PATHS=$(patsubst %,$(BIN_PATTERN),$(BIN_NAMES))

all: banner create_build_dirs $(BIN_PATHS)

banner:
	@echo src files: $(SRC_FILES)
	@echo bin_names: $(BIN_NAMES)
	@echo bin_paths: $(BIN_PATHS)
	@echo obj_names: $(OBJ_NAMES)
	@echo obj_paths: $(OBJ_PATHS)
	@echo

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
