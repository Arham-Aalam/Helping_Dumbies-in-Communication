import java.util.HashMap;

class Recognize {
    
   boolean colorDiff(color track,int x_,int y_,PImage snap){
     snap.loadPixels();
    int threshold = 150;
     int Loc = x_+y_*snap.width;
    color tCol = snap.pixels[Loc];
      float r1 = red(tCol);
      float g1 = green(tCol);
      float b1 = blue(tCol);
      float r2 = red(track);
      float g2 = green(track);
      float b2 = blue(track);
      float d = dist(r1,g1,b1,r2,g2,b2);
      if(d > threshold){
        return true;
      }
      return false;
  }

  String feedGestures(PImage snap,color r,color g,color b){
    image(snap,width/2,height/3,snap.width,snap.height);
    int loc;
    color pixCol;
    HashMap<Character,Integer> colSet = new HashMap<Character,Integer>();
    String str = "";
    snap.loadPixels();
    float r11 = red(r);
    float r12 = green(r);
    float r13 = blue(r);
      float g11 = red(g);
      float g12 = green(g);
      float g13 = blue(g);
        float b11 = red(b);
        float b12 = green(b);
        float b13 = blue(b);
      
    for(int x=0;x<snap.width;x++){
     for(int y=0;y<snap.height;y++){
       loc = x + y * snap.width;
       pixCol = snap.pixels[loc];
      float r2 = red(pixCol);
      float g2 = green(pixCol);
      float b2 = blue(pixCol);
       if(dist(r11,r12,r13,r2,g2,b2) <= 25 && !colSet.containsKey('R')){
         colSet.put('R',1);
         str += "R";
       }else if(dist(g11,g12,g13,r2,g2,b2) <= 25 && !colSet.containsKey('G')){
         colSet.put('G',1);
         str += "G";
       }else if(dist(b11,b12,b13,r2,g2,b2) <= 25 && !colSet.containsKey('B')){
         colSet.put('B',1);
         str += "B";
       }
     }
    }
      return str;
  }
}