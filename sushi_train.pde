//Declaring variables for images //<>//
PImage background; //background image for sketch
PImage currentImage, sushi, sushi2, sushi3;//images representing different sushi
PImage bento;//image to represent bento box

//Declaring a variable for font
PFont pixel;

//Number of sushi (object) e.g 20
int numSushi=20;


//ArrayList to store sushi (object)
ArrayList<Sushi> sushies = new ArrayList();
ArrayList<Sushi> removedSushies = new ArrayList<>();
ArrayList<Rat> rats = new ArrayList();

//Game modes
final int PLAY = 0;
final int FINISH = 1;
final int LOSE = 2;
int gameMode = PLAY; //The initial game mode

boolean oneSushi = true; //Flag to indicate whether there is one sushi selected
boolean scoreSaved = false;// Flag to indicate if the score has been saved

//Objects which represents conveyor belts, bento box, timer and scores
ConveyorBelt conveyor; //The top conveyor belt
ConveyorBelt2 conveyor2; //The bottom conveyor belt
BentoBox bentoBox;//The bento box (product)
Timer StartTime; //The timer for the game duration
Score scores;//The score

void setup() //start of the program, runs through the program once
{
  size(1000, 667); //setting the size to the sketch window

  imageMode(CORNER); //set image to corner
  background = loadImage("japanese_restaurant.jpg"); //loading background image

  pixel = createFont("pixel.TTF", 50); //Load font
  background.resize(width, height); //set background size to the sketch window size

  StartTime = new Timer(10); //initialises the timer to 10
  scores = new Score(); //intialises the score
  conveyor = new ConveyorBelt(0, 0, 2); //creates the top conveyor belt
  conveyor2 = new ConveyorBelt2(0, 67, 4); //creates the bottom conveyor belt
  bentoBox = new BentoBox(width+150, height/3.35); //creates the bentoBox

  //Polymorphism - Creates the sushi objects and adds them into the ArrayList
  for (int i=0; i<numSushi; i++) //repeats until numSushi
  {
    float sushX=random(-10, -270);
    float sushY=random(height/1.35, height/1.25);
    int randomSpeed =(int)random(3, 9);

    if (i<6)
    {
      sushies.add(new SpamRoll(sushX, sushY, randomSpeed-3)); //creating SpamRolls (components)
    } else if (i >=6 && i < 13)
    {
      sushies.add(new SalmonRice(sushX+100, sushY+50, randomSpeed-2)); //creating SalmonRice (components)
    } else
    {
      sushies.add(new SetA(sushX-50, sushY-25, randomSpeed-1)); //creating SetA (components)
    }
  }
  
  //Adding rats to the ArrayList
  for (int i=0; i<6; i++) 
  {
    rats.add(new Rat());
  }
}

