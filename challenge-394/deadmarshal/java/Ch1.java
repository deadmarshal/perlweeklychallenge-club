public class Ch1 {
  public static void main(String[] args) {
    System.out.println(alternateCase("aAbB"));
    System.out.println(alternateCase("AAbb"));
    System.out.println(alternateCase("AAAbbb"));
    System.out.println(alternateCase("aABb"));
    System.out.println(alternateCase("bBBAaa"));
  }

  private static int alternateCase(String s) {
    int costEven = 0,costOdd = 0, k = 0;
    for(int i = 0; i < s.length(); i++) {
      char c = s.charAt(i);
      if(c >= 'A' && c <= 'Z') {
	costEven += Math.abs(i - 2 * k);
	costOdd += Math.abs(i - (2 * k + 1));
	k++;
      }
    }
    return Math.min(costEven,costOdd);
  }
}

