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
        int wordStart = 0;
        for (int j = 0; j < pigText.length(); j++) {
            if (wordStart < pigText.length() && wordStart < j) {
                if (pigText.substring(j, j + 1).equals(" ")) {
                    System.out.print(pigLatin(pigText.substring(wordStart, j)) + " ");
                    wordStart = j + 1;
                } else if (pigText.substring(j, j + 1).equals(",") || pigText.substring(j, j + 1).equals(".")) {
                    System.out.print(pigLatin(pigText.substring(wordStart, j)) + pigText.substring(j, j + 1) + " ");
                    wordStart = j + 2;
                }
            }
        }
        System.out.println();
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
public boolean isVowel(String sLetter) {
    return sLetter.matches("(?i)[aeiou]");
}
public String pigLatin(String sWord) {
    //precondition: sWord is a valid String of length greater than 0
    //postcondition: returns the pig latin equivalent of sWord
    int firstVowelIndex = findFirstVowel(sWord);
    if (firstVowelIndex == -1) {
        return sWord + "ay";
    }
    if (firstVowelIndex == 0) {
        return sWord + "way";
    } 
    if (sWord.startsWith("qu") || sWord.startsWith("Qu")) {
        return sWord.substring(2) + "quay";
    } 
    if (Character.isUpperCase(sWord.charAt(0))) {
    	return sWord.substring(firstVowelIndex, firstVowelIndex + 1).toUpperCase() + 
    		sWord.substring(firstVowelIndex + 1) + sWord.substring(0, firstVowelIndex).toLowerCase() + "ay";
    } 
    return sWord.substring(firstVowelIndex) + sWord.substring(0, firstVowelIndex) + "ay"; 
}
