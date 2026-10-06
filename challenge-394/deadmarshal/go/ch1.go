package main

func alternateCase(s string) int {
	var pos []int
	for i, c := range s {
		if c >= 'A' && c <= 'Z' {
			pos = append(pos, i)
		}
	}
	abs := func(x int) int {
		if x < 0 {
			return -x
		}
		return x
	}

	costEven, costOdd := 0, 0

	for i, p := range pos {
		costEven += abs(p - 2*i)
		costOdd += abs(p - (2*i + 1))
	}

	if costEven < costOdd {
		return costEven
	}
	return costOdd
}
