public class ConveyorBelt {
  //The conveyor belt for the bento box (product)
  
  int x, y, speed; //speed of the conveyor belt
  float cSize=130; //conveyor belt size
  int rectX=0, rectY=0; //positioning of conveyor belt
  

  ConveyorBelt(int x, int y, int speed){
    this.x=x;
    this.y=y;
    this.speed=speed;
  }
  
  void conveyor_belt(float size, int x, int y) //initialising the variables of the belt
  {
    size=133;
    fill(200); //setting the belt to grey
    rectMode(CORNER);
    rect(rectX, rectY+height/5, width*2, height/5);//base
    for (int i=0; i<width; i=i+10) //repeats shape until width
    {
      fill(0);
      ellipse(x, y+height/3.35, size, size);
      fill(200);
      ellipse(x+width/150, y+height/3.35, size, size);
      noStroke(); //no outer lines
      x+=80; //80 spacing between each ellipse to make it look like half a circle
    }
  }
  void move_conveyor()
  {
    conveyor_belt(cSize, x, y); //passing the parameters
    x-=speed; //the belt moves from right to left
    if (this.x <= -80)
      this.x= 0;
  }
}
