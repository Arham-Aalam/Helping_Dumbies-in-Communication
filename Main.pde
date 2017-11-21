
PImage prev;
PImage startImg,recogImg;
import processing.video.*;
import java.lang.Exception;
// Variable for capture device
Capture video;

// A variable for the color we are searching for.
color trackColor,redFing,greenFing,blueFing,recCol; 
String h;

// All variable and buildIn datatypes declearations
int ch,globLoc,displayCnt,recogW,recogH;
color traceRed,traceGreen,traceBlue;
boolean red = false,green = false,blue = false,boxDifOn = false;
float recogX,recogY;
double recPercent;

//User define classes declearation
Manu m1;
Recognize rec;
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
  prev = createImage(width,height,RGB);
  startImg = loadImage("start.png");
  t1 = new Train();
  red = false;
  green = false;
  blue = false;
  displayCnt=0;
  // manu declearation
  m1 = new Manu();
  
  // recognition X ,Y,W,H 0,width/4,width/3+50,width/3+50 and images creating 
  recogX = 0;
  recogY = width/4;
  recogW = width/3+60;
  recogH = width/3+60;
  recogImg = createImage(recogW,recogH,RGB);
  rec = new Recognize();
}

void captureEvent(Capture video) {
  if(ch == 0){
  //code for state ch -> 1
   globLoc = (width/6)+(height/12)*video.width;
    traceRed = video.pixels[globLoc];
    globLoc = width/2 + (width/12)*video.width;
    traceGreen = video.pixels[globLoc];
    globLoc = (width/2)+(width/3) + (width/12)*video.width;
    traceBlue = video.pixels[globLoc]; 
}
  if(ch == 2){
  // recognition
 
  recogImg.copy(video,(int)recogX,(int)recogY,recogW,recogH,0,0,recogImg.width,recogImg.height);
  recogImg.loadPixels();
  recCol = recogImg.pixels[recogW/2 + recogH/2 * recogImg.width];
  
  boxDifOn = true;
  }
  
  // copy prev capture each times
  prev.copy(video,0,0,video.width,video.height,0,0,prev.width,prev.height);
  prev.updatePixels();
  // Read image from the camera
  video.read();
  
}

void draw() {
  video.loadPixels();
  prev.loadPixels();
  image(video,0,0);
  //default starting of programe
    if(ch == 10){
      image(startImg,width/3,height/3,width/3,width/3);
    }
    
    // gives manus
    if(ch == 0){
     m1.showButtons();
     if(m1.choice(video,prev) == 1){
       println("Train button pressed");
       ch = 1;
       if(red && green && blue){
          textSize(30);
         fill(255,10,10);
         text("You have already shown all the colors",50,height/2);
       }
     }
     else if(m1.choice(video,prev) == 2){
       println("recognize button pressed");
       if(red && green && blue)
         ch = 2;
        else {
         textSize(32);
         fill(255,10,10);
         text("show Colors first in train manu then recognize",50,height/2);
        //take some time
         displayCnt++;
        if(displayCnt == 301)
          ch = 10;  
      }
        
     }else if(m1.choice(video,prev) == 3){
       println("result button pressed");
       ch = 10;
     } 
    }
  // ends menu
  
  
  //color picking state starts
    if(ch == 1){
      t1.showCol(red,green,blue);
      if(red == false && t1.colorPicker(traceRed,(int)t1.rX,(int)t1.rY) != -1){
        println("red color picked : "+ t1.colorPicker(traceRed,(int)t1.rX,(int)t1.rY));
        redFing = t1.colorPicker(traceRed,(int)t1.rX,(int)t1.rY);
        red = true;
      }
        if(green == false && t1.colorPicker(traceGreen,(int)t1.gX,(int)t1.gY) != -1){
        println("green color picked : "+ t1.colorPicker(traceGreen,(int)t1.gX,(int)t1.gY));
        greenFing = t1.colorPicker(traceGreen,(int)t1.gX,(int)t1.gY);
        green = true;
      }
      if(blue == false && t1.colorPicker(traceBlue,(int)t1.bX,(int)t1.bY) != -1){
        println("blue color picked : "+ t1.colorPicker(traceBlue,(int)t1.bX,(int)t1.bY));
        blueFing = t1.colorPicker(traceBlue,(int)t1.bX,(int)t1.bY);
        blue = true;
      }
      // when ever you assign ch = 0 update the previous snapshot
      if(red && green && blue){
        ch = 11;
        displayCnt = 0;
      }
  }
      //Info about color picker
      if(ch == 11){
        textSize(30);
        fill(150, 50, 50);
        text("Successfully picked all three colors", width/6,height/4);
        fill(redFing);
        rect(width/6,height/2,50,50);
        fill(greenFing);
        rect(width/2,height/2,50,50);
        fill(blueFing);
        rect((width/2)+(width/3),height/2,50,50);
        // for some delay
        textSize(30);
        fill(150, 50, 50);
        text("Please wait Loading Manu....",width/6,3 * height/4);
        displayCnt++;
        if(displayCnt == 301)
          ch = 0;
          
      }
    
    //track color - recognition part
    
    if(ch == 2){
      textSize(32);
      fill(0,0,255);
      text("show gestures in the below Box",recogX+20,40);
      noFill();
      stroke(51);
      strokeWeight(2);
      rect(recogX,recogY,recogW,recogH);
      /*
      if(boxDifOn && rec.colorDiff(recCol,recogW/2,recogH/2,recogImg)){
        println(rec.feedGestures(recogImg,redFing,greenFing,blueFing));
        ch = 10;  
    }
    */
    h = rec.feedGestures(recogImg,redFing,greenFing,blueFing);
    if(h.length() == 0){
        h = rec.feedGestures(recogImg,redFing,greenFing,blueFing);
    }if(h.length() > 0){
       println(h);
      if(h.length() == 3){ 
       ch = 10;
        h = "";
    }
    }
 }
 //color recognition Ends here
}

void mousePressed(){
  ch = 0;
}
  