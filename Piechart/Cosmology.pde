import java.lang.Math;
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
  float bm = 12;
  float dm = 63;
  float r = 15/(1100*a);
  float n = 10/(1100*a);
  float de = 190*a;
  float total = bm + dm + r + n + de;
  float endde = portion(de, total)-HALF_PI;
  float enddm = endde+portion(dm, total);
  float endbm = enddm+portion(bm, total);
  float endr = endbm + portion(r, total);
  float endn = endr + portion(n, total);
  t = 380000+exp(frameCount/50);
  a = aScale*pow((float) t, (float) exp);
  fill(150);
  arc(width/2, height/2, 3*width/4, 3*height/4, -HALF_PI, endde);
  fill(50);
  arc(width/2, height/2, 3*width/4, 3*height/4, endde, enddm);
  fill(0, 255, 0);
  arc(width/2, height/2, 3*width/4, 3*height/4, enddm, endbm);
  fill(0, 255, 255);
  arc(width/2, height/2, 3*width/4, 3*height/4, endbm, endr);
  fill(255, 255, 0);
  arc(width/2, height/2, 3*width/4, 3*height/4, endr, endn);
  textSize(20);
  text(frameCount, 20, 20);
  text("a: " + fm(a), 20, 100);
  text("t (yrs): " + fm((float) t), 20, 60);
  rect(4*width/5, 20, 50, 50);
  fill(100);
  textSize(15);
  text("Dark\nEnergy", 4*width/5+5, 35);
}

float portion(float x, float total) {
  return x*2*PI/total;
}
String fm(float x) {
  return String.format("%.4g%n", x);
}
