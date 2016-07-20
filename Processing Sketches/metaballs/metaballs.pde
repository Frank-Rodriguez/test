//Blob b;
Blob[] blobs = new Blob[10];

void setup(){
  size(640,320);
  for(int i=0;i<blobs.length;i++){
    blobs[i] = new Blob(random(width),random(height));
   }
}

void draw(){
  colorMode(HSB);
  background(51);
  
  loadPixels();
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){
      int index=x+y*width;
      float sum=0;
      for(Blob b:blobs){
        float d=dist(x,y,b.pos.x,b.pos.y);
        sum+= ((float)1/(blobs.length))*1000 * b.r/d;
       
      }
      pixels[index]=color(sum%512,255,255);
    }
  }
  updatePixels();
  for(int i=0;i<blobs.length;i++){
    blobs[i].update();
    //blobs[i].show();
  }
  
  
}