#!/usr/bin/env perl

use strict;
use warnings;
use Carp;
use Template;

croak "Usage: $0 <test.c>" unless (@ARGV == 1);

my $fixture = $ARGV[0];
$fixture =~ s/\.c$//;

my @tests = ();

open (FILE, $ARGV[0]) || croak $!;
while (my $line = <FILE>) {
    push @tests, {name => $1} if ($line =~ /^TEST\(([^)]+)\)/);
}
close (FILE);

my $template = Template->new();
my $template_vars = {number_of_tests => scalar(@tests), tests => \@tests};
$template->process(\*DATA, $template_vars) || croak $template->error();

__END__
#include <stdlib.h>

#include "TESTickle.h"

[% FOREACH test IN tests %]struct test_result [% test.name %]();
[% END %]
int main(void)
{
    int test_number = 1;

    TEST_FIXTURE([% number_of_tests %]);

[% FOREACH test IN tests %]    RUN_TEST([% test.name %], test_number++);
[% END %]
    exit(EXIT_SUCCESS);
}
