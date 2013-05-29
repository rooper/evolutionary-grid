// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 80;
int rows = 40;
float decay = 0.5;

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

    
    //calculate new health
    float total_neaby_fill = top.health + right.health + left.health + bottom.health;
    health = total_neaby_fill/4;
    
    //random mutator
    if (random(100) >= 99) {
      health = 100+random(-20,20);
    }
    
    //health decay
    if (health > 0) {
       health -= decay;
    }
    
    fill(health);
    rect(x,y,w,h);
     
  }
   void display() {
    //calculate fill [0-255] by examing neighboring fills
    fill(health);
    rect(x,y,w,h); 
     
  }
  
}
