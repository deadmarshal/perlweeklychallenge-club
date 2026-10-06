import gleeunit
import gleam/list
import gleeunit/should
import ch1

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn alternate_case_test() {
  ["aAbB", "AAbb", "AAAbbb", "aABb", "bBBAaa"]
  |> list.map(ch1.alternate_case)
  |> should.equal([0, 1, 3, 1, 2])
}

