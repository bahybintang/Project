public class Population {
  float total = 0;
  float maxFitness = 0;
  int maxIndex = -1;
  
  Dots dots[];
  ArrayList<Dots> matingpool = new ArrayList<Dots>();
  
  public Population(){
    dots = new Dots[size];  
    for(int i = 0; i<size; i++){
       dots[i] = new Dots();
    }
  }
  
  public void show(){
    for(int i = 0; i<size; i++){
      dots[i].update();
      dots[i].show();
    }
  }
  
  //For selection using pool
  public void makePool(){
    evaluate();
    
    for(int i = 0; i<size; i++){
      int n = (int)dots[i].fitness;
      for(int j = 0; j<n; j++){
        matingpool.add(dots[i]); 
      }
      total += n;
    }
  }
  
  public void evaluate(){
    for(int i = 0; i<size; i++){
      dots[i].calcFitness(); 
      if(dots[i].fitness > maxFitness){
        maxFitness = dots[i].fitness;
        maxIndex = i;
      }
    }
  }
  
  //For selection using AC RJ Algo
  //I make acceptReject feels more natural like selectionPool
  public DNA acceptReject(){
    float rd = random(1000); 
    
    //Added more randomness to the selection
    int i = (int) random(size);
    int j = i;
    
    for(i = i; i<size; i++){
      if(rd < dots[i].fitness) return dots[i].dna;
      else continue;
    }
    
    for(i = 0; i<j; i++){
      if(rd < dots[i].fitness) return dots[i].dna;
      else continue;
    }
    
    return dots[maxIndex].dna;
  }
  
  public void selectionPool(){
    Dots newDots[] = new Dots[size];
    
    for(int i = 0; i<size; i++){
       DNA parentX = matingpool.get((int)random(total)).dna;
       DNA parentY = matingpool.get((int)random(total)).dna;
       
       DNA child = parentX.crossover(parentY);
       child.mutation();
       newDots[i] = new Dots(child);
    }
    total = 0;
    dots = newDots;
    matingpool.clear();
  }
  
  public void selectionACRJ(){
    Dots newDots[] = new Dots[size];
    
    for(int i = 0; i<size; i++){
       DNA parentX = acceptReject();
       DNA parentY = acceptReject();
       
       DNA child = parentX.crossover(parentY);
       child.mutation();
       newDots[i] = new Dots(child);
    }
    
    dots = newDots;
  }
}
