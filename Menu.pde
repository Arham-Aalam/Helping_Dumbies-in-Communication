class Manu{
  Buttons b1,b2,b3,b4,b5,b6;
   Manu(){
      b1 = new Buttons("Train",20,height/10);
      b2 = new Buttons("Recognize",(width/5)+(width/6),height/10);
      b3 = new Buttons("Exaples",3*(width/4),height/10);
       //for examples
      b4 = new Buttons("Video",50,height/10);
      b5 = new Buttons("Images",(width/5)+(width/6),height/10);
      b6 = new Buttons("Exit",3*(width/4),height/10);
 }
   
   void showButtons(){
      b1.drawButton();
      b2.drawButton();
      b3.drawButton();
   }
   
   void showExit(){
    b6.drawButton();
   }
   
   void showExaples(){
     b4.drawButton();
     b5.drawButton();
   }
   
   int choice(Capture video, PImage prev){
     video.loadPixels();
     prev.loadPixels();
     float worldRecord = 150; 

/*
  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;
*/

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height/4; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      color trackColor = prev.pixels[loc];
      
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float bl1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float bl2 = blue(trackColor);
      
      // Using euclidean distance to compare colors
      float d = dist(r1, g1, bl1, r2, g2, bl2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d > worldRecord) {
        //checking the area of difference
        if((b1.bX <= x && b1.bX+100 >= x) && (b1.bY <= y && b1.bY+60 >= y)){
          fill(255,0,0);
          rect(b1.bX,b1.bY,b1.bW,b1.bH);
          return 1;
         //So the state is b1.str;
         }else if(b2.bX <= x && b2.bX+170 >= x && b2.bY <= y && b2.bY+60 >= y){
            fill(0,255,0);
          rect(b2.bX,b2.bY,b2.bW,b2.bH);
           return 2;
         //So the state is b2.str;
         }else if(b3.bX <= x && b3.bX+100 >= x && b3.bY <= y && b3.bY+60 >= y){
           fill(255,0,255);
          rect(b3.bX,b3.bY,b3.bW,b3.bH);
           return 3;
         //So the state is b3.str;
       }
 
      }
      
    }
   }
    return 0;  
  }
  int choice(Capture video, PImage prev, int f){
     video.loadPixels();
     prev.loadPixels();
     float worldRecord = 150; 

/*
  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;
*/

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height/4; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      color trackColor = prev.pixels[loc];
      
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float bl1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float bl2 = blue(trackColor);
      
      // Using euclidean distance to compare colors
      float d = dist(r1, g1, bl1, r2, g2, bl2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d > worldRecord) {
        //checking the area of difference
        if((b4.bX <= x && b4.bX+100 >= x) && (b4.bY <= y && b4.bY+60 >= y)){
          fill(255,0,0);
          rect(b4.bX,b4.bY,b4.bW,b4.bH);
          return 1;
         //So the state is b1.str;
         }else if(b5.bX <= x && b5.bX+170 >= x && b5.bY <= y && b5.bY+60 >= y){
            fill(0,255,0);
          rect(b5.bX,b5.bY,b5.bW,b5.bH);
           return 2;
         //So the state is b2.str;
         }else if(b6.bX <= x && b6.bX+100 >= x && b6.bY <= y && b6.bY+60 >= y && f == -1){
           fill(255,0,255);
          rect(b6.bX,b6.bY,b6.bW,b6.bH);
           return 3;
         //So the state is b3.str;
       }
      }
      
    }
   }
    return 0;  
  }

int choice(Capture video, PImage prev,Recognize rec){
   video.loadPixels();
     prev.loadPixels();
     float worldRecord = 150; 

/*
  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;
*/

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height/4; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      color trackColor = prev.pixels[loc];
      
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float bl1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float bl2 = blue(trackColor);
      
      // Using euclidean distance to compare colors
      float d = dist(r1, g1, bl1, r2, g2, bl2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d > worldRecord) {
        //checking the area of difference
        if((rec.b1x <= x && rec.b1x+rec.b1w >= x) && (rec.b1y <= y && rec.b1y+rec.b1h >= y)){
          fill(255,0,0);
          rect(rec.b1x,rec.b1y,rec.b1w,rec.b1h);
          return 1;
         //So the state is b1.str;
         }else if((rec.b2x <= x && rec.b2x+rec.b2w >= x) && (rec.b2y <= y && rec.b2y+rec.b2h >= y)){
            fill(0,255,0);
          rect(rec.b2x,rec.b2y,rec.b2w,rec.b2h);
           return 2;
         //So the state is b2.str;
         }else if(rec.exitX <= x && rec.exitX+100 >= x && rec.exitY <= y && rec.exitY+40 >= y){
           fill(255,0,255);
          rect(rec.exitX,rec.exitY,100,40);
           return 3;
         //So the state is b3.str;
       }
      }
      
    }
   }
    return 0;  
  }
}