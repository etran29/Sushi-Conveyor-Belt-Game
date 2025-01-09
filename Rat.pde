class Rat
{
  int imgCounter; //Counter to track image animation for the rat
  int ratSize = 100; //Size of the rat image
  float ratX,ratY,speed; //Current position of the rat and speed of the rat
  float originX,originY; //The original position of the rat
  boolean dragging = true; //Flag to indicate if the rat is being dragged

  PImage[] images = new PImage[3]; //Array to store different images for rat animation

  Rat()
  {
    this.ratX = random(-10, -27);
    this.ratY = random(height/1.35, height/1.3);
    this.speed = random(2,5);
    
    this.originX = ratX;
    this.originY = ratY;
    
    //loads rat images into the array
    for (int i=0; i<images.length; i++)
    {
      images[i] = loadImage("rat "+(i+1)+".png");
    }
  }

  void update()
  {
    move();
    render();
    mouseDrag();
  }

  void render()
  {
    //Displaying the current rat image from the array which then cycles through the images so that it appears as an animation
    image(images[imgCounter/10 % 3], ratX, ratY, ratSize, ratSize);
    imgCounter++;
  }
  
  //The movement of the rat which gets resetted back when its off the screen
  void move()
  {
    this.ratX+=this.speed;
    if (this.ratX > width+120)
      this.ratX= (int)random(-100, -140);
  }
  
  //Handles the mouse drag of the rat
  void mouseDrag()
  {
    if (mousePressed)
    {
      if   (dist(mouseX, mouseY, this.ratX, this.ratY) <50 )//check if the mouse is within a certain distance from the rat's position
      {
        this.ratX = mouseX;
        this.ratY = mouseY;
        dragging = true; //dragging is set to true when the rat is being dragged
      }
    }
  }
  
  //Resets the rat back to its original position
  void resetRat()
  {
    ratX = originX;
    ratY = originY;
  }
}
