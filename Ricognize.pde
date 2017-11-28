import java.util.HashMap;
class Recognize {
int b1x,b1y,b1w,b1h,b2x,b2y,b2w,b2h,exitX,exitY;
  Buttons bb1,bb2,bb3;  
    Recognize(int b1x,int b1y,int b1w,int b1h,int b2x,int b2y,int b2w,int b2h,int exitX,int exitY){
      this.bb1 = new Buttons("double Mode",b1x,b1y,b1w,b1h);
      this.bb2 = new Buttons("single Mode",b2x,b2y,b2w,b2h);
      this.bb3 = new Buttons("Exit",exitX,exitY);
      this.b1x = b1x;
      this.b1y = b1y;
      this.b1w = b1w;
      this.b1h = b1h;
      this.b2x = b2x;
      this.b2y = b2y;
      this.b2w = b2w;
      this.b2h = b2h;
      this.exitX  = exitX;
      this.exitY = exitY;
    }
    
    void showOpt(){
       bb1.drawButton();
       bb2.drawButton();
       bb3.drawButton();
    }
    
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
    String str = "";
    int loc;
    color pixCol;
    HashMap<Character,Integer> colSet = new HashMap<Character,Integer>();
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
       if(dist(r11,r12,r13,r2,g2,b2) <= 35 && !colSet.containsKey('R')){
         colSet.put('R',1);
         str += "R";
       }else if(dist(g11,g12,g13,r2,g2,b2) <= 35 && !colSet.containsKey('G')){
         colSet.put('G',1);
         str += "G";
       }else if(dist(b11,b12,b13,r2,g2,b2) <= 35 && !colSet.containsKey('B')){
         colSet.put('B',1);
         str += "B";
       }
     }
    }
       textSize(20);
    fill(0,0,255);
    text(str,width/2,height/3);
      return str;
  }
  
  boolean isDiff(PImage preSnap,PImage crrSnap){
    preSnap.loadPixels();
    crrSnap.loadPixels();
    for(int x=0;x<preSnap.width;x++){
       for(int y=0;y<preSnap.height;y++){
           int loc = x + y * preSnap.width;
           color preCol = preSnap.pixels[loc];
           color crrCol = crrSnap.pixels[loc];
           float r1 = red(preCol);
           float g1 = green(preCol);
           float b1 = blue(preCol);
           float r2 = red(crrCol);
           float g2 = green(crrCol);
           float b2 = blue(crrCol);
           if(dist(r1,g1,b1,r2,g2,b2) > 10)
             return true;
       }
    }
      return false;
  }
  
}