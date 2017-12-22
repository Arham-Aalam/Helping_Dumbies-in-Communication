
import processing.video.*;
// Variable for capture device
Capture video;
AudioSpeech as;
Movie movie;

// for taking some time
boolean takeTime = false;

// A variable for the color we are searching for.
color trackColor,redFing,greenFing,blueFing,recCol;

int i =0,j=0,activation1 = 0,activation2 = 0,chBox;
PImage prev,preBox;
PImage startImg,recogImg,crrBox,exampleImg1,exampleImg2;

String preExpS = new String("");
String gesM2 = new String("");

// All variable and buildIn datatypes declearations
int ch,globLoc,displayCnt,recogW,recogH;
color traceRed,traceGreen,traceBlue;
boolean red = false,green = false,blue = false,boxPC = false;
float recogX,recogY;
double recPercent;

//Example variables
int examVI = -1;
char exmKey = 'B';

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
  //println(cam[0]);
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
  crrBox = createImage(recogW,recogH,RGB);
  preBox = createImage(recogW,recogH,RGB);
  rec = new Recognize(40,height/10,180,40,(width/5)+(width/6),height/10,180,40,3*(width/4),height/10);
  chBox = 0;
  
  // text to audio object
  as = new AudioSpeech();
//  movie = new Movie(this, "exampleVideo.mp4");

// for example images
exampleImg1 = loadImage("examples/A.jpeg");
exampleImg2 = loadImage("examples/upload.png");
}

