float s;
float min,max;


void setup(){
   size(600,600);
  min=height;
  max=0;
   
   s=0;
}
void draw(){
 background(0);
  float v;
  float y;
  
  stroke(255);
  noFill();
  //line(0,200,width,200);
  //line(0,500,width,500);
  
  stroke(255,0,0);
  //line(0,min,width,min);
  
  stroke(0,0,255);
  //line(0,max,width,max);
  
  stroke(255);
  
  beginShape();
  
  for(int i=0;i<width;i++){
    v = map(i,0,width,0,5);
    y=noise(v+s,s)*height;
    if(y>max)max=y;
    if(y<min)min=y;
    
   vertex(i,y); 
}
  endShape();
  
  s+=.01;
}