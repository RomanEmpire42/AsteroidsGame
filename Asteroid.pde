class Asteroid extends Floater {
  private double spin;
  Asteroid() {
    myColor=100;
    corners = 36;
    xCorners = new int[corners];
    yCorners = new int[corners];
    myCenterX = 500;
    myCenterY = 500;
    myPointDirection = 0;
    myXspeed = myYspeed = 0;
    spin = 0;
    generate();
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
  private void generate() {
    double radius = 20 + corners;
    for (double dir = 0.0; dir < 360; dir+= 360/corners) {
      int rand = (int)(Math.random()*100);
      if (rand < 10) {
        radius = (Math.random()*15)+(10+corners);
      } else if (rand < 50) {
        if (radius > 60) {
          radius-=3;
        }
        if (radius < 40) {
          radius+=3;
        } else {
          radius += ((int)Math.random()*10)-5;
        }
      } else {
      }
      xCorners[(int)(dir/(360/corners))] = ((int)(radius * Math.cos((dir*(Math.PI/180)))));
      yCorners[(int)(dir/(360/corners))] = ((int)(radius * Math.sin((dir*(Math.PI/180)))));
    }
  }
}
