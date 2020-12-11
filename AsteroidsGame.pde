boolean wIsPressed = false;
boolean spaceIsPressed = false;
boolean aIsPressed = false;
boolean dIsPressed = false;
//boolean isTeleporting = false;
float teleportProgress=0;
Spaceship Dragon;
Star[] galaxy = new Star[250];
Particle[] thrustDust = new Particle[100];
public void setup()
{
  size(1000, 1000);
  frameRate(100);
  Dragon = new Spaceship();
  for (int i = 0; i < galaxy.length; i++) {
    galaxy[i] = new Star();
  }
  for (int i = 0; i < thrustDust.length; i++) {
    thrustDust[i] = new Particle();
  }
  textSize(width/50);
  textAlign(LEFT, TOP);
}
int i = 0;
public void draw()
{
  background(0);

  for (int i = 0; i < galaxy.length; i++) {
    galaxy[i].show();
  }
  for (int i = 0; i < thrustDust.length; i++) {
    thrustDust[i].setBeta(thrustDust[i].getBeta()-10);
    if (thrustDust[i].getBeta() > 0) {
      thrustDust[i].show();
      thrustDust[i].accelerate(0.5);
      thrustDust[i].move();
    }
  }

  //teleport v
  if (teleportProgress>0) {
    teleportProgress+=1;
    Dragon.setBeta((100-teleportProgress)*255/100);
    Dragon.setColor(255.0*Math.random(), 255.0*Math.random(), 255.0*Math.random());
    Dragon.turn(0.5*teleportProgress);
    if (teleportProgress>=100) {
      Dragon.teleport(width*Math.random(), height*Math.random());
      teleportProgress=0;
      Dragon.setBeta(255);
      Dragon.setColor(255, 255, 255);
    }
  } //done teleporting stuff
  else {
    fill(255);
    text(Dragon.getData(3), width/100, height/50);
    if (aIsPressed) {
      Dragon.turn(-3);
    }
    if (dIsPressed) {
      Dragon.turn(3);
    }
    if (wIsPressed) {
      Dragon.accelerate(0.1);
      //Dragon.thrust();
      //
      //trustDust!!
      //
      System.out.println(i);
      if (thrustDust[i].getBeta() <= 0) {
        thrustDust[i].setXvel(Dragon.getXvel());
        thrustDust[i].setYvel(Dragon.getYvel());
        thrustDust[i].setBeta(255);
        thrustDust[i].setCoords(Dragon.getX(), Dragon.getY());
        thrustDust[i].setDirection(Dragon.getDirection()-180);
      }
      i++;
      if (i >= thrustDust.length) {
        i = 0;
      }
    }
    if (spaceIsPressed) {
      teleportProgress = 0.01;
      Dragon.setXvel(0);
      Dragon.setYvel(0);
    }
  }
  Dragon.show();
  Dragon.move();
  //Dragon.thrust();
}



void keyPressed()
{
  if (key=='w')
  {
    wIsPressed = true;
  } else if (key == 'a')
  {
    aIsPressed = true;
  } else if (key == 'd')
  {
    dIsPressed = true;
  } else if (keyCode == 32)
  {
    spaceIsPressed = true;
  }
}
void keyReleased()
{
  if (key=='w')
  {
    wIsPressed = false;
  } else if (key == 'a')
  {
    aIsPressed = false;
  } else if (key == 'd')
  {
    dIsPressed = false;
  } else if (keyCode == 32)
  {
    spaceIsPressed = false;
  }
}
