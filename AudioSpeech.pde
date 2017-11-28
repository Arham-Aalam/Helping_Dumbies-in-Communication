import guru.ttslib.*;
public class AudioSpeech{
TTS sp;  
  
   AudioSpeech(){
     smooth();
    sp = new TTS(); 
   }
  
   void speakString(String str){
     sp.speak(str);  // convert text to speech
   }
  
}