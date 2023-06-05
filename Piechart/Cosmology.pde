void setup() {
  size(1000, 1000);
  frameRate(60);
}

void draw() {
  background(0);
  float angle = float(frameCount)/200-HALF_PI;
  float x = 50;
  float y = float(frameCount)/10;
  float z = exp(float(frameCount)/200-3);
  float total = x+y+z;
  float endX = portion(x, total)-HALF_PI;
  float endY = endX+portion(y, total);
  float endZ = endY+portion(z, total);
  fill(255, 0, 0);
  arc(width/2, height/2, 3*width/4, 3*height/4, -HALF_PI, endX);
  fill(0, 255, 0);
  arc(width/2, height/2, 3*width/4, 3*height/4, endX, endY);
  fill(0, 0, 255);
  arc(width/2, height/2, 3*width/4, 3*height/4, endY, endZ);
  textSize(20);
  text(frameCount, 20, 20);
  text(angle, 20, 100);
  text(total, 20, 60);
  text((portion(x, total)+portion(y, total)+portion(z, total))/TWO_PI, 100, 20);
  rect(4*width/5, 20, 50, 50);
  fill(100);
  textSize(15);
  text("Dark\nEnergy", 4*width/5+5, 35);
}

float portion(float x, float total) {
  return x*2*PI/total;
}
