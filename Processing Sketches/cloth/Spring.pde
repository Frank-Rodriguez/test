class Spring extends VerletSpring2D{
  
  public Spring(Particle a, Particle b){
    super(a,b,random(.5*w,1.5*w), random(.5, 2));
    
  }
  void display(){
    float len = this.getRestLength();
    float v = map(len, 0, 255, .5,2);
    //System.out.println(v);
    stroke(v,0,v);
    line(a.x,a.y,b.x,b.y);
  }
    
}