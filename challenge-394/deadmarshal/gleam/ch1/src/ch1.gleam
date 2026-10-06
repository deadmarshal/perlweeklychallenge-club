import gleam/int
import gleam/list
import gleam/string

fn upper_positions(s: String) -> List(Int) {
  s
  |> string.to_utf_codepoints
  |> list.index_map(fn(c, i) { #(string.utf_codepoint_to_int(c), i) })
  |> list.filter_map(fn(pair) {
    let #(code, i) = pair
    case code >= 65 && code <= 90 {
      True -> Ok(i)
      False -> Error(Nil)
    }
  })
}

fn cost(upper: List(Int), start: Int) -> Int {
  upper
  |> list.index_map(fn(u, k) { int.absolute_value(u - { start + 2 * k }) })
  |> list.fold(0, fn(acc, x) { acc + x })
}

pub fn alternate_case(s: String) -> Int {
  let uppers_pos = upper_positions(s)
  int.min(cost(uppers_pos, 0), cost(uppers_pos, 1))
}

