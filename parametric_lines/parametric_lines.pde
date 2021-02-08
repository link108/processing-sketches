
int t = 0;
int spacing = 50;
int size = 0; 
int testSize = 0;

void setup() {
  size(1000, 1000);
  strokeWeight(5);
  background(20);
}

static int NUM_LINES = 5;

void draw() {
  translate(width / 2, height / 2);
  background(20);
  stroke(255);
  for(int i=0; i < NUM_LINES; i++) {
    int offset = i * 3;
    line(getX1(t + offset), getY1(t + offset), getX2(t + offset), getY2(t + offset));
    line(getX3(t + offset), getY3(t + offset), getX4(t + offset), getY4(t + offset));
  }
  t++;
}

float getY1(float t) {
  return sin(t / 10) * 100;
}

float getX1(float t) {
  return t;
}

float getX2(float t) {
  return cos(t / 20) * 100;
}


float getY2(float t) {
  return sin(t / 10) * 150;
}

// ##############



float getY3(float t) {
  return sin(t / 10) * 200 + cos(t / 300); 
}

float getX3(float t) {
  return cos(t / 100) * 200 + sin(t * 2); 
}

float getX4(float t) {
  return sin(t / 20) * 100;
}


float getY4(float t) {
  return cos(t / 10) * 150;
}
