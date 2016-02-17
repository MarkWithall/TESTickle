TESTickle
=========

[![Build Status](https://travis-ci.org/MarkWithall/TESTickle.svg?branch=master)](https://travis-ci.org/MarkWithall/TESTickle)

A unit testing library for C.

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
