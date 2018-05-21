public class Dots {
  PVector pos;
  PVector vel;
  PVector acc;
  DNA dna;
  boolean finish, hitside;
  
  float width = 1080, r, g, b;
  float height = 768;
  float fitness;
  
  public Dots(){
    pos = new PVector(width/2, height - 20);
    vel = new PVector();
    acc = new PVector();
    dna = new DNA();
    finish = false;
    hitside = false;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  public Dots(DNA dna){
    pos = new PVector(width/2, height - 20);
    vel = new PVector();
    acc = new PVector();
    this.dna = dna;
    finish = false;
    hitside = false;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
  public void update(){
    float d = dist(pos.x, pos.y, target.x, target.y);
    
    if(d < 20){
      finish = true;
    }
    
    if(pos.x >= width - 10 || pos.x <= 0 + 10){
      hitside = true;
    }
    
    if(pos.y >= height - 10 || pos.y <= 0 + 10){
      hitside = true;
    }
    
    if(pos.x < rr && pos.x > rl && pos.y < rb && pos.y > rt){
      hitside = true;  
    }
    
    applyForce(dna.gen[count]);
    if(!finish && !hitside){
      vel.add(acc);
      pos.add(vel);
      acc.mult(0);
      vel.limit(10);
    }
  }
  
  public void show(){
    fill(r, g, b);
    noStroke();
    //ellipse(pos.x, pos.y, 5, 5);    //My first attempt using dots
    
    //bentuk ulernya
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rotate(this.vel.heading());
    rectMode(CENTER);
    rect(0, 0, 25, 5);
    popMatrix();
  }
  
  public void applyForce(PVector force){
    acc.add(force); 
  }
  
  public void calcFitness(){
     fitness = dist(target.x, target.y, pos.x, pos.y);
     
     //Mapping jika jarak kecil maka fitness besar
     fitness = map(fitness, 0, 1000, 1000, 0);
     
     if(finish) fitness *= 10;
     if(hitside) fitness /= 10;
  }
}
