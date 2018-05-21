public class DNA { 
  PVector gen[];
  
  public DNA(){
    gen = new PVector[cycle];
    for(int i = 0; i<cycle; i++){
      gen[i] = PVector.random2D();
      gen[i].setMag(maxForce);
    }
  }
  
  public DNA(PVector gen[]){
    this.gen = gen;  
  }
  
  public DNA crossover(DNA partner){
    PVector newGen[] = new PVector[cycle];
    int mid = (int) random(cycle);
    
    for(int i = 0; i<cycle; i++){
      if(i<mid) newGen[i] = this.gen[i];
      else newGen[i] = partner.gen[i];
    }
    
    return new DNA(newGen);
  }
  
  public void mutation(){
    float rd = random(1); 
    
    for(int i = 0; i<cycle; i++){
      if(rd < mutationRate){
        this.gen[i] = PVector.random2D();
        this.gen[i].setMag(maxForce);
      }
    }
  }
  
}
