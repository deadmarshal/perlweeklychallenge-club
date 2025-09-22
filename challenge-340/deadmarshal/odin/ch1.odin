package main

import "core:fmt"
import "core:unicode/utf8"

duplicate_removals :: proc(str: string) -> string {
	stk := [dynamic]rune{}
	defer delete(stk)
	for c in str {
		if len(stk) > 0 && stk[len(stk) - 1] == c do pop(&stk)
		else do append_elem(&stk, c)
	}
	return utf8.runes_to_string(stk[:])
}

main :: proc() {
	fmt.println(duplicate_removals("abbaca"))
	fmt.println(duplicate_removals("azxxzy"))
	fmt.println(duplicate_removals("aaaaaaaa"))
	fmt.println(duplicate_removals("aabccba"))
	fmt.println(duplicate_removals("abcddcba"))
}
