 //<>//
int t = 0;
MyRect[] rects;
int spacing = 50;
int size = 0; 
int testSize = 0;

void setup() {
  size(1000, 1000);
  strokeWeight(5);
  size = (width / spacing) * (height / spacing);
  rects = new MyRect[size];
  int index = 0;
  for (float i=0; i < width; i+=spacing) {
    for (float j=0; j < height; j+=spacing) {
      rects[index] = new MyRect(i, j);
      index++;
    }
  }
}



void draw() {
  if (t % 5 == 0) {
    background(255);
    for (MyRect rect : rects) {
      rect.updatePosition();
      rect.updateSize();
      rect.draw();
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


class  MyRect {
  float startingX;
  float startingY;
  float currentX;
  float currentY;
  float rectHeight;
  float rectWidth;

  MyRect(float x, float y) {
    startingX = x;
    startingY = y;
    currentX = x;
    currentY = y;
    rectHeight = 20;
    rectWidth = 20;
  }

  void updatePosition() {
    currentX += getOffset(5);
    currentY += getOffset(5);
  }

  void updateSize() {
    rectHeight += getOffset(5);
    rectWidth += getOffset(5);
  }

  void colorByArea() {
    float area = abs(rectWidth) * abs(rectHeight); //<>//
    if (area < 250) {
      stroke(0, 0, 255);
      //println("area: ", area, " color: blue");
    } else if (area < 500) {
      stroke(0, 255, 0);
      //println("area: ", area, " color: green");
    } else {
      stroke(255, 0, 0);
      //println("area: ", area, " color: red");
    }
  }

  void draw() {
    colorByArea();
    rect(currentX, currentY, rectWidth, rectHeight); //<>//
  }
}
