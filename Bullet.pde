class Bullet extends Floater {
  float beta;
  Bullet() {
    myColor=200;
    corners = 4;
    xCorners = new int[] {12, 12, 8, 8};
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
  public void setXvel(double xvel) {
    myXspeed=xvel;
  }
  public void setYvel(double yvel) {
    myYspeed=yvel;
  }
}
