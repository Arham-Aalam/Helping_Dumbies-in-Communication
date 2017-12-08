
class ColSets {
  String Set = "RB";
  String matchIt(String str){
    switch(str){
     case "R" : return "A";
     case "RB" : return "B";
     case "RG" : return "C";
     case "B" : return "D";
     case "BR" : return "E";
     case "BG" : return "F";
     case "G" : return "G";
     case "GR" : return "H";
     case "GB" : return "I";
     case "RBG" : return "J";
     case "RGB" : return "K";
     case "BRG" : return "L";
     case "BGR" : return "M";
     case "GRB" : return "N";
     case "GBR" : return "O";
    }
    return "/";
}
  String showWord(String str){
    switch(str){
     case "A" : return "I need food";
     case "B" : return "I would like a cup of tea";
     case "C" : return "where do you come from";
     case "D" : return "with whom you want to meet";
     case "E" : return "good morning";
     case "F" : return "bye bye";
     case "G" : return "please give me assignment";
     case "H" : return "can i go to washroom";
     case "I" : return "i have feaver";
     case "J" : return "can i meet to the doctor";
     case "K" : return "what should i eat";
     case "L" : return "how much shall i pay you";
     case "M" : return "I am M";
     case "N" : return "I am N";
     case "O" : return "I am O";
     case "AB" : return "I am going to study";
     case "AC" : return "please give me water";
     case "AD" : return "I am going to watch T V";
     case "AE" : return "i am A E";
     case "AF" : return "I am A F";
     case "AG" : return "I am A G";
     case "AH" : return "I am A H";
     case "AI" : return "I am A I";
     case "AJ" : return "I am A J";
     case "AK" : return "I am A K";
     case "AL" : return "I am A L";
     case "AM" : return "I am A M";
     case "AN" : return "I am A N";
     case "AO" : return "I am A O";
     case "BA" : return "let's plan birthday party";
     case "BC" : return "where is news paper";
     case "BD" : return "would you like to have some coffee";
     case "BE" : return "I am B E";
     case "BF" : return "I am B F";
     case "BG" : return "I am B G";
     case "BH" : return "I am B H";
     case "BI" : return "I am B I";
     case "BJ" : return "I am B J";
     case "BK" : return "I am B K";
     case "BL" : return "I am B L";
     case "BM" : return "I am B M";
     case "BN" : return "I am B N";
     case "BO" : return "I am B O";
     case "CA" : return "I am C A";
     case "CB" : return "I am C B";
     case "CD" : return "I am C D";
     case "CE" : return "I am C E";
     case "CF" : return "I am C F";
     case "CG" : return "I am C G";
     case "CH" : return "I am C H";
     case "CI" : return "I am C I";
     case "CJ" : return "I am C J";
     case "CK" : return "I am C K";
     case "CL" : return "I am C L";
     case "CM" : return "I am C M";
     case "CN" : return "I am C N";
     case "CO" : return "I am C O";
     case "DA" : return "I am D A";
     case "DB" : return "I am D B";
     
     case "EF" : return "I can solve it";
     case "EG" : return "which is the next lecture";
     case "EH" : return "I did not do the assignment";
     
     case "FE" : return "I am preparing for exam";
     case "FG" : return "please explain once again";
     case "FH" : return "well done congrates";
     
     case "IJ" : return "please tell me how will i take this medicine";
     case "IK" : return "I need to make an appoinment with the doctor";
     case "IL" : return "i am feeling better than before";
     case "JI" : return "whats the matter";
     case "JK" : return "thank you doctor";
     case "JL" : return "i am so glad everything went well";
     
    }
    return "/";  
}
}