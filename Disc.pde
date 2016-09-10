class Disc {
  float x;
  float y;

  Disc(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void draw() {
    fill(127, 0, 0, 100);
    ellipse(x, y, 2*disc_radius, 2*disc_radius);
  }
  
  void setX(float x_) {
    x = x_;
  }

  void setY(float y_) {
    y = y_;
  }

  boolean cover(Point p) {
    if (dist(p.x, p.y, x, y) <= disc_radius) return true;
    return false;
  }
  boolean colides(Disc d){
    float distance = dist(x,y,d.x,d.y);
    if(distance < 2*disc_radius) return true;
    return false; 
  }
}