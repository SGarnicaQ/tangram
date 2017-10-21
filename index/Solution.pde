class Solution {
  private ArrayList<PImage> img = new ArrayList<PImage>();
  void paint(int k) {
    k-=48;

    imageMode(CENTER);
    pushMatrix();
    translate(width/2, height/2);
    scale(width/1000.0);
    if (k>=0 && k<img.size())
      if (img.get(k) != null) 
        image(img.get(k), 0,0);

    popMatrix();
  }
  void load() {
    nImg = 0;
    img.clear();
    do{
      img.add(loadImage("img/"+nImg+".jpg"));
      nImg++;
    }while(loadImage("img/"+nImg+".jpg") != null);
    printArray(img);
  }
}