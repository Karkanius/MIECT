import java.io.PrintStream;

public class p51 {
  public p51() {}
  
  private static final java.util.Scanner scin = new java.util.Scanner(System.in);
  
  public static void help(GuessGame paramGuessGame) {
    assert (paramGuessGame != null);
    System.out.printf("Find the secret number in range [%d,%d]!\n", new Object[] {
      Integer.valueOf(paramGuessGame.min()), Integer.valueOf(paramGuessGame.max()) });
    System.out.printf("Available commands:\n", new Object[0]);
    System.out.printf("  <number>   (new attempt to guess secret)\n", new Object[0]);
    System.out.printf("  count      (show current number of attempts)\n", new Object[0]);
    
    System.out.printf("  help       (information on command usage)\n", new Object[0]);
    System.out.printf("  quit       (exits the program)\n", new Object[0]);
  }
  
  public static void main(String[] paramArrayOfString) {
    if ((paramArrayOfString.length != 0) && (paramArrayOfString.length != 2)) {
      System.out.println("Usage: p51 [ <min> <max> ]");
      System.out.println("(by default range [0,20] is used)");
      System.exit(1);
    }
    int i = 0;
    int j = 20;
    if (paramArrayOfString.length == 2) {
      i = string2Int(paramArrayOfString[0], "min");
      j = string2Int(paramArrayOfString[1], "max");
    }
    if (i > j) {
      System.out.printf("ERROR: invalid range: [%d,%d]\n", new Object[] { Integer.valueOf(i), Integer.valueOf(j) });
      System.exit(1);
    }
    GuessGame localGuessGame = new GuessGame(i, j);
    
    System.out.println();
    help(localGuessGame);
    System.out.println();
    while (!localGuessGame.finished()) {
      System.out.print("Command? ");
      String str1 = scin.next();
      System.out.println();
      switch (str1) {
      case "quit": 
        System.exit(1);
        break;
      case "help": 
        help(localGuessGame);
        break;
      case "count": 
        System.out.printf("Number of attempts: %d\n", new Object[] { Integer.valueOf(localGuessGame.numAttempts()) });
        break;
      default: 
        int m = 0;
        try {
          m = Integer.parseInt(str1);
          if (!localGuessGame.validAttempt(m)) {
            System.out.printf("ERROR: %d is invalid!\n", new Object[] { Integer.valueOf(m) });
          } else {
            localGuessGame.play(m);
            if (localGuessGame.attemptIsHigher()) {
              System.out.printf("%d is too high!\n", new Object[] { Integer.valueOf(m) });
            } else if (localGuessGame.attemptIsLower())
              System.out.printf("%d is too low!", new Object[] { Integer.valueOf(m) });
          }
        } catch (NumberFormatException localNumberFormatException) {
          System.err.printf("ERROR: invalid input (\"%s\")\n", new Object[] { str1 });
        }
      }
      
      System.out.println();
    }
    System.out.printf("Game finished in %d attempts\n", new Object[] { Integer.valueOf(localGuessGame.numAttempts()) });
    System.out.println();
  }
  
  public static int string2Int(String paramString1, String paramString2) {
    int i = 0;
    try {
      i = Integer.parseInt(paramString1);
    } catch (NumberFormatException localNumberFormatException) {
      System.err.printf("ERROR: invalid %s argument (\"%s\")\n", new Object[] { paramString2, paramString1 });
      System.exit(1);
    }
    return i;
  }
}