void movieEvent(Movie m) {
  m.read();
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
  if(j < 25){
  j++;
  }else if(j == 25) {
  crrBox.copy(video,(int)recogX,(int)recogY,recogW,recogH,0,0,crrBox.width,crrBox.height);
  crrBox.updatePixels();
    j = 0;
  }
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
  
  if(!takeTime)
    image(video,0,0);
  
  //default starting of programe
    if(ch == 10){
      image(startImg,video.width/3,video.height/3,video.width/3,video.width/3);
    }
    
    // gives manus
    if(ch == 0){
     m1.showButtons();
     if(m1.choice(video,prev) == 1){
       println("Train button pressed");
       ch = 1;
         red = false;
         blue = false;
         green = false;
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
       ch = 3;
       examVI = -1;
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
        text("Successfully picked all three colors", video.width/6,video.height/4);
        fill(redFing);
        rect(video.width/6,video.height/2,50,50);
        fill(greenFing);
        rect(video.width/2,video.height/2,50,50);
        fill(blueFing);
        rect((video.width/2)+(video.width/3),video.height/2,50,50);
        // for some delay
        textSize(30);
        fill(150, 50, 50);
        text("Please wait Loading Manu....",video.width/6,3 * video.height/4);
        displayCnt++;
        if(displayCnt == 301){
          ch = 0;
         displayCnt = 0; 
        }
      }
      if(ch == 12){
        // for some delay after examples
        textSize(30);
        fill(150, 50, 50);
        text("Please wait Loading Manu....",video.width/6,3 * video.height/4);
        displayCnt++;
        if(displayCnt == 301){
          ch = 0;
          displayCnt = 0;
      }
      }
    
    //track color - recognition part
    if(ch == 2){
      textSize(32);
      fill(255,0,0);
      text("show gestures in the below Box",recogX+20,40);
      noFill();
      stroke(0,0,255);
      strokeWeight(2);
      rect(recogX,recogY,recogW,recogH);
      textSize(22);
      fill(0,0,255);
      text(chBox +" gesture recognition Mode",recogX+20,recogY-30);
      ColSets cols = new ColSets();
    
    //show options for boxes and get the choice
    rec.showOpt();
    if(m1.choice(video, prev,rec) == 1)
      chBox = 2;
    else if(m1.choice(video, prev,rec) == 2)
      chBox = 1;
    else if(m1.choice(video, prev,rec) == 3){
      chBox = 0;
      ch = 12;
      takeTime = false;
    }

    if(j == 0 && !rec.isDiff(recogImg, crrBox)){
      if(chBox == 1){  // if user want to make one window or box gestures
    
      String h = new String("");
       h = rec.feedGestures(recogImg,redFing,greenFing,blueFing);
     if(h.length() == 0){
         activation1 = 0;
         takeTime = false;   
     }
     else if(h.length() > 0){
           // for recognizing three times then activating
       println(activation1);
       if(activation1 == 4){
         activation1 = 0;
         preExpS = "";
         String expS = cols.showWord(cols.matchIt(h));
         preExpS += expS;
         if(expS != "/"){
           println(preExpS);
            textSize(30);
            fill(0,0,255);
            text(preExpS,width/2,height/3);
         }
         takeTime = true;
         // shows one gesture is recognize
         for(int ii=0;ii<75;ii++){
            fill(15,0,255);
            rect(0,0,video.width,video.height);
            textSize(25);
            fill(255,0,0);
            text("Gesture recognized!",width/3,height/2);
         }
         if(preExpS != "/")
            as.speakString(preExpS);
       }
       activation1++;
       h = "";
    }
    activation2 = 0;
    }else if(chBox == 2){ // if user want to make two box gestures
      
      String h = new String("");
      h = rec.feedGestures(recogImg,redFing,greenFing,blueFing);
     if(h.length() == 0){
         activation2 = 0;
         takeTime = false;  
   }
     else if(h.length() > 0){
           // for recognizing three times then activating
       println(activation2);
       if(activation2 == 3){
         activation2 = 0;
         preExpS = "";
         String expCh = cols.matchIt(h);
         if(expCh != "/"){
           gesM2 += expCh;
         }
         takeTime = true;
         // shows one gesture is recognize
         for(int ii=0;ii<255;ii++){
            fill(15,0,255);
            rect(0,0,video.width,video.height);
            textSize(25);
            fill(255,0,0);
            text("Gesture recognized!",width/3,height/2);
         }
       }
       if(gesM2.length() == 2){
         preExpS = cols.showWord(gesM2);
         println(gesM2);
         gesM2 = "";
         if(preExpS != "/" && preExpS != "//")
         as.speakString(preExpS);
       }

       activation2++;
       h = "";
    }
      activation1 = 0;
    }

    }
            textSize(20);
            fill(255,0,0);
            if(preExpS != "/")
            text(preExpS,2 * width/3-40,height/2+30);
            
 }
 //color recognition Ends here
 
 //Exaples starts here
 if(ch == 3){
   //reading pixels
   color examplePic1 = video.pixels[width/5 + (2*height/3+50)*video.width];
   
     textSize(32);
     fill(255,10,10);
     text("Choose the examples",50,height/12);
     // menu code for examples
     m1.showExaples();
       
     if(m1.choice(video,prev,2) == 1 || examVI == 1){
       examVI = 1;
         //image(movie,width/3,20,width/3,width/3);
         //movie.play();
         // show various categories
         if(cate == 1){ // for hospital
           textSize(32);
           fill(255,10,10);
           text(cols.showWord("A"),50,height/12);
           text(cols.showWord("A"),50,height/10);
           text(cols.showWord("A"),50,height/8);
         }else if(cate == 2){ // for school
           
         }
     }
      if(m1.choice(video,prev,2) == 2 || examVI == 2){
       examVI = 2;
         image(exampleImg1,width/10,height/3,200,200);
         image(exampleImg2,width/5,2*height/3+20,50,50);
         color examplePic2 = video.pixels[width/5 + (2*height/3+50)*video.width];
         if(dist(red(examplePic2),blue(examplePic2),green(examplePic2),red(examplePic1),blue(examplePic2),green(examplePic2)) > 20){
           exampleImg1 = loadImage("examples/"+exmKey+".jpeg");
           exmKey++;
           if(exmKey == 'P')
             exmKey = 'A';
         }
   }
     if(examVI != -1){
         m1.showExit();
         if(m1.choice(video,prev,-1) == 3){
           ch = 12;
           displayCnt = 0;  
       }
     }
 }
 
}

void mousePressed(){
  ch = 0;
}