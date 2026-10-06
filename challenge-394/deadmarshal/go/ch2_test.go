package main

import (
	"slices"
	"testing"
)

func alternatingVowelsConsonantsTest(t *testing.T) {
	tests := []struct {
		s    []string
		want []string
	}{
		{[]string{"relocate", "delocate", "allocate"},
			[]string{"locate"}},
		{[]string{"apple", "banana", "cherry"}, []string{}},
		{[]string{"navigate", "cavity", "gravity"}, []string{"avi"}},
		{[]string{"pedalgia", "pedalboard", "pedantic"},
			[]string{"peda"}},
		{[]string{"schoolmaster", "schoolhouse", "schooling"},
			[]string{"ho", "ol"}},
	}

	for _, tt := range tests {
		got := alternatingVowelsConsonants(tt.s)
		if !slices.Equal(got, tt.want) {
			t.Errorf("alternatingVowelsConsonants(%v) = %v; want = %v",
				tt.s, got, tt.want)
		}
	}
}
