class Solution {
  private ArrayList<PImage> img = new ArrayList<PImage>();
  void paint(int k) {
    k-=48;

    imageMode(CENTER);
    pushMatrix();
    if (k>=0 && k<img.size())
      if (img.get(k) != null) 
        image(img.get(k), width/2, height/2);

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