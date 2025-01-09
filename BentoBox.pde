public class BentoBox
{
  float bX; //inital x-coordinate for bento box
  float bY; //inital y-coordinate for bento box
  float speed=2; //speed of bento box
  int size = 120; //size of bento box
  
  BentoBox(int x,float y)
  {
    this.bX = x;
    this.bY = y;
    
    //load and resize the bento box image
    bento = loadImage("bentoBox.jpg");
    bento.resize(size,size);
  }
  
  void displayBento()
  {
    imageMode(CENTER);
    image(bento, bX,bY); //displays the image of bento box
  }
  
  
  // The bento box moves from right to left
  // If the bento box moves beyond the left edge of the screen; the game is over
  void moveBento()
  {
   this.bX -= this.speed;
   if (bX<-size)
   {gameMode = LOSE;}
   
  }
  
  void update()
  {
    moveBento();
    displayBento();
  }
  
  //Boolean collision between the bento box and a sushi object
  boolean crash(Sushi sushi)
  {
    return abs(this.bX-sushi.sushiX)<bento.width/2 && abs(this.bY - sushi.sushiY)<bento.height/2;
  }
  
  //Boolean collision between the bento box and a rat object
   boolean crash(Rat rat)
  {
    return abs(this.bX-rat.ratX)<bento.width/2 && abs(this.bY - rat.ratY)<bento.height/2;
  }
  
}
