import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

public class Ch2 {
  public static void main(String[] args) {
    System.out.println(
      alternatingVowelsConsonants(
	List.of("relocate", "delocate", "allocate")));
    System.out.println(
      alternatingVowelsConsonants(
	List.of("apple", "banana", "cherry")));
    System.out.println(
      alternatingVowelsConsonants(
	List.of("navigate", "cavity", "gravity")));
    System.out.println(
      alternatingVowelsConsonants(
	List.of("pedalgia", "pedalboard", "pedantic")));
    System.out.println(
      alternatingVowelsConsonants(
	List.of("schoolmaster", "schoolhouse", "schooling")));
  }
    
  private static boolean isVowel(char c) {
    return "aeiouAEIOU".indexOf(c) >= 0;
  }

  private static List<String>
  alternatingVowelsConsonants(List<String> strs) {
    List<String> sorted = new ArrayList<>(strs);
    sorted.sort(Comparator.comparingInt(String::length));

    String src = sorted.get(0);
    List<String> others = sorted.stream()
      .skip(1)
      .map(s -> s.toLowerCase(Locale.ROOT))
      .toList();

    int maxLen = 0;
    Set<String> best = new LinkedHashSet<>();
    int n = src.length();

    for(int i = 0; i < n; i++) {
      for(int j = i; j < n; j++) {
	if(j > i &&
	   isVowel(src.charAt(j)) == isVowel(src.charAt(j-1))) break;
	
	int length = j - i + 1;
	if(length < maxLen) continue;

	String sub = src.substring(i,j+1);
	String lsub = sub.toLowerCase(Locale.ROOT);
	if(!others.stream().allMatch(o -> o.contains(lsub))) continue;

	if(length > maxLen) {
	  maxLen = length;
	  best.clear();
	}
	
	best.add(sub);
      }
    }
    return new ArrayList<>(best);
  }
}

