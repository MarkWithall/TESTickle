CC=gcc
CFLAGS=-fms-extensions -std=c99 -Wall -Wextra -Werror -g
PERL=perl

TESTICKLE_BUILT_ITEMS=*.test.runner.c *.test.o *.test *.test.exe

%.test.o: %.test.c TESTickle.h
	$(CC) $(CFLAGS) -o $@ -c $<

%.test.runner.c: %.test.c
	$(PERL) test_generator.pl $< > $@

