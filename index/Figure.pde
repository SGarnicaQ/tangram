abstract class Figure {
  final float size;         // constante del tamaño de las figuras
  final float rot;          // valor de la rotacion
  final PVector sca;        // escala en x y
  
  color col;                // color de la figura
  int nVertices;            // cantidad de vertices de la figura
  boolean selected;         // mira si esta seleccionado o no

  PVector pos;              // posicion principal de la figura
  PVector[] vertices;       // posicion relativa de los vertices

  PShape f;                 // guarda la contruccion de la figura

  public void paint() {     // pintar la figura en el canvas
    pushMatrix();
    stroke(4);
    if(selected)strokeWeight(10);
    else noStroke();
    
    fill(col);
    translate(pos.x, pos.y);
    beginShape();
    for (int i = 0; i<vertices.length; i++)
      vertex(vertices[i].x, vertices[i].y); // pinta la posicion cada vertice 
    endShape(CLOSE);
    move();
    test();
    popMatrix();
  }
  private void move() {                     // permite el movimiento de las figuras
    if (this.selected && mousePressed) {
      this.pos.x += (mouseX - pmouseX);
      this.pos.y += (mouseY - pmouseY);
    }
  } 
  private void rotation() {                 // rotacion segun angulo
    for (PVector vertice : vertices)
      vertice.rotate(rot);
  }
  private void mirror() {                   // mirror horizontal
    for (PVector vertice : vertices)
      vertice.x *= -1;
  }

  public void selection() {                 // selecciona la figura dependiendo de la pos del mouse
    this.selected = get(mouseX, mouseY)== col? true:false;
  }  
  public void click() {                     // evento dar click
    if (this.selected) {
      if (mouseButton ==  RIGHT) rotation();
      if (mouseButton == CENTER) mirror();
    }
  }

  //revisar
  private void merge() {
    float d = width;

    for (PVector vertice : vertices) {
      PVector p = new PVector(0, 0), p2 = new PVector(0, 0);
      
      p.set(pos.copy().add(vertice.copy()));
      for (Figure figure: figures) {
        for (int vo = 0; vo<figure.nVertices; vo++) {
          p2.set(figure.pos.copy().add(figure.vertices[vo].copy()));
          if (PVector.sub(p, p2).mag()<d && PVector.sub(p, p2).mag() != 0) {
            d = PVector.sub(p, p2).mag();
            if (d!=0 && d<50)pos.sub(PVector.sub(p, p2));
          }
        }
      }
    }
  }
  public void endFigure() {
    
    for (int v = 0; v< nVertices; v++) {
      if (vertices[v].copy().add(pos).x < minX)minX = vertices[v].copy().add(pos).x;
      if (vertices[v].copy().add(pos).y < minY)minY = vertices[v].copy().add(pos).y;
      if (vertices[v].copy().add(pos).x > maxX)maxX = vertices[v].copy().add(pos).x;
      if (vertices[v].copy().add(pos).y > maxY)maxY = vertices[v].copy().add(pos).y;
    }
  }
  public void saveFigure() {
    pos.add(new PVector(minX, minY).mult(-1));


    test();
  }
  public void test() {
    f = createShape();
    f.beginShape();
    f.stroke(255);
    f.strokeWeight(1);
    f.fill(255);
    for (int v = 0; v<nVertices; v++)f.vertex(vertices[v].copy().add(pos).x, vertices[v].copy().add(pos).y);
    f.endShape(CLOSE);
  }
  // fin de lo que toca revisar


  Figure(PVector pos, float sca, color col) {
    size = width/10.8;                    // set del tamaño constante
    this.selected = false;                // por default la seleccion es falsa
    this.rot = PI/4;                      // 
    this.pos = pos;
    this.sca = new PVector(sca, sca);
    this.col = col;
  }
}