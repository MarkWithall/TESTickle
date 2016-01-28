include ../TESTickle.mk

CFLAGS += -I ..
SCRIPTPATH=..

ifeq ($(OS),Windows_NT)
	RM := cmd /C del
	DOTEXE := .exe
else
	RM := rm -f
	DOTEXE :=
endif

.PHONY: test clean

sample.test$(DOTEXE): $(call test_files_for,sample.test.c)
	$(CC) $(CFLAGS) -o $@ $^

test: sample.test$(DOTEXE)
	prove -f -e "" $(<D)/$(<F)

clean:
	$(RM) $(TESTICKLE_BUILT_ITEMS)

