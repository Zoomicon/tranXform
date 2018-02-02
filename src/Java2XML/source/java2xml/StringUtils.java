//Description: String utilities
//Author: George Birbilis (birbilis@kagi.com)
//Copyright: Copyright (c) 2001-2004
//Version: 1Nov2004

package java2xml;

public class StringUtils {

 public static boolean isDoubleQuoted(String str){
  if(str==null) return false;
  int len=str.length();
  return (len>2 && str.charAt(0)=='"' && str.charAt(len-1)=='"');
 }

 public static boolean containsSpace(String str){
  return (str.indexOf(' ')>=0);
 }

 public static String doubleQuoteIfNeeded(String str){
  if(!isDoubleQuoted(str) && containsSpace(str)) return doubleQuote(str);
  else return str; 
 }

 public static String doubleQuote(String str){
  return '"'+str+'"';
 }

 public static String unDoubleQuote(String str){ //should also convert any """ to "
  if(isDoubleQuoted(str)) return trimBothEnds(str,1);
  else return str;
 }

 public static String trimBothEnds(String str,int chars){
  if(str==null) return null;
  return str.substring(2,str.length()-2);
 }

 public static String makeString(char c, int count){
  char[] chars=new char[count];
  for(int i=count;i-->0;) chars[i]=c;
  return new String(chars);
 }

 public static String combine(String[] strings, String partHeader, String separator){
  int len;
  if(strings==null || (len=strings.length)==0) return "";
  StringBuffer b=new StringBuffer(partHeader); //start with partHeader
  b.append(strings[0]); //add 1st item
  for(int i=1;i<len;i++){
   String s=strings[i];
   if(s!=null){
    b.append(separator); //add separator
    b.append(partHeader); //add partHeader for i-th item
    b.append(s); //add i-th item
   }
  }
  return b.toString();
 }

 public static String combine(String[] strings, String separator){
  return combine(strings,"",separator);
 }

 public static String[] breakup(String str, String separator){
  int pos=str.indexOf(separator);
  if(pos<0) return new String[]{str};

  String[] result=new String[countOccurences(str,separator)+1]; //the parts are the number of separators + 1

  int step=separator.length();
  int count=0;
  int lastpos=0;
  do{
   result[count]=str.substring(lastpos,pos);
   count++;
   pos=str.indexOf(separator,lastpos=pos+step);
  }while(pos>=0);
  if(lastpos<str.length()) result[count]=str.substring(lastpos);
  return result;
 }

 public static int countOccurences(String str, String substring){
  int pos=str.indexOf(substring);
  if(pos<0) return 0;

  int step=substring.length();
  int result=1;
  while((pos=str.indexOf(substring,pos+step))>=0) result++;
  return result;
 }

 public static boolean containsIgnoreCase(String[] strs, String s){
  if(s==null || strs==null) return false; //always return false for any null argument
  return (getArrayIndexIgnoreCase(strs,s)>=0);
 }

 public static int getArrayIndex(String[] strs, String s){
  if(s==null || strs==null) return -1; //always return -1 for any null argument
  for(int i=0,count=strs.length;i<count;i++){
   String ss=strs[i];
   if(ss!=null && ss.equals(s)) return i;
  }
  return -1; //not found
 }

 public static int getArrayIndexIgnoreCase(String[] strs, String s){
  if(s==null || strs==null) return -1; //always return -1 for any null argument
  for(int i=0,count=strs.length;i<count;i++){
   String ss=strs[i];
   if(ss!=null && ss.equalsIgnoreCase(s)) return i;
  }
  return -1; //not found
 }

}
