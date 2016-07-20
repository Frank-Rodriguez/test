import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh2d.*;
import toxi.math.*;
import toxi.math.conversion.*;
import toxi.math.noise.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;

import toxi.physics.*;
//import toxi.physics.behaviors.*;
import toxi.physics.constraints.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;

int counter=0;

Particle[][] particles;
ArrayList<Spring> springs;
float w = 25;
int theSize=20;

VerletPhysics2D physics;


public void setup(){
  size(600,600);
  particles = new Particle[theSize][theSize];
  springs = new ArrayList<Spring>();
  float x =100;
  float y=10;
  
  physics = new VerletPhysics2D();
  Vec2D gravity = new Vec2D(0,1);
  GravityBehavior gb = new GravityBehavior(gravity);
  physics.addBehavior(gb);
  
  for(int i=0; i< theSize;i++){
    x =100;
    for(int j=0;j<theSize;j++){
      Particle p = new Particle(x,y);
      particles[i][j] = p;
      physics.addParticle(p);
      x+=w;
      y+=0;
    }
     y+=w;
   } //<>//
  
  for(int i=0; i< theSize;i++){
  
    for(int j=0;j<theSize;j++){
      Particle current = null;
      Particle right = null;
      Particle down = null;
      
      current = particles[i][j];
      if(j+1<theSize){right = particles[i][j+1];} 
      if(i+1<theSize){down = particles[i+1][j];}
      
    
      if(current!=null && right!=null){
          Spring s = new Spring(current, right); 
          springs.add(s);
          physics.addSpring(s);
      }
      
      if(current!=null && down!=null){
          Spring s = new Spring(current, down); 
          springs.add(s);
          physics.addSpring(s);
      }
      
     
      
    }
  }
  
  
   
  particles[0][0].lock();
  particles[theSize-1][0].lock();
  particles[0][theSize-1].lock();
  particles[theSize-1][theSize-1].lock();
  
  
}
public void draw(){
  background(51);
  /*
  for(int i=0; i< theSize;i++){
  
    for(int j=0;j<theSize;j++){
      particles[i][j].display();
    }
  
  }
  */
  
  
  for(Spring s:springs){
    s.display();
  }
  counter++;
  //if(counter%3==0)
    physics.update();
  
}