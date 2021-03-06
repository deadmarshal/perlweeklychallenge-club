#!/usr/bin/awk

#
# See ../README.md
#

#
# Run as: awk -f ch-2.awk < input-file
#

#
# Read input from standard input, assuming one exercise per line.
# Each line consists of a string $S, and a pattern $T, separated
# by whitespace.
#

#
# Recursively count matches:
#   - If either the string or the pattern is empty, there are no matches.
#   - Else, + count the matches if we don't match at the first character
#             if the string.
#           + if the first character of the string equals the first
#             character of the pattern:
#             o  add 1 if the pattern is just one character long
#             o  else, add the number of matches starting from the
#                then next character in the string, and the next
#                character in the pattern.
#

#
# Note that we do not have lexical variables in AWK, so we're
# using a global count variable.
#
function matches (string, pattern) {
    if (length (string) == 0 || length (pattern) == 0) {
        return 0
    }
    matches(substr (string, 2), pattern)
    if (substr (string, 1, 1) == substr (pattern, 1, 1)) {
        if (length (pattern) == 1) {
            count ++
        }
        else {
            matches(substr (string, 2), substr (pattern, 2))
        }
    }
}

{
    count = 0
    matches($1, $2)
    print count
}
