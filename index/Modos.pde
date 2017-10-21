void instruction() {
  int s = 40;
  String t = "Ponga el mouse en el boton cambiar Modo"+"\n"+"y presione una de la siguientes teclas"+"\n"+
    "Tecla 'i': instrucciones"+"\n"+"Tecla 'g': juego"+"\n"+
    "Tecla 'c': intentar figura"+"\n"+"Tecla 's': guardar solucion";
  pushMatrix();
  fill(200);
  textSize(s);
  text(t, width/2, height/2);
  popMatrix();
}

void shapes() {
  for (int i = 0; i < width; i++) {
    for (int j = 0; j <  height; j++)if (get(i, j) == color(255) || get(i, j) == color(200))cont++;
  }
  if (cont<pow(area, 2)*0.01 && !mousePressed && cont !=0) {
    showMessageDialog(null, "You Win", "Win", ERROR_MESSAGE);
    setup();
  }
  cont = 0;
}
void game() {
  text(typing, 10, 10);
  shapes.paint(int(key));
  for (Figure figure : figures)figure.paint();
  loadPixels();
}

void saveF() {
  minX = width;
  minY = height;
  maxX = maxY = 0;
  for (Figure figure : figures)figure.endFigure();
  for (Figure figure : figures)figure.saveFigure();
  fg = createGraphics(int(maxX-minX), int(maxY-minY));

  fg.beginDraw(); 
  fg.background(100);
  for (Figure figure : figures)figure.f.draw(fg);
  fg.dispose();
  fg.endDraw();

  PImage im = fg.get();

  im.save("img/"+nImg+".jpg");
  nImg++;
  key = 'g';
  setup();
}