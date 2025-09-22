public class Ch1 {
  public static void main(String[] args) {
    System.out.println(duplicate_removals("abbaca"));
    System.out.println(duplicate_removals("azxxzy"));
    System.out.println(duplicate_removals("aaaaaaaa"));
    System.out.println(duplicate_removals("aabccba"));
    System.out.println(duplicate_removals("abcddcba"));
  }

  private static String duplicate_removals(String str) {
    StringBuilder sb = new StringBuilder();
    for (char c : str.toCharArray()) {
      if ((sb.length() > 0) && (sb.charAt(sb.length() - 1) == c))
        sb.deleteCharAt(sb.length() - 1);
      else
        sb.append(c);
    }
    return sb.toString();
  }
}
