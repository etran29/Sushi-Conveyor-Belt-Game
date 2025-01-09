public class SpamRoll extends Sushi
{
  SpamRoll(float sushiX,float sushiY,float xSpeed)
  {
    super(sushiX,sushiY,xSpeed);//Call the constructor of the parent class (Sushi) with the given parameters
     // Load and resize the image specific to SpamRoll sushi
    sushi = loadImage("sushi.png");
    sushi.resize(50, 50);
  }
  
  void display()//Displays the SpamRoll sushi
  {
    imageMode(CENTER);
    image(sushi, sushiX, sushiY);
      //  println("x"+sushiX+" y"+y);
  }
}
