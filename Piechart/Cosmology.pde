import java.lang.Math;
float exp = 0.6667;
float a = 1/1100;
float aScale = 1/(pow(378000, exp)*1100);
long t = 378000;

void setup() {
  size(1000, 1000);
  frameRate(60);
}

void draw() {
  background(0);
  float x = 50;
  float y = ((float) frameCount)/10;
  float z = exp(((float) frameCount)/200-3);
  float total = x+y+z;
  float endX = portion(x, total)-HALF_PI;
  float endY = endX+portion(y, total);
  float endZ = endY+portion(z, total);
  t = 13800000000L;
  a = aScale*pow((float) t, (float) exp);
  fill(255, 0, 0);
  arc(width/2, height/2, 3*width/4, 3*height/4, -HALF_PI, endX);
  fill(0, 255, 0);
  arc(width/2, height/2, 3*width/4, 3*height/4, endX, endY);
  fill(0, 0, 255);
  arc(width/2, height/2, 3*width/4, 3*height/4, endY, endZ);
  textSize(20);
  text(frameCount, 20, 20);
  text("a: " + fm(a), 20, 60);
  rect(4*width/5, 20, 50, 50);
  fill(100);
  textSize(15);
  text("Dark\nEnergy", 4*width/5+5, 35);
}

float portion(float x, float total) {
  return x*2*PI/total;
}
String fm(float x) {
  return String.format("%.5g%n", x);
}
