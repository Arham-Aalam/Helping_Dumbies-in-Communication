class Train{
  float rX,rY,gX,gY,bX,bY;
  
  Train(){
   rX =  width/6;
   rY = width/12;
   gX = width/2;
   gY = width/12;
   bX = (width/2)+(width/3);
   bY = width/12;
  }
  
  void showCol(boolean r,boolean g,boolean b){
   if(!r){ 
        textSize(20);
    fill(255, 0, 50);
    text("Put red finger", rX - 50,rY - 20); 
    noFill();
   stroke(255,0,0);
   strokeWeight(2);
   ellipse(rX,rY,20,20);
  }
  if(!g){
   textSize(20);
    fill(0, 255, 50);
    text("Put Green finger", gX - 50,gY - 20);
   noFill();
   stroke(0,255,0);
   strokeWeight(2);
   ellipse(gX,gY,20,20);
  }
  if(!b){
   textSize(20);
    fill(25, 0, 255);
    text("Put Blue finger", bX-50,bY - 20);
   noFill();
   stroke(0,0,255);
   strokeWeight(2);
   ellipse(bX,bY,20,20);
  }  
}
  color colorPicker(color track,int x_,int y_){
    int threshold = 100;
     int Loc = x_+y_*video.width;
    color tCol = video.pixels[Loc];
      float r1 = red(tCol);
      float g1 = green(tCol);
      float b1 = blue(tCol);
      float r2 = red(track);
      float g2 = green(track);
      float b2 = blue(track);
      float d = dist(r1,g1,b1,r2,g2,b2);
      if(d > threshold){
        fill(tCol);
        rect(x_,y_,20,20);
        return tCol;
      }
      return -1;
  }
}