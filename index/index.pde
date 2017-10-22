import static javax.swing.JOptionPane.*;

Figure[] figures;
Solution shapes = new Solution();
int nImg, cont = 0;
String typing = "";
PGraphics fg;
float minX, minY, maxX=0, maxY=0, area;


void setup() {
  fullScreen();
  //size(700, 700);
  minX = width;
  minY = height;
  area = sqrt(2*(pow((width/10.8)*2, 2))*(width/1000.0));
  shapes.load();

  PFont font;
  font = loadFont("Bauhaus93-70.vlw");  
  textFont(font, width/15);

  figures = new Figure[7];
  // Inicializacion de las figuras
  figures[0] = new Rectangle(new PVector(width/10, height*26/50), 1, color( 255, 128, 0));
  figures[1] = new Triangle(new PVector(width/10, height* 6/50), 1, color( 153, 76, 0));
  figures[2] = new Triangle(new PVector(width/10, height*16/50), 1, color(   0, 255, 0));
  figures[3] = new Triangle(new PVector(width/3, height*12/50), 2, color(  51, 255, 255));
  figures[4] = new Triangle(new PVector(width/3, height*32/50), 2, color( 255, 0, 0));
  figures[5] = new Triangle(new PVector(width/10, height*40/50), sqrt(2), color( 255, 0, 255));
  figures[6] = new Parallelogram(new PVector(width/2, height*40/50), 1, color(1255, 255, 0));
}

void draw() {
  background(100);
  modes();
}

int m;
void modes() {
  noFill();
  stroke(200);
  strokeWeight(2);
  rect(0, 0, width/10, height/10);
  textMode(CENTER);
  textAlign(CENTER);
  fill(200,10,10);
  textSize(width/10);
  text("TANGRAM", width/2, height/10);
  fill(200);
  textSize(width/50);
  text("MODOS", width/20, height/20);
  switch(m) {
  case 0:
    instruction();
    break;
  case 1:
    game();
    break;
  case 2:
    game();
    shapes();
    break;
  case 3:
    saveF();
    break;
  }
  if (mouseX < 100 && mouseY < 100) {
    if (key == 'i')m=0;
    if (key == 'g')m=1;
    if (key == 'c')m=2;
    if (key == 's')m=3;
  }
}

void mousePressed() {
  for (Figure figure : figures)figure.selection();
}
void mouseClicked() {
  for (Figure figure : figures)figure.click();
}
void mouseReleased() {
  if (mouseButton == LEFT) {
    for (Figure figure : figures) 
      if (figure.selected)figure.merge();
  }
}
void keyPressed() {  
  if ((int)key == 8) typing = "";
  else typing += key;
}