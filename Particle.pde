class Particle extends Floater {
  Particle() {
    myColor=255;
    corners = 4;
    xCorners = new int[] {2, 2, -2, -2};
    yCorners = new int[] {2, -2, -2, 2};
    myCenterX = 0;
    myCenterY = 0;
    beta = 255;
    myPointDirection = 0;
    myXspeed = myYspeed = 0;
  }
  public void setCoords(double x_, double y_) {
    myCenterX = x_;
    myCenterY = y_;
  }
  public void setDirection(double d_) {
    myPointDirection = d_;
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
}
