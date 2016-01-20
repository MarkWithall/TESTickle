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

.PHONY: test clean

sample.test$(DOTEXE): sample_runner.c sample.test.o
	$(CC) $(CFLAGS) -o $@ $^

test: sample.test$(DOTEXE)
	prove -f -e "" $^

clean:
	$(RM) *_runner.c *.test.o *.test$(DOTEXE)
	$(REMOVED_SYM)

