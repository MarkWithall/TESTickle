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

To start a new project using TESTickle, perform the following commands.

Create a git repository.

```
git init
```

Or clone a repository created in GitHub (or similar).

Add TESTickle as a submodule.

```
git submodule add https://github.com/MarkWithall/TESTickle.git
```

Commit the addition of TESTickle.

```
git commit -a -m "Add TESTickle submodule."
```
