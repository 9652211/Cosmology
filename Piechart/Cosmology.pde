float exp = 0.6667;
float a = 1/1100;
float aScale = 1/(pow(378000, exp)*1100);
float t = 378000;

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
  //t = t+10000000;
  a = aScale*pow(t, exp);
  fill(255, 0, 0);
  arc(width/2, height/2, 3*width/4, 3*height/4, -HALF_PI, endX);
  fill(0, 255, 0);
  arc(width/2, height/2, 3*width/4, 3*height/4, endX, endY);
  fill(0, 0, 255);
  arc(width/2, height/2, 3*width/4, 3*height/4, endY, endZ);
  textSize(20);
  text(frameCount, 20, 20);
  text("aScale: " + round4(aScale), 20, 100);
  text("t: " + round4(t), 20, 60);
  text("a: " + round4(a), 100, 20);
  text("t^2/3: " + round4(pow(t, exp)), 200, 60);
  rect(4*width/5, 20, 50, 50);
  fill(100);
  textSize(15);
  text("Dark\nEnergy", 4*width/5+5, 35);
  println(e(0.00345));
}

float portion(float x, float total) {
  return x*2*PI/total;
}

String round4(float x) {
  
  return x + "";
}

float e(float x) {
  return x/pow(10, floor(log(x)/log(10)));
}
