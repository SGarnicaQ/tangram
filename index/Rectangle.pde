class Rectangle extends Figure {
  Rectangle(PVector pos, float sca, color col) {
    super(pos, sca, col);
    this.nVertices = 4;
    vertices = new PVector[nVertices];

    vertices[0] = PVector.mult(new PVector(-size/2, -size/2),sca);
    vertices[1] = PVector.mult(new PVector(size/2, -size/2),sca);
    vertices[2] = PVector.mult(new PVector(size/2, size/2),sca);
    vertices[3] = PVector.mult(new PVector(-size/2, size/2),sca);
  }
}