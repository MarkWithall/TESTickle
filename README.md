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

### Assertions

There are several built-in assertions in TESTickle.

#### ASSERT_TRUE

```c
ASSERT_TRUE(test, message)
```

This takes an expression that returns a boolean-equivalent type and a failure message string.

For example:

```c
ASSERT_TRUE(2 > 1, "2 should be greater than 1");
```

#### ASSERT_FALSE

```c
ASSERT_FALSE(test, message)
```

Similarly to `ASSERT_TRUE`, this takes an expression that returns a boolean-equivalent type and a failure message string.

For example:

```c
ASSERT_FALSE(2 == 1, "2 should not be equal to 1");
```

#### ASSERT_EQUAL

```c
ASSERT_EQUAL(actual, expected, type, message)
```

Assert that two values are equal by `==`.

For example:

```c
ASSERT_EQUAL(1, 1, "1 should be equal to 1");
```

#### ASSERT_NOT_EQUAL

```c
ASSERT_NOT_EQUAL(actual, expected, message)
```

Assert that two values are not equal by `!=`.

For example:

```c
ASSERT_NOT_EQUAL(2, 1, "2 should not be equal to 1");
```

#### ASSERT_STRING_EQUAL

```c
ASSERT_STRING_EQUAL(actual, expected, message)
```

Assert that two null-terminated character arrays are equal by `strncmp`; with a maximum length of `MESSAGE_LENGTH` (default 128).

For example:

```c
ASSERT_STRING_EQUAL("Hello", "Hello", "'Hello' should be equal to 'Hello'");
```

#### ASSERT_STRING_EMPTY

```c
ASSERT_STRING_EMPTY(actual, message)
```

Assert that a null-terminated character array is empty.

For example:

```c
ASSERT_STRING_EMPTY("", "String should be empty");
```

#### ASSERT_STRING_NOT_EMPTY

```c
ASSERT_STRING_NOT_EMPTY(actual, message)
```

Assert that a null-terminated character array is not empty.

For example:

```c
ASSERT_STRING_NOT_EMPTY("foo", "String should not be empty");
```

#### ASSERT_NULL

```c
ASSERT_NULL(expr, message)
```

Assert that a pointer is null.

For example:

```c
ASSERT_NULL(ptr, "Pointer should be null");
```

#### ASSERT_NOT_NULL

```c
ASSERT_NOT_NULL(expr, message)
```

Assert that a point is not null.

For example:

```c
ASSERT_NOT_NULL(ptr, "Pointer should no be null");
```
