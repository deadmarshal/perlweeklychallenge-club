module ch2;

import std::io;
import std::collections::list;

fn bool is_vowel(char c) @inline
{
  switch (ascii::to_lower(c))
  {
    case 'a':
    case 'e':
    case 'i':
    case 'o':
    case 'u':
      return true;
    default:
      return false;
  }
}

fn bool matches_fold(String a, String b) @inline @local
{
  foreach (i, c : a)
  {
    if (ascii::to_lower(c) != ascii::to_lower(b[i])) return false;
  }
  return true;
}

fn bool contains_fold(String hay, String needle) @local
{
  if (needle.len > hay.len) return false;
  for (sz i = 0; i + needle.len <= hay.len; i++)
  {
    if (matches_fold(hay[i:needle.len], needle)) return true;
  }
  return false;
}

fn List{String} alternating_vowels_consonants(Allocator allocator,
					      String[] strs)
{
  List{String} best;
  best.init(allocator);
  if (!strs.len) return best;

  sz src_idx = 0;
  foreach (i, s : strs) if (s.len < strs[src_idx].len) src_idx = i;
  String src = strs[src_idx];

  sz max;
  for (sz i = 0; i < src.len; i++)
  {
    for (sz j = i; j < src.len; j++)
    {
      if (j > i && is_vowel(src[j]) == is_vowel(src[j - 1])) break;

      sz len = j - i + 1;
      if (len < max) continue;

      String sub = src[i:len];

      bool ok = true;
      foreach (k, o : strs)
      {
        if (k == src_idx) continue;
        if (!contains_fold(o, sub))
        {
          ok = false;
          break;
        }
      }
      if (!ok) continue;

      if (len > max)
      {
        max = len;
        best.clear();
      }

      bool seen = false;
      foreach (b : best) if (b == sub) { seen = true; break; }
      if (!seen) best.push(sub);
    }
  }
  return best;
}

fn int main(String[] args)
{
  String[][] tests = {{"relocate", "delocate", "allocate"},
    {"apple", "banana", "cherry"},
    {"navigate", "cavity", "gravity"},
    {"pedalgia", "pedalboard", "pedantic"},
    {"schoolmaster", "schoolhouse", "schooling"}};

  foreach(t : tests)
  {
    List{String} res = alternating_vowels_consonants(tmem,t);
    defer res.free();
    io::printn(res);
  }
  return 0;
}

