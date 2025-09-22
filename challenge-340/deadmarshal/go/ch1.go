package main

import (
	"fmt"
)

func duplicateRemovals(str string) string {
	stk := []rune{}
	for _, c := range str {
		if len(stk) > 0 && stk[len(stk)-1] == c {
			stk = stk[:len(stk)-1]
		} else {
			stk = append(stk, c)
		}
	}
	return string(stk)
}

func main() {
	fmt.Println(duplicateRemovals("abbaca"))
	fmt.Println(duplicateRemovals("azxxzy"))
	fmt.Println(duplicateRemovals("aaaaaaaa"))
	fmt.Println(duplicateRemovals("aabccba"))
	fmt.Println(duplicateRemovals("abcddcba"))
}
