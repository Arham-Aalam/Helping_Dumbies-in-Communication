public class Buttons{
  String str;
  int bX,bY,bW,bH,textX,textY;
  Buttons(String s,int x, int y){
    this.str = s;
    this.bX = x;
    this.bY = y;
    this.bW = 20*s.length();
    this.bH = 50;
    this.textX = (bX)+bW/4;
    this.textY = (bY)+7*bH/12;
  } 
  Buttons(String s,int x, int y,int w,int h){
    this.str = s;
    this.bX = x;
    this.bY = y;
    this.bW = w;
    this.bH = h;
    this.textX = (bX)+bW/4;
    this.textY = (bY)+7*bH/12;
  }
 public void drawButton(){
    fill(color(0,0,255));  
    rect(this.bX,this.bY,this.bW,this.bH);
    fill(150, 102, 0);
    textSize(20);
    text(this.str, this.textX, this.textY); 
  }
  void buttonRes(){
    fill(color(220, 50, 0));  
    rect(this.bX,this.bY,this.bW,this.bH);
    fill(0,0,255);
    textSize(20);
    text(this.str, this.textX, this.textY);  
  }
}