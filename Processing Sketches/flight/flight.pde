int cols;
int rows;
int scl=20;
int w=2000;
int h=1600;
float [][] z;
float yOffsetStart;

void setup(){
  size(600,600,P3D);
  //int h=900;
  cols=w/scl;
  rows=h/scl;
  
  yOffsetStart=0;
 
  
}
void draw(){
  
  float yOffset =yOffsetStart;
  
  scl=(mouseX+50)/50;
  
  cols=w/scl;
  rows=h/scl;
  
  z = new float[cols][rows];
  for(int y=0;y<rows;y++){
    float xOffset =0;
    for(int x=0;x<cols;x++){
      z[x][y]=map(noise(xOffset,yOffset),0,1,-7.5*scl,7.5*scl);
      //z[x][y]=random(-7.5*scl, 7.5*scl);
     
     xOffset+=.2; 
  }
  yOffset+=.1;
   
  }
  
  
  
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2, height/2+50);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  
  colorMode(HSB);
  
  for(int y=0;y<rows-1;y++){
    //beginShape(TRIANGLE_STRIP);
    for(int x=0;x<cols-1;x++){
    
      
      float x1, y1,z1;
      float x2, y2, z2;
      float x3, y3,z3;
      float x4, y4, z4;
      
      x1=x*scl;y1=y*scl;z1=z[x][y];
      x2=x*scl;y2=(y+1)*scl;z2=z[x][y+1];
      
      x3=(x+1)*scl;y3=y*scl;z3=z[x+1][y];
      x4=(x+1)*scl;y4=(y+1)*scl;z4=z[x+1][y+1];
            
      
      //vertex(x*scl,y*scl, z[x][y]);
      //vertex(x*scl,(y+1)*scl, z[x][y+1]);
      float avg1 = (z[x][y]+z[x][y+1])/2;
      stroke(map(avg1,-7.5*scl,7.5*scl,0,255),255,255);
      line(x1,y1,z1,x2,y2,z2);
       
      float avg2 = (z[x][y+1]+z[x+1][y])/2;
      stroke(map(avg2,-7.5*scl,7.5*scl,0,255),255,255);
      line (x2,y2,z2,x3,y3,z3);
      
      
     /* fill(map((avg1+avg2)/2,-7.5*scl,7.5*scl,0,255),255,255);
      beginShape();
      vertex(x1,y1,z1);
      vertex(x2,y2,z2);
      vertex(x3,y3,z3);
      endShape();
      
      fill(map((avg1+avg2)/2,-7.5*scl,7.5*scl,0,255),255,255);
      beginShape();
      vertex(x2,y2,z2);
      vertex(x3,y3,z3);
      vertex(x4,y4,z4);
      endShape();
      */
}
    //endShape();
  }
  
  yOffsetStart-=.1;
}