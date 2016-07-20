static int [] colors;
static String[] numbers;

float velocity=0;
float acceleration=.05;
float minAngle=0;

void setup(){
   size(1024,768);
   colors = new int[38];
   numbers = new String[]{"0", "2", "14", "35", "23", "4", "16", "33", "21" ,"6",  "18", "31", "19", "8", "12", "29", "25", "10", "27", "00", "1", "13", "36", "24", "3", "15", "34", "22", "5", "17", "32", "20", "7", "11", "30", "26", "9", "28" };
   
   boolean alternate=false;
   for(int i=0;i<colors.length;i++){
     if(i==0 || i==19){
       colors[i]=2;
       alternate=!alternate;
     }
     else{
       if(alternate){
         alternate=false;
         colors[i]=0;
       }
       else{
         alternate=true;       
         colors[i]=1;
       }
     }
   }
   
   
   
}

void mousePressed(){
  velocity = random(40, 60);
  minAngle = random(0,2*PI);
}


void draw(){
    background(200);
    //stroke(255);
    //strokeWeight(1);
    
    
    translate(width/2, height/2);
    
    //float angle = 2*PI* ((float)mouseX/(float)width);
    if(velocity >0){
      velocity-=acceleration;
    }
    if(velocity<0){
      velocity=0;
    }
    //println(velocity);
    rotate(velocity);
    rotate(minAngle);
    //minAngle
    
    
    rotate((-2*PI/38)/2);
    for(int i=0;i<38;i++){
         if(colors[i]==1){
           fill(color(255,0,0));
         }
         else if(colors[i]==0){
            fill(color(0,0,0));
         }
         else if(colors[i]==2){
            fill(color(0,255,0));
         }
         
        //line(0,0,0,-325);
        arc(0, 0, 700, 700, 0-PI/2,2*PI/38-PI/2 , PIE);
       
        pushMatrix();
        
        rotate((2*PI/38)/2+PI);
        translate(0, 350);
        
        fill(255);
        textAlign(CENTER, BOTTOM);
        textSize(32);
        text(numbers[i], 0, 0);
        
        popMatrix();
        
        rotate(2*PI/38);
    }
}