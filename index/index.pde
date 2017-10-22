import static javax.swing.JOptionPane.*;    // Libreria para prompt

Figure[] figures;                           // Arreglo de figuras/piezas
Solution shapes = new Solution();           // Arreglo de las posibles soluciones
int nImg, cont = 0;                         // Cantidad de imagenes guardadas, contador de pixeles blancos
PGraphics fg;                               // Para transformar los vectores/vertices a grafico 2D
float minX, minY, maxX=0, maxY=0, area;     // Para determinar el tamanyo de la nueva solucion


void setup() {
  //fullScreen();
  size(1000, 1000);          // Default 1000,1000 **Para guardar figuras usar solo este tamanyo
  minX = width;
  minY = height;
  area = sqrt(2*(pow((width/10.8)*2, 2))*(width/1000.0)); // Area que cubren todas las figuras/fichas
  shapes.load();                                          // Carga las soluciones guardadas ** simpre min 1

  PFont font;                                             // Tipo de fuente para el texto
  font = loadFont("Bauhaus93-70.vlw");  
  textFont(font, width/15);

  figures = new Figure[7];                                // Inicializacion de las figuras
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

int m;                  // Define el modo
String mode = "";       // Para la visualizacion del modo
color cc;               // variable de color del boton modo segun Hover Selector 

void modes() {
  fill(cc);
  stroke(200);
  strokeWeight(2);
  rect(0, 0, width/10, height/10);              // Boton modo
  textAlign(CENTER);
  fill(0);
  textSize(width/40);
  text("MODOS"+'\n'+mode, width/20, height/20); // Texto Boton
  fill(200, 10, 10);
  textSize(width/10);
  text("TANGRAM", width/2, height/10);          // Texto titulo
  switch(m) {                                   // Seleccion del modo
  case 0:
    menu();
    break;
  case 1:
    game();
    break;
  case 2:
    game();
    detectSolution();
    break;
  case 3:
    saveF();
    break;
  };
  if (mouseX < width/10  && mouseY < height/10) {        // Seleccion del boton
    cc = color(10, 255, 10);
    if (key == 'i'||key == 'l'||key == 's'||key == 'g')mode = ""+key; // Texto modo seleccionado
    if (key == 'i')m=0;
    if (key == 'l')m=1;
    if (key == 's')m=2;
    if (key == 'g')m=3;
  } else cc = color(255, 10, 10);
}

void mousePressed() {                                // Seleccion de la Figura/Pieza
  for (Figure figure : figures)
    figure.selection();
}
void mouseClicked() {                                // Deteccion de click...
  for (Figure figure : figures)
    figure.click();
}
void mouseReleased() {                               // Aproximacion entre figuras
  for (Figure figure : figures) 
    if (figure.selected)figure.merge();
}