int[] points;
int[] points2;

int w=50;
int base=150;
float noise=50;
int octaves =8;
float noise2=noise;
float zOff=0;
int x=0;

void setup(){
  size (640, 640);
    background(51);
  
  
    points2 = new int[width];
   
    for(int i=0;i<points2.length;i++){
      float v = (float)i/100;
      points2[i]=(int)map(noise(v,zOff),0,1,0,width);
    }

}
void draw(){
  
  background(51);
  
  for(int i=0;i<points2.length;i++){
      float v = (float)i/100;
      points2[i]=(int)map(noise(v,zOff),0,1,0,width);
    }
  
  
  stroke(255);
  noFill();
  beginShape();
  for(int i=0;i<points2.length;i++){
    vertex(i,points2[i]); 
  }
  endShape();
  
  zOff+=.001;
  
  

}