package main

import "core:fmt"
import "core:strconv"
import "core:strings"

ascending_numbers :: proc(str: string) -> bool {
	prev := min(int)

	tokens := strings.split(str, " ")
	defer delete(tokens)

	for token in tokens {
		curr, ok := strconv.parse_int(token)
		if !ok do continue

		if prev >= curr do return false
		prev = curr
	}

	return true
}

main :: proc() {
	fmt.println(ascending_numbers("The cat has 3 kittens 7 toys 10 beds"))
	fmt.println(ascending_numbers("Alice bought 5 apples 2 oranges 9 bananas"))
	fmt.println(ascending_numbers("I ran 1 mile 2 days 3 weeks 4 months"))
	fmt.println(ascending_numbers("Bob has 10 cars 10 bikes"))
	fmt.println(ascending_numbers("Zero is 0 one is 1 two is 2"))
}
