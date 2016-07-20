import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

int total=50  ;
float r =200;
PVector [][] points;
PeasyCam cam;

float offset=0;

void setup(){
 
  size(600,600, P3D);
  points = new PVector[total+1][total+1];
  cam = new PeasyCam(this,400);
  float lon, lat;
  colorMode(HSB);
  
  float x,y,z;
  
  for(int i=0;i<total+1;i++){
    lat = map(i,0,total,-HALF_PI, HALF_PI); 
    float r2 = superShape(lat, 7,.2, 1.7, 1.7);
    for(int j=0;j<total+1;j++){
      lon = map(j,0,total, -PI , PI); 
      
      float r1 = superShape(lon, 7,.2, 1.7, 1.7);
      
      x=r * r1 * cos(lon) * r2 * cos(lat);
      y= r * r1 * sin(lon) * r2 * cos(lat);
      z= r * r2 * sin(lat);
      points[i][j] = new PVector(x,y,z);
     }
   }
  
  
}

float superShape(float theta, float m, float n1, float n2, float n3){
  float a=1,b=1;
  float t1 = abs((1/a)* cos(m * theta/4));
  t1 = pow(t1,n2);
  
  float t2 = abs((1/b) * sin(m * theta/4));
  t2 = pow(t2,n3);
  
  float t3 =t1+t2;
  float r= pow(t3, -1/n1);
  
  return r;
}


void draw(){
   background(0);
   fill(255);
   lights();
   //translate(width/2, height/2);
   //sphere(200);
   
   stroke(255);
   strokeWeight(1);
   //noFill();
   noStroke();
   
   offset += 5;
  for (int i = 0; i < total; i++) {
    float hu = map(i, 0, total, 0, 255*6);
    fill((hu + offset) % 255 , 255, 255);
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total+1; j++) {
      PVector v1 = points[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = points[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
  endShape();
}

     
   
    
}