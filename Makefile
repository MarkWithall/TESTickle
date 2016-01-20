include TESTickle.mk

ifeq ($(OS),Windows_NT)
	RM := cmd /C del
	DOTEXE := .exe
else
	RM := rm -f
	DOTEXE :=
endif

.PHONY: test clean

sample.test$(DOTEXE): sample.test.runner.c sample.test.o
	$(CC) $(CFLAGS) -o $@ $^

test: sample.test$(DOTEXE)
	prove -f -e "" $^

clean:
	$(RM) $(TESTICKLE_BUILT_ITEMS) 

