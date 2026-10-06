module ch1;

import std::io;
import std::math;
import std::collections::list;

fn sz alternate_case(Allocator allocator,String s)
{
  List{sz} pos;
  pos.init(allocator);
  defer pos.free();
  
  foreach(i,c : s) if(c >= 'A' && c <= 'Z') pos.push(i);
  
  sz even;
  sz odd;

  foreach(i,p : pos)
  {
    even += math::abs(p - 2 * i);
    odd += math::abs(p - (2 * i + 1));
  }

  return math::min(even,odd);
}

fn int main(String[] args)
{
  io::printn(alternate_case(tmem,"aAbB"));
  io::printn(alternate_case(tmem,"AAbb"));
  io::printn(alternate_case(tmem,"AAAbbb"));
  io::printn(alternate_case(tmem,"aABb"));
  io::printn(alternate_case(tmem,"bBBAaa"));
  return 0;
}

