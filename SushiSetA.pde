public class SetA extends Sushi
{
  SetA(float sushiX,float sushiY,float xSpeed)
  {
    super(sushiX,sushiY,xSpeed);//Call the constructor of the parent class (Sushi) with the given parameters
     // Load and resize the image specific to SpamRoll sushi
    sushi3 = loadImage("SetA.png"); //load sushi setA
    sushi3.resize(50, 50);
  }
  
  void display()//Displays the SetA sushi
  {
    imageMode(CENTER); //set image to centre
    image(sushi3, sushiX, sushiY);
  }
}
