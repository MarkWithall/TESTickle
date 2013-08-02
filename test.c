#include "TESTickle.h"

#include <stdlib.h>

int test_number = 1;

void setup() { }
void teardown() { }

TEST(passing_test)
    ASSERT_TRUE(1 == 1, "One should be the same as itself");
END_TEST

TEST(failing_test)
    ASSERT_TRUE(1 != 1, "One should not be the same as itself");
END_TEST

TEST(equal_failure_test)
    ASSERT_EQUAL(1, 2, "%d", "One should equal Two");
END_TEST

int main(void)
{
    TEST_FIXTURE(3);

    RUN_TEST(passing_test);
    RUN_TEST(failing_test);
    RUN_TEST(equal_failure_test);

    exit(EXIT_SUCCESS);
}
