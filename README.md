TESTickle
=========

[![Build Status](https://travis-ci.org/MarkWithall/TESTickle.svg?branch=master)](https://travis-ci.org/MarkWithall/TESTickle)

A unit testing library for C.  Output is in the [Test Anything Protocol](https://testanything.org/) format.

Installation
------------

### Windows

Download and install [Strawberry Perl](http://strawberryperl.com); this comes with `gcc` and `gmake` too. You will need to install the required CPAN libraries with: `cpan Template`

### OS X

The recommended route is via [Perlbrew](http://perlbrew.pl).

-   `curl -L http://install.perlbrew.pl | bash`
-   `perlbrew install-cpanm`
-   `perlbrew install perl-5.22.0`
-   `perlbrew switch perl-5.22.0`
-   `cpanm install Template`

Getting Started
---------------

### Initialising The Project

To start a new project using TESTickle, perform the following commands.

Create a git repository.

```bash
git init
```

Or clone a repository created in GitHub (or similar).

Add TESTickle as a submodule.

```bash
git submodule add https://github.com/MarkWithall/TESTickle.git
```

Commit the addition of TESTickle.

```bash
git commit -a -m "Add TESTickle submodule."
```

### Creating A Makefile

By default the submodule will be in the `TESTickle` folder.  The file `TESTickle.mk` contains make commands for building tests.  Import that file into the project `Makefile` using:

```make
include TESTickle/TESTickle.mk
```

The extension `.test.c` is used for test fixtures.  To build a test fixture, e.g., `foo.test.c` add the following line to the `Makefile`:

```make
foo.test: $(call test_files_for,foo.test.c)
	$(CC) $(CFLAGS) -o $@ $^
```

And to run the tests, include the following rule:

```make
test:
  prove -f -e "" foo.test
```

### Writing Tests

To create a test fixture, create a file with the extension `.test.c` and include TESTickle:

```c
include "TESTickle/TESTickle.h"
```

Adjust the include path or add a `-I` switch to the `CFLAGS` variable in the `Makefile` as necessary.

It is necessary to implement the `setup` and `teardown` functions, even if they are empty.

```c
void setup() { }
void teardown() { }
```

To write a test, use the header and footer macros as follows:

```c
TEST(my_first_test)
END_TEST
```

Assertions are then used to assert things in the test:

```c
TEST(one_plus_one_equals_two)
    int result = 1 + 1;
    ASSERT_EQUAL(result, 2, "%d", "1 + 1 = 2");
END_TEST
```
