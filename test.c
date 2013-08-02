#include "TESTickle.h"

#include <stdlib.h>

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

TEST(string_equal_failure)
    ASSERT_STRING_EQUAL("Hello", "World", "Hello should equal World");
END_TEST