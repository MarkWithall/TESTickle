CC=gcc
CFLAGS=-fms-extensions -std=c99 -Wall -Wextra -Werror -g
OBJ=obj
RM=rm -f
MKDIR=mkdir -p

.PHONY: create_build_dirs clean
.IGNORE: create_build_dirs

all: create_build_dirs $(OBJ)/TESTickle.o

$(OBJ)/TESTickle.o: TESTickle.c TESTickle.h
	$(CC) $(CFLAGS) -c $< -o $@

create_build_dirs:
	$(MKDIR) $(OBJ)

clean:
	$(RM) $(OBJ)/*.o
