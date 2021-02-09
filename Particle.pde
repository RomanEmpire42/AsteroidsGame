class Particle extends Floater {
  float beta;
  Particle() {
    myColor=255;
    corners = 4;
    xCorners = new int[] {12, 12, 8, 8};
    yCorners = new int[] {2, -2, -2, 2};
    myCenterX = 0;
    myCenterY = 0;
    beta = 255;
    myPointDirection = 0;
    myXspeed = myYspeed = 0;
  }
  public void setColor(int c_){
    myColor = c_;
  }
  public int getColor(){
    return(myColor);
  }
  public void shipDebris() {
    corners = 4;
    xCorners = new int[] {10, 0, -10, 0};
    yCorners = new int[] {0, -5, 0, 5};
    beta = 0;
  }
  public void setCoords(double x_, double y_) {
    myCenterX = x_;
    myCenterY = y_;
  }
  public double getX() {
    return myCenterX;
  }
  public double getY() {
    return myCenterY;
  }
  public void setDirection(double d_) {
    myPointDirection = d_;
  }
  public double getDirection() {
    return myPointDirection;
  }
  public float getBeta() {
    return beta;
  }
  public void setBeta(float b_) {
    beta = b_;
  }
  public void setXvel(double xvel) {
    myXspeed=xvel;
  }
  public void setYvel(double yvel) {
    myYspeed=yvel;
  }
  public void show ()  //Draws the floater at the current position  
  {
    pushMatrix();
    fill(myColor, beta);
    stroke(myColor, beta);

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
