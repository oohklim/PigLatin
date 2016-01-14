import java.util.*;

public void setup() {
	String lines[] = loadStrings("words.txt");
	String hymn[] = loadStrings("LowellHymn.txt");
	// System.out.println("there are " + lines.length + " lines");
	// for (int i = 0 ; i < lines.length; i++) {
	//   System.out.println(pigLatin(lines[i]));
	// }
	for (int i = 0 ; i < hymn.length; i++) {
	  String sTemp = hymn[i].toLowerCase();
	  int iTemp = 0;
	  if(hymn[i].equals("")){System.out.println("");}
	  for(int j = 0; j < sTemp.length(); j++)
	  {
	  	if(sTemp.substring(j, j + 1).equals(" "))
	  	{
	  		System.out.print(pigLatin(sTemp.substring(iTemp,j)) + " ");
	  		iTemp = j + 1;
	  	}
	  	else if(sTemp.substring(j, j + 1).equals(","))
	  	{
	  		System.out.println(pigLatin(sTemp.substring(iTemp,j)) + ",");
	  		break;
	  	}
	    else if(sTemp.substring(j, j + 1).equals("."))
	  	{
	  		System.out.println(pigLatin(sTemp.substring(iTemp,j)) + ".");
	  		break;
	  	}
	  }
	}
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	for(int i = 0; i < sWord.length(); i++)
	{
		if(isVowel(sWord.substring(i, i + 1)))
		{
			return i;
		}
	}
	return -1;
}
public boolean isVowel(String sWord)
{
  return(sWord.equals("a") || sWord.equals("e") || sWord.equals("i") || 
         sWord.equals("o") || sWord.equals("u") || sWord.equals("A") || 
         sWord.equals("E") || sWord.equals("I") || sWord.equals("O") || 
         sWord.equals("U"));
}
public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	else if(findFirstVowel(sWord) == 0)
	{
		return sWord + "way";
	}
	else if(sWord.substring(0,2).equals("qu"))
	{
		return sWord.substring(2) + "quay";
	}
	else if(findFirstVowel(sWord) != 0)
	{
		return sWord.substring(findFirstVowel(sWord)) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
	}
	else
	{
		return "ERROR!";
	}
}
