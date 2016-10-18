float i =0;
void setup(){
  size(800,600);
  rectMode(CENTER);
  fill(#FF0000);
}
void draw(){
  background(0);
  pushMatrix();
  translate(width/2.0,height/2.0);
  pushMatrix();
  rotate(i);
  rect(0,0,100,100);
  popMatrix();
  popMatrix();
  i+=0.1;
}