class Solution {
  private ArrayList<PImage> img = new ArrayList<PImage>();  // Lista de imagenes

  void paint(int k) {
    k-=48;                                      // seleccion de la figura/solucion segun teclas numericas del 0 al 9
    imageMode(CENTER);
    pushMatrix();
    translate(width/2, height/2);
    scale(width/1000.0);                        // Resize segun resolucion/tamanyo de pantalla
    if (k>=0 && k<img.size())
      if (img.get(k) != null) 
        image(img.get(k), 0, 0);                // Muestra la imagen seleccionada
    popMatrix();
  }
  void load() {
    nImg = 0;
    img.clear();
    do {
      img.add(loadImage("img/"+nImg+".jpg"));
      nImg++;
    } while (loadImage("img/"+nImg+".jpg") != null);  // Carga la imagen mientras exista
  }
}