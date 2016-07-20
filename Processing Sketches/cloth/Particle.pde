class Particle extends VerletParticle2D{
  
  public Particle(float x, float y){
    super(x,y);
    //System.out.println("In constructor " +  x+" "+y);
  }
  
  public void display(){
    fill(255);
    ellipse(this.x,this.y,10,10);
    //System.out.println(" Inside Draw " + this.x+" "+this.y);
  }
  
}