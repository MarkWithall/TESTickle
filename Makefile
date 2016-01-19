include TESTickle.mk

ifeq ($(OS),Windows_NT)
	RM := cmd /C del
	REMOVE_DSYM :=
	DOTEXE := .exe
else
	RM := rm -f
	REMOVE_DSYM := $(RM) -rf *.dSYM
	DOTEXE :=
endif

BUILT_ITEMS=testickle_runner.c testickle.o testickle.exe

.PHONY: test clean

testickle$(DOTEXE): testickle_runner.c testickle.o
	$(CC) $(CFLAGS) -o $@ $^

test: testickle$(DOTEXE)
	prove -f -e "" $^

clean:
	$(RM) $(BUILT_ITEMS)
	$(REMOVED_SYM)

