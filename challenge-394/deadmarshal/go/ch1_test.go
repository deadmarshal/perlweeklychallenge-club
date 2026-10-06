package main

import (
	"testing"
)

func alternateCaseTest(t *testing.T) {
	tests := []struct {
		s    string
		want int
	}{
		{"aAbB", 0},
		{"AAbb", 1},
		{"AAAbbb", 3},
		{"aABb", 1},
		{"bBBAaa", 2},
	}
	for _, tt := range tests {
		got := alternateCase(tt.s)
		if got != tt.want {
			t.Errorf("alternateCase(%v) = %v; want = %v",
				tt.s, got, tt.want)
		}
	}
}
