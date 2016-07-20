int x =0;
T t = new T();
int theSize = 50000;


void setup(){
  size (640, 360);
  float x=640f/2f;
  float y= 360f/2f;
  
  ArrayList<PVector> critical = new ArrayList<PVector>();
    
  critical.add(new PVector(640/2,0));
  critical.add(new PVector(0,360));
  critical.add(new PVector(640,360));
    
  for(int i=0;i<theSize;i++){
      t.points.add(new PVector(x,y));   
      int r = (int)random(0,3);
      PVector p;
      //Average x and y with cricial(r);
      p=critical.get(r);
      x=(x+p.x)/2f;
      y=(y+p.y)/2f;
  }
  
}

void draw(){
  background(230, 230, 0);
  stroke(138, 43, 0);
  for(PVector vec:t.points){
     point(vec.x, vec.y);
    
  }

}
  
class T{
  ArrayList<PVector> points;
  
  public T(){
    points= new ArrayList<PVector>();
  }
  
}