void draw() //animates, meaning it repeats commands 60x per second
{
  imageMode(CORNER);
  image(background, 0, 0);

  //Displays a start up message if it is on PLAY mode
  if (gameMode == PLAY)
  {
    fill(0);
    text("Press ENTER to start", width/15, height/2.2);
    textFont(pixel);
  }

  //Updates and displays game elements if it is on FINISH mode
  if (gameMode == FINISH) {

    //this displays the time and score
    StartTime.countDown();
    fill(0);
    textSize(30);
    text("Time:", 100, 40);
    text(StartTime.getTime(), 220, 40);
    text("Score:", 450, 40);
    text(scores.getScore(), 620, 40);
    //Moves and renders the conveyor belts and bento box
    conveyor.move_conveyor();
    conveyor2.move_conveyor();
    bentoBox.update();

    //Handles the collisions with the bento box with the instances of SpamRoll, SalmonRice and SetA)
    for ( int i=0; i<sushies.size(); i++ ) {
      Sushi sushis = sushies.get(i);
      sushis.update(); //displays the sushi on the conveyor belt

      if (bentoBox.crash(sushis))
      {
        scores.increaseScore();
        if (sushis instanceof SpamRoll) {
          removedSushies.add(new SpamRoll(bentoBox.bX+25, bentoBox.bY-28, -2)); //SpamRoll gets appears on the bentobox
        } else if (sushis instanceof SalmonRice) {
          removedSushies.add(new SalmonRice(bentoBox.bX+25, bentoBox.bY+20, -2)); //SalmonRice gets appears on the bentobox
        } else if (sushis instanceof SetA) {
          removedSushies.add(new SetA(bentoBox.bX-30, bentoBox.bY-28, -2)); //SetA gets appears on the bentobox
        }
        sushies.remove(i); //sushi removed from array
      }
    }
    for ( Sushi removedSushis : removedSushies ) {
      removedSushis.update(); //display sushi on bentobox
    }
    for (int i=0; i<rats.size(); i++)
    {
      Rat currentRat = rats.get(i);
      currentRat.update();
      if (bentoBox.crash(currentRat))
      {
        gameMode=LOSE;
      }
    }
  }

  //Displays game over message if it is on LOSE mode
  if (gameMode == LOSE) {
    fill(255, 0, 0); // Red colour for game over text
    textSize(50);
    textAlign(CENTER, CENTER);
    text("Game Over", width / 2, height / 3);
    textSize(30);
    text("Final Score: " + scores.getScore(), width / 2, height / 3 + 50);
    textSize(30);
    if (!scoreSaved) {
      saveHighScore(scores.getScore());
      scoreSaved = true;  // Set the flag to indicate that the score has been saved
    }
    text("Press ENTER to restart", width / 2, height / 3 + 100);
  }
}

String [] convertArrayIntToString(int [] arrayInt)
{
  String[] output = new String[arrayInt.length];
  for (int i=0; i<arrayInt.length; i++)
  {
    output[i] = Integer.toString(arrayInt[i]);
  }
  return output;
}

int [] insertScoreToArray(int[] intArray, int highScore)
{
  int [] newIntArray = new int[intArray.length+1];
  int i=0;
  while (i < intArray.length && highScore > intArray[i])
  {
    newIntArray[i] = intArray[i];
    i++;
  }
  newIntArray[i] = highScore;
  return newIntArray;
}


void displayFile (String[]arrayFile)
{
  for (int i=0; i<arrayFile.length; i++)
    println(arrayFile[i]);
}

//to convert string to integer from everything in the array
//pass in array of string and convert to arrray of int
int [] convertArrayStringsToInt(String[] stringArray ) //return an array of integers
{
  int [] intArray = new int[stringArray.length];//create array of ints, same size as string array

  //loop through array - convert each element in turn and place in int Array
  for (int i=0; i<stringArray.length; i++) {
    intArray[i] = Integer.parseInt(stringArray[i]);
  }
  return intArray; //return array of integers
}

void saveHighScore(int score) {
  String[] currentHighScores = loadStrings("highScore.txt");
  displayFile (currentHighScores);

  int[] highScores = convertArrayStringsToInt(currentHighScores);
  highScores = insertScoreToArray(highScores, score);
  String[] newHighScores = convertArrayIntToString(highScores);

  saveStrings("highScore.txt", newHighScores);
}

void keyPressed()
{
  if (key == ENTER ) //enter to start the game
  {
    //Changes the gameMode to FINISH, when the user presses ENTER for either PLAY mode or LOSE mode
    if (gameMode == PLAY || gameMode == LOSE)
      gameMode = FINISH;
    bentoBox.bX = width+120;
  }
  //This resets the scores, time, rat positions and sushi positions when ENTER is pressed
  scores.reset();
  StartTime.reset(10); //resets the timer back to 10 seconds
  for (Sushi sushis : sushies) {
    sushis.reset();
  }
    for (Sushi removedSushis : removedSushies) {
    removedSushis.previousSushi();
  }
  for (Rat rat : rats) {
    rat.resetRat();
  }
}
