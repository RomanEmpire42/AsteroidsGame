boolean wIsPressed = false;
boolean spaceIsPressed = false;
boolean aIsPressed = false;
boolean dIsPressed = false;
//boolean isTeleporting = false;
float teleportProgress=0;
Spaceship Dragon;
Star[] galaxy = new Star[250];
Particle[] thrustDust = new Particle[100];
Particle[] debris = new Particle[3];
ArrayList <Asteroid> astroBelt = new ArrayList <Asteroid>();
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
  for (int i = 0; i < debris.length; i++) {
    debris[i] = new Particle();
    debris[i].shipDebris();
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
  for (int i = 0; i < debris.length; i++) {
    debris[i].show();
    debris[i].move();
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
      Dragon.turn(Math.random()*360);
    }
  } //done teleporting stuff
  else {
    fill(255);
    if (Dragon.hasLife()) {
      text(Dragon.getData(3), width/100, height/50);
    } else {
      text(Dragon.getData(3), width/2 - 55, height/2 - 10);
    }
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
      if (thrustDust[i].getBeta() <= 0 && Dragon.hasLife() == true) {
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
  if (Dragon.hasLife() == true) {
    Dragon.show();
    Dragon.move();
  }
  //Dragon.thrust();




  ///ASTEROIDS
  if (astroBelt.size() <= 10) {
    Asteroid rock = new Asteroid();
    rock.setCoords(Math.random()*width, Math.random()*height);
    rock.setSpin((Math.random()*10)-5);
    rock.setXvel(Math.random()*6-3);
    rock.setYvel(Math.random()*1-0.5);
    astroBelt.add(rock);
  }
  for (int i = 0; i < astroBelt.size(); i++) {
    if ((Math.abs((Dragon.getX() - astroBelt.get(i).getX())))<= 40 && (Math.abs((Dragon.getY() - astroBelt.get(i).getY()))<= 40) && Dragon.hasLife()) { 
      Dragon.setLife(false);

      for (int j = 0; j < debris.length; j++) {
        debris[j].setBeta(255);
        debris[j].setDirection(Dragon.getDirection());
      }
      debris[0].setCoords(Dragon.getX(), Dragon.getY());;
      debris[1].setCoords(Dragon.getX()+((-10) * Math.cos((Math.PI/180)*debris[1].getDirection())), Dragon.getY()+((-10) * Math.sin((Math.PI/180)*debris[1].getDirection())));
      debris[2].setCoords(Dragon.getX()+((-10) * Math.cos((Math.PI/180)*debris[1].getDirection())), Dragon.getY()+((-10) * Math.sin((Math.PI/180)*debris[1].getDirection())));
      debris[1].setDirection(Dragon.getDirection()-90);
      debris[2].setDirection(Dragon.getDirection()-90);
      debris[1].setCoords(debris[1].getX()+((-5) * Math.cos((Math.PI/180)*debris[1].getDirection())), debris[1].getY()+((-5) * Math.sin((Math.PI/180)*debris[1].getDirection())));
      debris[2].setCoords(debris[2].getX()+((5) * Math.cos((Math.PI/180)*debris[2].getDirection())), debris[2].getY()+((5) * Math.sin((Math.PI/180)*debris[2].getDirection())));
      debris[1].setDirection(Dragon.getDirection());
      debris[2].setDirection(Dragon.getDirection());
      
      debris[0].myXspeed = Math.random()/8-0.0625;
      debris[0].myYspeed = Math.random()/8-0.0625;
      debris[1].myXspeed = Math.random()/8-0.0625;
      debris[1].myYspeed = Math.random()/8-0.0625;
      debris[2].myXspeed = Math.random()/8-0.0625;
      debris[2].myYspeed = Math.random()/8-0.0625;

      //make the ship split into 3 rhombusus (using particles)
      //you could also add a particle explosion, randomizing color between various reds and oranges
    } else{
      //THIS IS A TEST -- testing to see if I could add sections to the ship using the debris peices. Would require changes to teleportation (for fading)
      /*
      for (int j = 0; j < debris.length; j++) {
        debris[j].setBeta(255);
        debris[j].setDirection(Dragon.getDirection());
        debris[j].setCoords(Dragon.getX(), Dragon.getY());
      }
      debris[0].setColor(255);
      debris[1].setColor(200);
      debris[2].setColor(200);
      */
    }
    astroBelt.get(i).show();
    astroBelt.get(i).turn(astroBelt.get(i).getSpin()/50);
    astroBelt.get(i).move();
    fill(255);
    //ellipse((float)astroBelt.get(i).getX(), (float)astroBelt.get(i).getY(), 10, 10);
  }
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
