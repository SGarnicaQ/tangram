void menu() {
  int s = width/20;                                        // Tamanyo texto
  String t = "Ponga el mouse en el boton Modos"+"\n"+
    "y presione una de la siguientes teclas"+"\n"+"\n"+
    "Tecla 'i': menu"+"\n"+
    "Tecla 'l': Modo libre"+"\n"+
    "Tecla 's': Solucionar figura"+"\n"+
    "Tecla 'g': en modo libre guarda la figura";
  pushMatrix();
  fill(200);
  textSize(s);
  text(t, width/2, height/2);
  popMatrix();
}
void game() {                                                // Muestra las figuras/Piezas y figuras/Solucion
  shapes.paint(int(key));
  for (Figure figure : figures)figure.paint();
  loadPixels();
}
void detectSolution() {                                      // Detectar si se hizo la solucion
  for (int i = 0; i < width; i++) {
    for (int j = 0; j <  height; j++)
      if (get(i, j) == color(255))cont++;
  }
  if (cont<pow(area, 2)*0.01 && !mousePressed && cont !=0) {
    showMessageDialog(null, "You Win", "Win", INFORMATION_MESSAGE);    // Prompt solucion correcta
    setup();
  }
  cont = 0;
}
void saveF() {                                            // Guardado de la solucion
  minX = width;
  minY = height;
  maxX = maxY = 0;
  for (Figure figure : figures)figure.endFigure();
  for (Figure figure : figures)figure.saveFigure();
  fg = createGraphics(int(maxX-minX), int(maxY-minY));    // crear nueva figura/solucion con la medida minima que contiene a la figura total

  fg.beginDraw(); 
  fg.background(100);
  for (Figure figure : figures)figure.f.draw(fg);
  fg.dispose();
  fg.endDraw();                                            // Figura creada en 2D ** Se puede desde aqui directo a pdf

  PImage im = fg.get();                                    // Cambia el formato 2D a imagen

  im.save("img/"+nImg+".jpg");                             // Guarda una nueva imagen segun la cantidad guardada
  nImg++;
  key = 'l';                                               // Evita bucle de multiples guardados
  setup();                                                 // Reinicia las variables del juego
}