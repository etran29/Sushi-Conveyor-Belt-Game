public class ConveyorBelt2 extends ConveyorBelt {
    //The conveyor belt for the sushi (components)
  
  ConveyorBelt2(int x, int y, int speed){
    super(x,y,speed);
  }
  
  void conveyor_belt(float size, int x, int y) //initialising the variables of the belt
  {
    size=143;
    fill(200); //setting the belt to grey
     rectMode(CORNER);
    rect(rectX, rectY+height/1.47, width*2, height/4.5);//base
    for (int i=0; i<width; i=i+10) //repeats shape until width
    {
      fill(0);
      ellipse(x, y+height/1.45, size, size);
      fill(200);
      ellipse(x+width/150, y+height/1.45, size, size);
      noStroke(); //no outer lines
      x+=80; //80 spacing between each ellipse to make it look like half a circle
    }
  }
  void move_conveyor()
  {
    conveyor_belt(cSize, x, y); //passing the parameters
    x+=speed; //the belt moves from right to left
    if (this.x >= 80)
      this.x = 0;
  }
}
