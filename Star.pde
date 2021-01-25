class Star //note that this class does NOT extend Floater
{
  private int myColor;
  private int beta;
  private int myX;
  private int myY;
  Star() {
    beta = 100+(int)(Math.random()*155);
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    myX = (int)(Math.random()*(width));
    myY = (int)(Math.random()*(height));
  }
  public void show() {
    if ((Math.random()*100)>= 85) {
      beta -= 10;
      if (beta <= 100+(int)(Math.random()*155)) {
        beta = 100+(int)(Math.random()*155);
      }
    }
    noStroke();
    fill(myColor, beta);
    ellipse(myX, myY, 5, 5);
  }
}
