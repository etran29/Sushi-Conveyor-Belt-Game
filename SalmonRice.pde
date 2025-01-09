public class SalmonRice extends Sushi
{
  SalmonRice(float sushiX, float sushiY, float xSpeed)
  {
    super(sushiX, sushiY, xSpeed);//Call the constructor of the parent class (Sushi) with the given parameters
    // Load and resize the image specific to SalmonRice sushi
    sushi2 = loadImage("salmon.png");
    sushi2.resize(50, 50);
  }

  void display() //Displays the SalmonRice sushi
  {
    imageMode(CENTER);
    image(sushi2, sushiX, sushiY);
  }
}
