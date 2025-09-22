package main

import (
	"fmt"
	"math"
	"strconv"
	"strings"
)

func ascendingNumbers(str string) bool {
	prev := math.MinInt64
	for _, e := range strings.Fields(str) {
		if e[0] <= '9' {
			curr, _ := strconv.Atoi(e)
			if prev >= curr {
				return false
			}
			prev = curr
		}
	}
	return true
}

func main() {
	fmt.Println(ascendingNumbers("The cat has 3 kittens 7 toys 10 beds"))
	fmt.Println(ascendingNumbers("Alice bought 5 apples 2 oranges 9 bananas"))
	fmt.Println(ascendingNumbers("I ran 1 mile 2 days 3 weeks 4 months"))
	fmt.Println(ascendingNumbers("Bob has 10 cars 10 bikes"))
	fmt.Println(ascendingNumbers("Zero is 0 one is 1 two is 2"))
}
