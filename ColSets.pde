
class ColSets {
  String Set = "RB";
  char matchIt(String str){
    switch(str){
     case "R" : return 'A';
     case "RB" : return 'B';
     case "RG" : return 'C';
     case "B" : return 'D';
     case "BR" : return 'E';
     case "BG" : return 'F';
     case "G" : return 'G';
    }
    return '/';
}
  String showWord(char str){
    switch(str){
     case 'A' : return "I am A";
     case 'B' : return "I am B";
     case 'C' : return "I am C";
     case 'D' : return "I am D";
     case 'E' : return "I am E";
     case 'F' : return "I am F";
     case 'G' : return "I am G";
    }
    return "/";  
}
}