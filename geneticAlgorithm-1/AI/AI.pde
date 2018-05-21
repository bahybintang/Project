//Muhammad Bintang Bahy
//Computer Science 17 UGM
//May 21st 2018

int cycle = 300;
int size = 200;
int generation = 1;
int count = 0;
int maxForce = 5;
float mutationRate = 0.01;
PVector target = new PVector(1080/2, 50);
PVector obstacle = new PVector(1080/2, 768/2-50);
Population pops = new Population();
float rr = obstacle.x + 150, rl = obstacle.x - 150;
float rt = obstacle.y - 20, rb = obstacle.y + 20;

void setup(){
  size(1080, 768);
  background(0);
}

void draw(){
  background(0);
  stroke(0);
  fill(0, 255, 50);
  ellipse(target.x, target.y, 40, 40);
  fill(255);
  rectMode(CENTER);
  rect(obstacle.x, obstacle.y, 300, 40);
  count++;
  if(count == cycle){
    pops.evaluate();
    //pops.makePool();       //Pool selection
    //pops.selectionPool();
    pops.selectionACRJ();    //Accept and Reject selection
    count = 0;
    generation++;
  }
  pops.show();
  textSize(20);
  fill(255);
  text("Generasi : ", 50, 50);
  text(generation, 200, 50); 
  text("Cycle left : ", 50, 100);
  text(cycle - count, 200, 100);
  text("Jumlah uget2 :( ", 50, 150);
  text(size, 230, 150); 
  
}
