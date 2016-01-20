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

BUILT_ITEMS=sample_runner.c sample.test.o sample.test.exe

.PHONY: test clean

sample.test$(DOTEXE): sample_runner.c sample.test.o
	$(CC) $(CFLAGS) -o $@ $^

test: sample.test$(DOTEXE)
	prove -f -e "" $^

clean:
	$(RM) $(BUILT_ITEMS)
	$(REMOVED_SYM)

