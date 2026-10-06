package main

import (
	"sort"
	"strings"
)

func iv(c byte) bool {
	if strings.IndexByte("aeiouAEIOU", c) >= 0 {
		return true
	}
	return false
}

func alternatingVowelsConsonants(strs []string) []string {
	sorted := make([]string, len(strs))
	copy(sorted, strs)
	sort.SliceStable(sorted, func(a, b int) bool {
		return len(sorted[a]) < len(sorted[b])
	})

	src := sorted[0]
	others := make([]string, 0, len(sorted)-1)
	for _, o := range sorted[1:] {
		others = append(others, strings.ToLower(o))
	}

	max, best, seen, n := 0, []string{}, map[string]bool{}, len(src)

	for i := 0; i < n; i++ {
		for j := i; j < n; j++ {
			if j > i && iv(src[j]) == iv(src[j-1]) {
				break
			}
			length := j - i + 1
			if length < max {
				continue
			}

			sub := src[i : i+length]
			lsub := strings.ToLower(sub)
			ok := true
			for _, o := range others {
				if !strings.Contains(o, lsub) {
					ok = false
					break
				}
			}

			if !ok {
				continue
			}

			if length > max {
				max = length
				best = []string{}
				seen = map[string]bool{}
			}
			if !seen[sub] {
				seen[sub] = true
				best = append(best, sub)
			}
		}
	}
	return best
}
