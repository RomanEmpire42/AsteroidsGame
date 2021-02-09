class Asteroid extends Floater {
  private double spin;
  private int astroSize;
  Asteroid(int s_) {
    myColor=100;
    corners = 36;
    xCorners = new int[corners];
    yCorners = new int[corners];
    myCenterX = 500;
    myCenterY = 500;
    myPointDirection = 0;
    myXspeed = myYspeed = 0;
    spin = 0;
    generate(s_);
  }
  public void setColor(int c_){
    myColor = c_;
  }
  public void setSpin(double s_) {
    spin = s_;
  }
  public double getSpin() {
    return(spin);
  }
  public double getX() {
    return myCenterX;
  }
  public double getY() {
    return myCenterY;
  }
  public int getSize() {
    return astroSize;
  }
  public void setCoords(double x_, double y_) {
    myCenterX = x_;
    myCenterY = y_;
  }
    public void setXvel(double xvel) {
    myXspeed=xvel;
  }
  public void setYvel(double yvel) {
    myYspeed=yvel;
  }
  private void generate(int size) {
    astroSize = size;
    double radius = size + corners;
    for (double dir = 0.0; dir < 360; dir+= 360/corners) {
      int rand = (int)(Math.random()*100);
      if (rand < 10) {
        radius = (Math.random()*(size*1.5))+(size/2+corners);
      } else if (rand < 50) {
        if (radius > (size*3)) {
          radius-=3;
        }
        if (radius < (size*2)) {
          radius+=3;
        } else {
          radius += ((int)Math.random()*(size/2))-(size/4);
        }
      } else {
      }
      xCorners[(int)(dir/(360/corners))] = ((int)(radius * Math.cos((dir*(Math.PI/180)))));
      yCorners[(int)(dir/(360/corners))] = ((int)(radius * Math.sin((dir*(Math.PI/180)))));
    }
  }
}
