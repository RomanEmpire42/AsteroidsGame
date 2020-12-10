class Spaceship extends Floater  
{   
  float beta;
  Spaceship() {
    myColor=255;
    corners = 3;
    xCorners = new int[] {-10,-10,10};
    yCorners = new int[] {-10,10,0};
    myCenterX=width/2;
    myCenterY=height/2;
    beta=255;
    myPointDirection = 0;
    myXspeed=myYspeed=0;
  }
  
  public void thrust () {
    pushMatrix();
    fill(myColor,beta);
    stroke(myColor,beta);

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //draw the polygon
    line(-15,0,-25,0);
    line(-15,-3,-25,-6);
    line(-15,3,-25,6);
    
    popMatrix();
  }
  
  public double getX() {
    return myCenterX;
  }
  public double getY() {
    return myCenterY;
  }
  public double getDirection(){
    return myPointDirection;
  }
  public void setXvel(double xvel) {
    myXspeed=xvel;
  }
  public void setYvel(double yvel) {
    myYspeed=yvel;
  }
  public double getXvel() {
    return(myXspeed);
  }
  public double getYvel() {
    return(myYspeed);
  }
  public void setColor(double r, double g, double b) {
    myColor=color((int)r,(int)g,(int)b);
  }
  public void teleport(double newX, double newY) {
    myCenterX=newX;
    myCenterY=newY;
  }
  public void setBeta(float newBeta) {
    beta = newBeta;
  }
  public String getData(int decimals) {
    return "x: "+nf((float)myCenterX,0,decimals)+"\ny: "+nf((float)myCenterY,0,decimals)+"\nhoriz. speed: "+nf((float)myXspeed,0,decimals)+"\nvert. speed: "+nf((float)myYspeed,0,decimals)+"\nrot: "+round((float)Math.abs(myPointDirection%360))+"°";
  }
  
  
  
  
  public void show ()  //Draws the floater at the current position  
  {
    pushMatrix();
    fill(myColor,beta);
    stroke(myColor,beta);

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);
    
    popMatrix();
  }
}
