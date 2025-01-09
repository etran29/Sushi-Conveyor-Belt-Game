abstract class Sushi //abstract parent class //<>//
{
  //Members of sushi
  private float originX; //this is the initial x-coordinate of sushi
  private float originY; //this is the initial y-coordinate of sushi
  float sushiX; //this is the current x-coordinate of sushi
  float sushiY; //this is the current y-coordinate of sushi
  float xSpeed; //the speed of sushi
  private boolean dragging = true; //flag to indicate whether the user has dragged the sushi 
  
  int imgCounter;
  PImage[] images = new PImage[3];
  
  //Constructors of sushi
  Sushi(float x, float y, float speedX) 
  {
    this.originX = x;
    this.originY = y;
    this.sushiX = x;
    this.sushiY = y;
    this.xSpeed = speedX;
    dragging = false;
    
     for (int i=0;i<images.length;i++)
    {
      images[i] = loadImage("stars "+(i+1)+".png");
      
    }
  }
  
  //move method to move sushi based on speed
  void move() 
  {
    this.sushiX+=this.xSpeed;
    if (this.sushiX > width+120)
      this.sushiX= (int)random(-100, -140);
  }
  
  //to reset the sushi to the original position and give it a new speed
  void reset()
  {
     sushiX = originX;
     sushiY= originY;
     xSpeed =(int)random(3, 9);
  }
  
    void previousSushi()
  {
     sushiX = -10;
     sushiY= -10;
  }
  
  //updates the sushi display, movement and the interaction of the mouse by the user 
  void update()
  {
    display();
    move();
    mouseDrag();
  }
  
  //an abstract method has been implemented by subclasses for displaying the sushi
  abstract void display();
  
  //This handles mouse dragging interactions for the sushi
  void mouseDrag()
  {
    if (mousePressed && !oneSushi)
    {
      if   (dist(mouseX, mouseY, this.sushiX, this.sushiY) <50 )
      {
        oneSushi = true;
        dragging = true;
      }
    }
   
    if (mousePressed && oneSushi && this.dragging)
    {
      
      image(images[imgCounter/10 % 3],sushiX,sushiY,35,35); //shows star animation when the sushi is picked up
      imgCounter++;  
      
      if (dist(mouseX, mouseY, this.sushiX, this.sushiY) <50 )
        this.sushiX = mouseX;
        this.sushiY = mouseY;
    }
      if (!mousePressed)
      {
        oneSushi = false;
        this.dragging = false;
      }
  }
  
  //This is to check if the mouse is over the sushi
  boolean isMouseOver() {
    return mouseX > sushiX && mouseX < sushiX + 50 && mouseY < sushiY + 50;
  }


  
}
