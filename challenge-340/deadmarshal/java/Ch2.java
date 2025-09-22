public class Ch2 {
  public static void main(String[] args) {    
    System.out.println(ascending_numbers("The cat has 3 kittens 7 toys 10 beds"));
    System.out.println(ascending_numbers("Alice bought 5 apples 2 oranges 9 bananas"));
    System.out.println(ascending_numbers("I ran 1 mile 2 days 3 weeks 4 months"));
    System.out.println(ascending_numbers("Bob has 10 cars 10 bikes"));
    System.out.println(ascending_numbers("Zero is 0 one is 1 two is 2"));
  }
  
  private static boolean ascending_numbers(String str) {
    int prev = Integer.MIN_VALUE;
    for(var e : str.split(" ")) {
      if(e.charAt(0) <= '9') {
	int curr = Integer.parseInt(e);
	if(prev >= curr) return false;
	prev = curr;
      }
    }
    return true;
  }
}

