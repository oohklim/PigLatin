import java.util.*;

public void setup() {
    String lines[] = loadStrings("words.txt");
    String hymn[] = loadStrings("LowellHymn.txt");
    System.out.println("there are " + lines.length + " lines");
    for (int i = 0 ; i < lines.length; i++) {
      System.out.println(pigLatin(lines[i]));
    }
    System.out.println();
    for (int i = 0; i < hymn.length; i++) {
        String pigText = hymn[i];
        int iTemp = 0;
        if (hymn[i].equals("")) {
            System.out.println("");
        }
        for (int j = 0; j < pigText.length(); j++) {
            if (pigText.substring(j, j + 1).equals(" ")) {
                System.out.print(pigLatin(pigText.substring(iTemp, j)) + " ");
                iTemp = j + 1;
            } else if (pigText.substring(j, j + 1).equals(",") || pigText.substring(j, j + 1).equals(".")) {
                System.out.println(pigLatin(pigText.substring(iTemp, j)) + pigText.substring(j, j + 1));
                break;
            }
        }
    }   
}
public int findFirstVowel(String sWord) {
    //precondition: sWord is a valid String of length greater than 0.
    //postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
    for (int i = 0; i < sWord.length(); i++) {
        if (isVowel(sWord.substring(i, i + 1))) {
            return i;
        }
    }
    return -1;
}
public boolean containsCapital(String sWord) {
    for (int i = 0; i < sWord.length(); i++) {
        if (isCapital(sWord.charAt(i))) {
            return true;
        }
    }
    return false;
}
public boolean isVowel(String sWord) {
    return sWord.matches("[aeiouAEIOU]");
}
public boolean isCapital(Character ch) {
    return Character.isUpperCase(ch);
}
public String pigLatin(String sWord) {
    //precondition: sWord is a valid String of length greater than 0
    //postcondition: returns the pig latin equivalent of sWord
    if (findFirstVowel(sWord) == -1) {
        return sWord + "ay";
    } else if (findFirstVowel(sWord) == 0) {
        return sWord + "way";
    } else if (sWord.substring(0, 2).equals("qu") || sWord.substring(0, 2).equals("Qu")) {
        return sWord.substring(2) + "quay";
    } else if (findFirstVowel(sWord) != 0) {
    	if (isCapital(sWord.charAt(0))) {
    		return sWord.substring(findFirstVowel(sWord), findFirstVowel(sWord) + 1).toUpperCase() + 
    			sWord.substring(findFirstVowel(sWord) + 1) + sWord.substring(0, findFirstVowel(sWord)).toLowerCase() + "ay";
    	} else {
    		return sWord.substring(findFirstVowel(sWord)) + sWord.substring(0, findFirstVowel(sWord)) + "ay"; 
    	}
    } else {
        return "ERROR!";
    }
}