#include <stdlib.h>

#include "TESTickle.h"

int test_number = 1;

[% FOREACH test IN tests %]struct test_result [% test.name %]();
[% END %]
int main(void)
{
    TEST_FIXTURE([% number_of_tests %]);

[% FOREACH test IN tests %]    RUN_TEST([% test.name %]);
[% END %]
    exit(EXIT_SUCCESS);
}

