import java.io.PrintStream;

public class GuessGame
{
  private int secretNumber;
  private int min;
  private int max;
  private int lastAttempt;
  private int numAttempts;
  
  public GuessGame(int paramInt1, int paramInt2)
  {
    assert (paramInt1 <= paramInt2);
    
    min = paramInt1;
    max = paramInt2;
    secretNumber = (paramInt1 + (int)(Math.random() * (paramInt2 - paramInt1 + 1)));
    numAttempts = 0;
    lastAttempt = (paramInt1 - 1);
  }
  


  public int min()
  {
    return min;
  }
  


  public int max()
  {
    return max;
  }
  


  public boolean validAttempt(int paramInt)
  {
    return (paramInt >= min) && (paramInt <= max);
  }
  


  public boolean finished()
  {
    return lastAttempt == secretNumber;
  }
  


  public boolean attemptIsHigher()
  {
    assert (numAttempts() > 0);
    
    return lastAttempt > secretNumber;
  }
  


  public boolean attemptIsLower()
  {
    assert (numAttempts() > 0);
    
    return lastAttempt < secretNumber;
  }
  


  public void play(int paramInt)
  {
    assert (validAttempt(paramInt));
    assert (!finished());
    
    lastAttempt = paramInt;
    numAttempts += 1;
  }
  



  public int numAttempts()
  {
    return numAttempts;
  }
  









  public static void main(String[] paramArrayOfString)
  {
    System.out.println("Starting tests.");
    GuessGame localGuessGame = new GuessGame(1, 10);
    
    assert (!localGuessGame.finished()) : "game should not be finished yet";
    assert (localGuessGame.min() == 1);
    assert (localGuessGame.max() == 10);
    assert (localGuessGame.numAttempts() == 0) : "there should be no attempts yet";
    for (int i = -10; i <= 20; i++) {
      if (!$assertionsDisabled)
		if (localGuessGame.validAttempt(i) != ((i >= 1) && (i <= 10)))
			throw new AssertionError();
    }
    int i = 0;
    for (int j = 1; j <= 10; j++) {
      if (j != secretNumber) {
        localGuessGame.play(j);
        i++;
        assert (localGuessGame.numAttempts() == i);
        assert (!localGuessGame.finished()) : "game should not be finished yet";
        if (!$assertionsDisabled) if (j < secretNumber != localGuessGame.attemptIsLower()) throw new AssertionError();
        if (!$assertionsDisabled) if (j > secretNumber != localGuessGame.attemptIsHigher()) { throw new AssertionError();
          }
      }
    }
    localGuessGame.play(secretNumber);
    i++;
    assert (localGuessGame.finished()) : "game should be finished now";
    assert (localGuessGame.numAttempts() == i);
    System.out.println("No error detected!");
  }
}
