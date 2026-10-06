import gleeunit
import gleeunit/should
import gleam/list
import ch2

pub fn main() -> Nil {
  gleeunit.main()
}


pub fn alternating_vowels_consonants_test() {
  [
    ["relocate", "delocate", "allocate"],
    ["apple", "banana", "cherry"],
    ["navigate", "cavity", "gravity"],
    ["pedalgia", "pedalboard", "pedantic"],
    ["schoolmaster", "schoolhouse", "schooling"],
  ]
  |> list.map(fn(e) { ch2.alternating_vowels_consonants(e) })
  |> should.equal([["locate"], [], ["avi"], ["peda"], ["ho", "ol"]])
}

