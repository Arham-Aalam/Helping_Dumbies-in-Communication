
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
     case "A" : return "I am A";
     case "B" : return "I am B";
     case "C" : return "I am C";
     case "D" : return "I am D";
     case "E" : return "I am E";
     case "F" : return "I am F";
     case "G" : return "I am G";
     case "H" : return "I am H";
     case "I" : return "I am I";
     case "J" : return "I am J";
     case "K" : return "I am K";
     case "L" : return "I am L";
     case "M" : return "I am M";
     case "N" : return "I am N";
     case "O" : return "I am O";
     case "AB" : return "I am AB";
     case "AC" : return "I am AC";
     case "AD" : return "I am AD";
     case "AF" : return "I am AF";
     case "AG" : return "I am AG";
     case "AH" : return "I am AH";
     case "AI" : return "I am AI";
     case "AJ" : return "I am AJ";
     case "AK" : return "I am AK";
     case "AM" : return "I am AM";
    }
    return "/";  
}
}