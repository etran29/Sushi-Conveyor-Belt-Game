public class Timer
{
  float reset; //stores the reset time 
  float initialTime; //stores the intial time 
  
  Timer( float set)
  {
    this.initialTime = set; 
    this.reset = 10;
  }
  
  float getTime()
  {
    return(initialTime); //returns the current time on the timer
  }
  
  void setTime(float set) //sets the initial time 
  {
    initialTime=set;
  }
  void countDown()
  {
    if (frameRate != 0){
    initialTime -= 1/frameRate; //simulating a count down
  }
  }
  
   void reset(int reset) {
    initialTime = reset; //reset timer to a specified value
  }
  
  

}
