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

  void feedGestures(PImage snap,color r,color g,color b){
    int loc;
    color pixCol;
    HashMap<Character,Integer> colSet = new HashMap<Character,Integer>();
    snap.loadPixels();
    for(int x=0;x<snap.width;x++){
     for(int y=0;y<snap.height;y++){
       loc = x + y * snap.width;
       pixCol = snap.pixels[loc];
       if(abs(pixCol - r) <= 25 && !colSet.containsKey('R')){
         colSet.put('R',1);
       }else if(abs(pixCol - g) <= 25 && !colSet.containsKey('G')){
         colSet.put('G',1);
       }else if(abs(pixCol - b) <= 25 && !colSet.containsKey('B')){
         colSet.put('B',1);
       }
     }
    }
    if(!colSet.isEmpty())
      println(colSet);
  }
  
}