//Description: XML utilities
//Author: George Birbilis (birbilis@kagi.com)
//Copyright:    Copyright (c) 2001-2004
//Version: 1Nov2004

package java2xml;

import java.util.Stack;

public class XML {

 private static final String CR="\n";

 ////////////////////////////////

 public static String openTag(String tagName){
  return "<"+tagName+">";
 }

 public static String openTag(String tagName,String params){
  if(params!=null && params!="")
   return "<"+tagName+" "+params+">";
  else
   return "<"+tagName+">";
 }

 public static String closeTag(String tagName){
  return "</"+tagName+">";
 }

 public static String openTagCR(String tagName){
  return openTag(tagName)+CR;
 }

 public static String closeTagCR(String tagName){
  return closeTag(tagName)+CR;
 }

 public static String openAndCloseTag(String tagName){
  return "<"+tagName+"/>";
 }

 public static String openAndCloseTag(String tagName,String params){
  return "<"+tagName+" "+params+"/>";
 }

 ////////////////////////////////

 protected Stack stack=new Stack();
 protected int indentPlaces=1;

 public String pushTag(String tagName){
  return pushTag(tagName,"");
 }

 public String pushTag(String tagName,String params){
  String result=indent()+openTag(tagName,params); //indent first, then push
  stack.push(tagName);
  return result;
 }

 public String popTagNoIndent(){
  String tagName=(String)stack.pop();
  return closeTag(tagName);
 }

 public String popTag(){
  String tag=popTagNoIndent(); //pop first, then indent
  return indent()+tag;
 }

 public String pushTagCR(String tagName){
  return pushTag(tagName)+CR;
 }

 public String pushTagCR(String tagName,String params){
  return pushTag(tagName,params)+CR;
 }

 public String popTagCR(){
  return popTag()+CR;
 }

 public String popTagNoIndentCR(){
  return popTagNoIndent()+CR;
 }

 public String indent(){
  return StringUtils.makeString(' ',stack.size()*indentPlaces);
 }

}
