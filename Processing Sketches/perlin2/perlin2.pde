
int[][][]points; 


void setup(){
   size (300, 300);
   
   float xOff = .1;
   float yOff = .1;
 
   
   float perlinX=0;
   float perlinY=0;
   
      
   points = new int[width][height][3];
   for(int x=0;x<points.length;x++){
     perlinY=0;
     for(int y=0;y<points[x].length;y++){
        int v = (int)(noise(perlinX, perlinY)*256*256*256);
       
       System.out.println(v);
       
       
        points[x][y][0]=(v/(256*256));
        points[x][y][1]=(v/256);
        points[x][y][2]=(v%256);
      
       perlinY+=yOff;
      
     }
     perlinX+=xOff;
   }
   background(51);
  
  
    
    

}
void draw(){
     
  
  for(int x=0;x<points.length;x++){
       for(int y=0;y<points[x].length;y++){
         stroke(points[x][y][0], points[x][y][1], points[x][y][2]);
         point (x,y);
       }
     }
     
     stroke(20,200,100);
     point (100,100);

  
  

}