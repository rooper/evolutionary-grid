//the grid
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 80;
int rows = 40;
float decay = 0.01;
//the algorithm is the automaton ruleset. 
int algo = 1;
int nearby = 0;

void setup() {
  size(1600,800);
  //frameRate(3); //for debugging..
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*20,j*20,20,20,0);
    }
  }
}

void draw() {
  background(0);
  
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      if (i != 0 && j != 0 && i < cols-1 && j < rows-1) {
      grid[i][j].display(grid[i][j-1],grid[i+1][j],grid[i][j+1],grid[i-1][j]);
      } else {
        grid[i][j].display();
      }
    }
  }
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
  float health; 
  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float thealth) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    health = thealth;
  } 
 

  void display(Cell top, Cell right, Cell left, Cell bottom) {
    //calculate fill [0-255] by examing neighboring fills
    //algorithms should do nothing except calculate the health for each tile.
    //ALGORITHMS 
    ///              0: none
    ///              1: random life
    ///              2: conway's game of life
    ///              3: logan's highly-intelligent automaton 2.0 deluxe XL platinum edition 
    ///                    (executive produced by Jay-Z) feat. Kanye West.
    ///              4: ???
    // END ALGORITHMS
    //
    // Note: for sanity purposes, 255 = alive and 0 = dead. (For binary simulations)
    
    
    //calculate new health based on the algo. fancy switch statement follows:
    switch(algo) {
      case 0:
        //you really suck
        println("algorithm spec error -- you suck");
        break;
      case 1:
        //random reproduction, set rates of life and death with random jumps
        float total_neaby_fill = top.health + right.health + left.health + bottom.health;
        health = random(total_neaby_fill/2);
        if (health != 0) {
         // health += random(-0.5,0.5);
        }
        //random jumper
        if (random(10000) >= 9999 && health != 0) {
          health = 250;
        }
        //health decay
        if (health > 0) {
           health -= decay;
        }
        break;
      case 2:
        //conway's game of life simulator modified (4 cell edition [from 8])
        //calculate number of nearby living cells by adding
        nearby = top.health + right.health + left.health + bottom.health;
        //switch-ception
        switch(nearby) {
           case 0:
             //none alive nearby
             break;
           case 255:
             // one alive nearby
             break;
           case 510:
             // two alive nearby
             break;
           case 765:
             //three alive nearby oh boy
             break;
           case 1020:
             // four alive nearby wtf
             break;
           default:
              println("someone f***ed up  switch-ception");
              break;
        }
           
        break;
      case 3: 
        //logan's ass-shart simulator, oh boy
        //wut
        break;
      case 4: 
        //you are the absolute worst
        break;
      default:
        println("oh s***, the algorithm doesn't exist. call Jay-Z!");
        break;
    }
  
    // click detection.
    // clicking on squares bestows life (alive = 255)
    // you are a god now
    // ...
    if (mousePressed == true) {
      //can't believe I got this right on the first attempt...
      if(mouseX <= x+w && mouseX > x && mouseY <= y+h && mouseY > y) {
         health = 255;
      }

    }
    
  
    
    //we REALLY don't want this value to go above 255...memory errors....*shiver*
    //actually, though: greyscale values above 255 render as color in processing.js. Interesting.
    if (health >= 251) {
       health = 250;
    }
    
    //the climax!
    fill(health);
    rect(x,y,w,h);
     
  }
   void display() {
    //calculate fill [0-255] by examing neighboring fills
    fill(health);
    rect(x,y,w,h); 
     
  }
  
  
  
  void changeDecay(float i) {
    //this should work
  }
  
}

