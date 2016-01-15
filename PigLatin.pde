import java.util.*;

public void setup() {
	String lines[] = loadStrings("words.txt");
	String hymn[] = loadStrings("LowellHymn.txt");
	// System.out.println("there are " + lines.length + " lines");
	// for (int i = 0 ; i < lines.length; i++) {
	//   System.out.println(pigLatin(lines[i]));
	// }
	for (int i = 0 ; i < hymn.length; i++){
	  String lowCase = hymn[i].toLowerCase();
	  int iTemp = 0;
	  if(hymn[i].equals("")){System.out.println("");}
	  // for(int j = 0; j < lowCase.length(); j++){
	  // 	if(lowCase.substring(j, j + 1).equals(" ")){
	  // 		if(iTemp == 0){
	  // 			String temp = pigLatin(lowCase.substring(iTemp,j)) + " ";
	  // 			System.out.print(temp.substring(0, 1).toUpperCase() + temp.substring(1));
	  // 		} else{
	  // 			System.out.print(pigLatin(lowCase.substring(iTemp,j)) + " ");
	  // 		}
	  // 		iTemp = j + 1;

	  // 	} else if(lowCase.substring(j, j + 1).equals(",")){
	  // 		System.out.println(pigLatin(lowCase.substring(iTemp,j)) + ",");
	  // 		break;
	  // 	} else if(lowCase.substring(j, j + 1).equals(".")){
	  // 		System.out.println(pigLatin(lowCase.substring(iTemp,j)) + ".");
	  // 		break;
	  // 	}
	  // }
	//   String pigText = hymn[i];
	//   for(int j = 0; j < pigText.length(); j++){
	//   	if(pigText.substring(j, j + 1).equals(" ")){
	//   		if(containsCapital(pigText.substring(iTemp,j)){


	  			
	//   			String temp = pigLatin(lowCase.substring(iTemp,j)) + " ";
	//   			System.out.print(temp.substring(0, 1).toUpperCase() + temp.substring(1));
	//   		} else{
	//   			System.out.print(pigLatin(lowCase.substring(iTemp,j)) + " ");
	//   		}
	//   		iTemp = j + 1;

	//   	} else if(lowCase.substring(j, j + 1).equals(",")){
	//   		System.out.println(pigLatin(lowCase.substring(iTemp,j)) + ",");
	//   		break;
	//   	} else if(lowCase.substring(j, j + 1).equals(".")){
	//   		System.out.println(pigLatin(lowCase.substring(iTemp,j)) + ".");
	//   		break;
	//   	}
	//   }
	// }
}
public int findFirstVowel(String sWord){
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
	for(int i = 0; i < sWord.length(); i++){
		if(isVowel(sWord.substring(i, i + 1))){
			return i;
		}
	}
	return -1;
}
public boolean containsCapital(String sWord){
	for(int i = 0; i < sWord.length(); i++){
		if(isCapital(sWord.substring(i, i + 1))){
			return true;
		}
	}
	return false;
}
public boolean isVowel(String sWord){
	return(sWord.equals("a") || sWord.equals("e") || sWord.equals("i") || 
         sWord.equals("o") || sWord.equals("u"));
}
public boolean isCapital(String sWord){
	return(sWord.equals("A") || sWord.equals("B") || sWord.equals("C") || 
         sWord.equals("D") || sWord.equals("E") || sWord.equals("F") || sWord.equals("G") || sWord.equals("H") || 
         sWord.equals("I") || sWord.equals("J") || sWord.equals("K") || sWord.equals("L") || sWord.equals("M") || 
         sWord.equals("N") || sWord.equals("O") || sWord.equals("P") || sWord.equals("Q") || sWord.equals("R") || 
         sWord.equals("S") || sWord.equals("T") || sWord.equals("U") || sWord.equals("V") || sWord.equals("W") || 
         sWord.equals("X") || sWord.equals("Y") || sWord.equals("Z"));

}
public String pigLatin(String sWord){
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
	if(findFirstVowel(sWord) == -1){
		return sWord + "ay";
	} else if(findFirstVowel(sWord) == 0){
		return sWord + "way";
	} else if(sWord.substring(0,2).equals("qu")){
		return sWord.substring(2) + "quay";
	} else if(findFirstVowel(sWord) != 0){
		return sWord.substring(findFirstVowel(sWord)) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
	} else{
		return "ERROR!";
	}
}
