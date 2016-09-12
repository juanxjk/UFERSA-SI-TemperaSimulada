class Point {
  float x;
  float y;

  Point(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void setPos(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void draw() {
    fill(0, 0, 127, 200);
    ellipse(x, y, 4, 4);
  }
}