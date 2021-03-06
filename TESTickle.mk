CC=gcc
CFLAGS=-fms-extensions -std=c99 -Wall -Wextra -Werror -g
PERL=perl
SCRIPTPATH=TESTickle

TESTICKLE_BUILT_ITEMS=*.test.runner.c *.test.o *.test *.test.exe

%.test.o: %.test.c
	$(CC) $(CFLAGS) -o $@ -c $<

%.test.runner.c: %.test.c
	$(PERL) $(SCRIPTPATH)/test_generator.pl $< > $@

test_files_for = $(patsubst %.test.c,%.test.runner.c,$(1)) $(patsubst %.test.c,%.test.o,$(1))

