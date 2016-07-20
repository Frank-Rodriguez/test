Building[] buildings = new Building[100];

void setup(){
  size(1024,768);
  for(int i=0;i<buildings.length;i++){
     buildings[i]=new Building((int)random(100,900),(int)random(100,200), (int) random(50,500), color(random(0,255), random(0,255), random(0,255)));
   
  }


}

void draw(){
  background(0,0,0);
   for(int i=0;i<buildings.length;i++){
    buildings[i].show();
   }


}

class Building{

  int x, w, h;
  color c;  
  
  public Building(int x, int w, int h, color c){
    this.x=x;
    this.w=w;
    this.h=h;
    this.c =c;
    
    
  }
  
  public void show(){
    fill(c);
    
    stroke(0);
    strokeWeight(4);  // Thicker
    
    System.out.println(height);
     System.out.println(x);
    rect(x,height-h,w,h);
    //rect(19,19,20,20);
   // println(s);
   
   
    strokeWeight(1);
    for(int i=5;i<w-5;i+=20){
      for(int j=5;j<=h-15;j+=20){
         float r = random(0,100); 
        if(r<98){
           fill(255,255,0);
    }
    else{
      fill(0,0,0);
    }
        rect(x+i,height-h+j,10,10);
        
      }
    }
    
  }
  
}