class Triangle extends Figure {
  Triangle(PVector pos, float sca, color col) {
    super(pos, sca, col);
    this.nVertices = 3;
    vertices = new PVector[nVertices];

    vertices[0] = PVector.mult(new PVector(-size/4, -size/4), sca);
    vertices[1] = PVector.mult(new PVector(-size/4+size, -size/4), sca);
    vertices[2] = PVector.mult(new PVector(-size/4, -size/4+size), sca);
  }
}