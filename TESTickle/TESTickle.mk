CC=gcc
CFLAGS=-fms-extensions -std=c99 -Wall -Wextra -Werror -g
PERL=perl

TESTICKLE_BUILT_ITEMS=*.test.runner.c *.test.o *.test *.test.exe

%.test.o: %.test.c TESTickle/TESTickle.h
	$(CC) $(CFLAGS) -ITESTickle -o $@ -c $<

%.test.runner.c: %.test.c
	$(PERL) TESTickle/test_generator.pl $< > $@

test_files_for = $(patsubst %.test.c,%.test.runner.c,$(1)) $(patsubst %.test.c,%.test.o,$(1))

