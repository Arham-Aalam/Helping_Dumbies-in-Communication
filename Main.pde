
PImage prev;
PImage startImg;
import processing.video.*;

// Variable for capture device
Capture video;

// A variable for the color we are searching for.
color trackColor; 

// All variable and buildIn datatypes declearations
int ch,globLoc;
color traceRed,traceGreen,traceBlue;
boolean red = false,green = false,blue = false;

//User define classes declearation
Manu m1;
Train t1;

boolean f = false;
void setup() {
  size(640,480);
  String[] cam = Capture.list();
  video = new Capture(this, cam[0]);
  video.start();
  // Start off tracking for red
  trackColor = color(0, 0, 255);
  println(cam[0]);
  ch = 10;
  prev = createImage(640,480,RGB);
  startImg = loadImage("start.png");
  t1 = new Train();
  red = false;
  green = false;
  blue = false;
}

void captureEvent(Capture video) {
  if(ch == 0){
  prev.copy(video,0,0,video.width,video.height,0,0,prev.width,prev.height);
  prev.updatePixels();
  //code for state ch -> 1
   globLoc = (width/6)+(height/12)*video.width;
    traceRed = video.pixels[globLoc];
    globLoc = width/2 + (width/12)*video.width;
    traceGreen = video.pixels[globLoc];
    globLoc = (width/2)+(width/3) + (width/12)*video.width;
    traceBlue = video.pixels[globLoc];
}
  // Read image from the camera
  video.read();
}

void draw() {
  video.loadPixels();
  prev.loadPixels();
  image(video,0,0);
  //default Menu of programe
    if(ch == 10){
      image(startImg,width/3,height/3,width/3,width/3);
    }
    if(ch == 0){
     m1 = new Manu();
     m1.showButtons();
     if(m1.choice(video,prev) == 1){
       println("Train button pressed");
       ch = 1;
     }else if(m1.choice(video,prev) == 2){
       println("recognize button pressed");
       ch = 10;
     }else if(m1.choice(video,prev) == 3){
       println("result button pressed");
       ch = 10;
     }
    }
  // ends menu
  
  
  //color picking state starts
    if(ch == 1){
      t1.showCol(red,green,blue);
      if(t1.colorPicker(traceRed,(int)t1.rX,(int)t1.rY) != -1 && red == false){
        println("red color picked : "+ t1.colorPicker(traceRed,(int)t1.rX,(int)t1.rY));
        red = true;
      }
        if(t1.colorPicker(traceGreen,(int)t1.gX,(int)t1.gY) != -1 && green == false){
        println("green color picked : "+ t1.colorPicker(traceGreen,(int)t1.gX,(int)t1.gY));
        green = true;
      }
      if(t1.colorPicker(traceBlue,(int)t1.bX,(int)t1.bY) != -1 && blue == false){
        println("blue color picked : "+ t1.colorPicker(traceBlue,(int)t1.bX,(int)t1.bY));
        blue = true;
      }
  }
    
    
    //track color - recognition part
    
    if(ch == 2){
  //color picking state ends here
  // Before we begin searching, the "world record" for closest color is set to a high number that is easy for the first pixel to beat.
  float worldRecord = 500; 

  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);
      
      // Using euclidean distance to compare colors
      float d = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
      
    }
  }

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
 
  if (worldRecord < 10) { 
    // Draw a circle at the tracked pixel
    fill(trackColor);
    strokeWeight(4.0);
    stroke(0);
    ellipse(closestX,closestY,10,10);
    //image(img,closestX, closestY);
  }
 }
 //color tracking Ends here
}

void mousePressed(){
  /*
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
  //img = loadImage("india.jpg");
  float r2 = red(trackColor);
  float g2 = green(trackColor);
  float b2 = blue(trackColor);
  println(r2,g2,b2);
  */
  ch = 0;
}
  