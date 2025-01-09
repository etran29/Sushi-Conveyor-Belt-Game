public class Score
{
  private int value;
  
  Score()
  { 
    value = 0;
  }
  
  void increaseScore()
  {
    value += 150;
  }
  
  int getScore()
  {
    return value;
  }
  
  void reset()
  {
    value = 0;
  }
  
  
}
