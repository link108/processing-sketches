 //<>//
int t = 0;
MyCircle[] circles;
int spacing = 100;
int size = 0; 
int testSize = 0;
float radius = 30;

void setup() {
  size(1000, 1000);
  strokeWeight(1);
  size = (width / spacing) * (height / spacing);
  circles = new MyCircle[size];
  int index = 0; 
  for (float i=0; i < width; i+=spacing) {
    for (float j=0; j < height; j+=spacing) {
      float xOffset = 20; //<>//
      float yOffset = 20;
      circles[index] = new MyCircle(i + xOffset, j + yOffset, radius);
      index++;
    }
  }
}



void draw() {
  //translate(width / 2, height / 2);
  //for (int i=0; i<360; i++) {
  //  point (sin(radians(i))*50, cos(radians(i))*50);
  //}
  if (t % 5 == 0) {
    background(255);
    for (MyCircle circle : circles) {
      circle.draw2(t);
    }
  }
  t++;
}



float getOffset(int dist) {
  float offset = random(dist);
  if (random(2) > 1) {
    offset *= -1;
  }
  return offset;
}


class  MyCircle {
  float centerX;
  float centerY;
  float radius;

  MyCircle(float x, float y, float r) {
    centerX = x;
    centerY = y;
    radius = r;
  }

  float getX(int i) {
    return centerX 
      + sin(radians(i))*radius
      + sin(i) * (radius / 10);
  }

  float getY(int i) {
    return centerY
      + cos(radians(i))*radius
      + cos(i) * (radius / 10);
  }

  void draw() {
    for (int i=0; i<360; i++) {
      point(getX(i), getY(i));
    }
    //circle(x, y, radius);
  }

  void draw2(float t) {
    int numPoints = 300;
    float angle = radians(360) / numPoints;

    //float radius2 = 300;
    //float t = 0.8;


    beginShape();
    strokeWeight(1);
    for (int i=0; i < numPoints; i++) {
      float x = cos(angle * i) * radius;
      float y = sin(angle * i) * radius;
      PVector p = new PVector(x, y);
      p.normalize();
      float n = map(noise(p.x + t, p.y + t), 0, 1, 70, 120);
      //p.mult(n*2);
      p.mult(n / 4);
      vertex(centerX + p.x, centerY + p.y);
    }
    endShape(CLOSE);
  }
}
