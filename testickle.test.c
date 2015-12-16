#include "TESTickle.h"

#include <stdlib.h>

void setup() { }
void teardown() { }

TEST(passing_true_test)
    ASSERT_TRUE(1 == 1, "One should be the same as itself");
END_TEST

TEST(failing_true_test)
    ASSERT_TRUE(1 != 1, "One should not be the same as itself");
END_TEST

TEST(passing_false_test)
    ASSERT_FALSE(1 != 1, "One should be the same as itself");
END_TEST

TEST(failing_false_test)
    ASSERT_FALSE(1 == 1, "One should not be the same as itself");
END_TEST

TEST(passing_equal_test)
    ASSERT_EQUAL(3.14, 3.14, "%f", "Pi should be the same as itself");
END_TEST

TEST(failing_equal_test)
    ASSERT_EQUAL(1, 2, "%d", "One should equal two");
END_TEST

TEST(passing_not_equal_test)
    ASSERT_NOT_EQUAL(1, 2, "One should not equal two");
END_TEST

TEST(failing_not_equal_test)
    ASSERT_NOT_EQUAL(3.14, 3.14, "Pi should not be the same as itself");
END_TEST

TEST(passing_string_equal_test)
    ASSERT_STRING_EQUAL("Hello", "Hello", "Hello should equal itself");
END_TEST

TEST(failing_string_equal_test)
    ASSERT_STRING_EQUAL("Hello", "World", "Hello should equal World");
END_TEST

TEST(passing_string_empty_test)
    ASSERT_STRING_EMPTY("", "String should be empty");
END_TEST

TEST(failing_string_empty_test)
    ASSERT_STRING_EMPTY("Hello", "String should be empty");
END_TEST

TEST(passing_string_not_empty_test)
    ASSERT_STRING_NOT_EMPTY("Hello", "String should not be empty");
END_TEST

TEST(failing_string_not_empty_test)
    ASSERT_STRING_NOT_EMPTY("", "String should not be empty");
END_TEST

TEST(passing_null_test)
    ASSERT_NULL(NULL, "Pointer should be NULL");
END_TEST

TEST(failing_null_test)
    const char string[] = "Hello";
    ASSERT_NULL(string, "Pointer should be NULL");
END_TEST

TEST(passing_not_null_test)
    const char string[] = "Hello";
    ASSERT_NOT_NULL(string, "Pointer should not be NULL");
END_TEST

TEST(failing_not_null_test)
    ASSERT_NOT_NULL(NULL, "Pointer should not be NULL");
END_TEST
            