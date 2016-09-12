final int n_points = 25; //<>//
final int n_discs = 5;
final float disc_radius = 80;

Disc[] discs;
Point[] points;

////////////////////////////////////////////////////////////////////
void setup() {

  size(800, 600);
  discs = new Disc[n_discs];
  points = new Point[n_points];

  for (int i = 0; i < n_points; i++) {
    points[i] = new Point(random(0, width), random(0, height));
  }

  for (int i = 0; i < n_discs; i++) {
    discs[i] = new Disc(random(0, width), random(0, height));
  }
}

void draw() {
  background(255);
  draw_points();
  draw_discs();
  temperaSimulada();
  //Informações do projeto
  textSize(16);
  text("Sistemas Inteligentes - Projeto - 2ª Unidade", 50, 50);
}
//////////////////////////TEMPERA SIMULADA//////////////////////////
int t=0;
void temperaSimulada() {
  t++;
  //////////////////////////ENTIDADES////////////////////////////////
}

int goal()
{
  int count = 0;
  for (int i = 0; i < n_points; i++) {
    for (int j = 0; j < n_discs; j++)
      if (discs[j].cover(points[i])) {
        count++;
        break; //???????????????????????
      }
  }
  return count;
}

void draw_points()
{
  for (int i = 0; i < n_points; i++)
    points[i].draw();
}

void draw_discs()
{
  for (int i = 0; i < n_discs; i++)
    discs[i].draw();
}


//////////////////////////JUAN/////////////////////////////////////


void keyPressed() {
  println("Tecla "+ key +" pressionada.");

  if (key=='c') background(0);

  if (key=='r') 
  {
    randomPositions();
    //while (isThereColisions() && !isALLThereCover()) randomPositions();
    while (isThereColisions() || !isALLThereCover()) randomPositions();
  }
  if (key=='p') clear(); //Clear screen - reset
  println(goal());
}

void randomPositions() {
  for (int i=0; i<discs.length; i++) {
    discs[i].setX(random(0, width));
    discs[i].setY(random(0, height));
  }
}


void mouseClicked() {
}
//COLISÕES
boolean isThereColisions() {

  for (int i = 0; i<discs.length; i++) {
    for (int j = 0; j<discs.length; j++) {
      if (i!=j) {
        if (discs[i].colides(discs[j])) return true;
      }
    }
  }
  return false;
}

boolean isALLColisions() {
  for (int i = 0; i<discs.length; i++) {
    for (int j = 0; j<discs.length; j++) {
      if (i!=j) {
        if (!discs[i].colides(discs[j])) return false;
      }
    }
  }
  return true;
}

//COVER
boolean isThereCover() {
  for (int i = 0; i<discs.length; i++) {
    for (int j = 0; j<points.length; j++) {

      if (discs[i].cover(points[j])) return true;
    }
  }
  return false;
}

boolean isALLThereCover() {
  for (int i = 0; i<discs.length; i++) {
    boolean hasCover = false;
    for (int j = 0; j<points.length; j++) {
      if (discs[i].cover(points[j])) {
        hasCover = true;
        break;
      }
    }
    if(!hasCover) return false;
  }
  return true;
}