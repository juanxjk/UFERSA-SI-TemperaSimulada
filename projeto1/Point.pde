class Point {
  float x;
  float y;

  Point(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void draw() {
    fill(0, 0, 127, 200);
    ellipse(x, y, 4, 4);
  }
}