final float w = 100,
            h = 100;

float ang = 0,
      rSpeed = 0.09,
      aX = 0,
      aY = 2,
      x = w/2.0,
      y = h/2.0,
      vX = 10,
      vY=0,
      lastYDirection = 1;
int   i = 0,
      inflectionIndex[] = {-1000,-1000},
      epsilon= 8;
      
PImage img;

void setup(){
  size(800,600);
  rectMode(CENTER);
  imageMode(CENTER);
  resetY();
  img = loadImage("Ungrateful-Frog.jpg");
}

void resetY(){
  //println("reset y");
  y=h/2.0;
  vY=0;
  lastYDirection=1;
  inflectionIndex[i%2]=1000;
}
int sign(float f){
  return (f==0 ? 1 : int(f/abs(f)));
}

void updateSpeedPos(){
  if (lastYDirection != sign(vY)){
    inflectionIndex[i%2] = i;
  }
  lastYDirection = sign(vY);
  ang += rSpeed;
  vY += aY;
  vX += aX;
  x += vX + aX/2.0;
  y += vY + aY/2.0;
  i++;
}

boolean oscillating(){
  //println(abs(inflectionIndex[0]-inflectionIndex[1]));
  return abs(inflectionIndex[0]-inflectionIndex[1]) < epsilon;
}

boolean yBounced(){
  //println("ybounce");
  return (y>=height-h/2.0 && vY>0);
}
void yBounce(){
  vY = -vY;
  y = 2*(height-h/2.0) -y;
  rSpeed = -rSpeed;
}
  
boolean xBounced(){
  //println("xbounce");
  return (x> width-w/2.0 || x<w/2.0);
}
void xBounce(){
    aX = -aX;
    vX = -vX;
    rSpeed = -rSpeed;
}
  
void draw(){
  background(0);
  pushMatrix();
  translate(x,y);
  pushMatrix();
  rotate(ang);
  image(img, 0, 0, w,h);
  popMatrix();
  popMatrix();
  updateSpeedPos();
  if (oscillating()){
    resetY();
  }
  else if (yBounced()){
    yBounce();
  }
  if (xBounced()){
    xBounce();
  }

}