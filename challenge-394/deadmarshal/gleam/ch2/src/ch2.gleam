import gleam/int
import gleam/list
import gleam/string

fn is_vowel(c: String) -> Bool {
  case string.lowercase(c) {
    "a" | "e" | "i" | "o" | "u" -> True
    _ -> False
  }
}

fn tails(xs: List(a)) -> List(List(a)) {
  case xs {
    [] -> []
    [_, ..t] -> [xs, ..tails(t)]
  }
}

fn alt_run(xs: List(String)) -> List(String) {
  case xs {
    [] -> []
    [h, ..t] -> [h, ..run(h, t)]
  }
}

fn run(prev: String, rest: List(String)) -> List(String) {
  case rest {
    [] -> []
    [c, ..rest] ->
      case is_vowel(prev) != is_vowel(c) {
        True -> [c, ..run(c, rest)]
        False -> []
      }
  }
}

fn prefixes(xs: List(a)) -> List(List(a)) {
  list.index_map(xs, fn(_, i) { list.take(xs, i + 1) })
}

pub fn alternating_vowels_consonants(xs: List(String)) -> List(String) {
  let sorted =
    xs
    |> list.map(string.lowercase)
    |> list.sort(fn(a, b) { int.compare(string.length(a), string.length(b)) })

  case sorted {
    [] -> []
    [src, ..others] -> {
      let candidates =
        src
        |> string.to_graphemes
        |> tails
        |> list.flat_map(fn(t) {
          t
          |> alt_run
          |> prefixes
          |> list.map(string.concat)
        })

      let common =
        list.filter(candidates, fn(p) {
          p != "" && list.all(others, fn(o) { string.contains(o, p) })
        })

      case common {
        [] -> []
        _ -> {
          let max = common |> list.map(string.length) |> list.fold(0, int.max)

          common
          |> list.filter(fn(p) { string.length(p) == max })
          |> list.sort(string.compare)
          |> list.unique
        }
      }
    }
  }
}

