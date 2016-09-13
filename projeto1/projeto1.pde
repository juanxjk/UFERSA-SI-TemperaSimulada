final int n_points = 200; //<>//
final int n_discs = 16;
final float disc_radius = 80;

Disc[] discs;
Disc[] discs2;
Point[] points;


///////////////////////////////////////////////////////////////////////////////
void setup() {

  size(640, 480);
  discs = new Disc[n_discs];
  points = new Point[n_points];
  discs2 = new Disc[n_points];
  for (int i = 0; i < n_points; i++) {
    points[i] = new Point(random(0, width), random(0, height));
  }

  for (int i = 0; i < n_discs; i++) {
    discs[i] = new Disc(random(0, width), random(0, height));
    discs2[i] = new Disc(0, 0);
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
//////////////////////////TÊMPERA SIMULADA//////////////////////////////////////

float T = 10000;
void temperaSimulada() {
  if (goal(discs)==n_points) return;
  for (int i=0; i<100; i++) {
    //if(isThereColisions()) resetPositions();
    oneRandomPosition();
    int deltaE = goal(discs2) - goal(discs);
    if (deltaE>0) {
      swap();
    } else {
      float p = P(deltaE);
      float x = random(0, 1);
      if (x<=p) swap();
    }

    println("T: " + T + " Goal: " + goal(discs) + " P:" + (P(deltaE)));
  }
}

void swap() {
  for (int i=0; i<n_discs; i++) {
    discs[i] = discs2[i];
  }
}

float P(int deltaE) {
  T=0.99*T;
  return exp(deltaE/T);
}

int goal(Disc[] _discs)
{
  int count = 0;
  for (int i = 0; i < n_points; i++) {
    for (int j = 0; j < n_discs; j++)
      if (_discs[j].cover(points[i])) {
        count++;
        break;
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

////////////////////////////////////////////////////////////////////////////////

void randomPosition() {
  for (int i=0; i<discs.length; i++) {
    discs2[i].setPos(random(0, width), random(0, height));
  }
}
void oneRandomPosition() {
  for (int i=0; i<discs.length; i++) {
    discs2[i].setPos(discs[i].x, discs[i].y);
  }
  int i = (int) random(0, n_discs);
  discs2[i] = new Disc(random(0, width), random(0, height));
}

///////////////////////ESSA PARTE PODE SER DESCOSIDERADA////////////////////////

void keyPressed() {
  println("Tecla "+ key +" pressionada.");

  if (key=='c') background(0);

  if (key=='r') 
  {
    randomPosition();
    swap();
  }
  if (key == 'p') {
    for (int i=0; i<points.length; i++) {
      points[i].setPos(random(0, width), random(0, height));
    }
  }

  if (key == ' ') T = 1000;
}


void mouseClicked() {
}

/////COLISÕES

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

/////COVER
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
    if (!hasCover) return false;
  }
  return true;
}