//Title:        Java ResourceBundle to XML
//Author:       G.Birbilis (birbilis@kagi.com)
//Copyright:    Copyright (c) 2001-2004
//Description:  Extracts the contents of a Java ResourceBundle to an XML tree
//Version: 1Nov2004

package java2xml;

import java.util.*;

public class JavaResourceBundleToXML {

 private XML xml=new XML();

 public JavaResourceBundleToXML(String classname) throws ClassNotFoundException{
  Class c=Class.forName(classname);
  try{
   Utils.output(Utils.getXMLheader("1.0","ISO-8859-1",true,"CLASS","JavaResourceBundle.dtd","JavaResourceBundle.xsl")+"\n"
                +"\n"+resourceBundle2XML((ResourceBundle)c.newInstance()));
  }catch(Exception e){e.printStackTrace();}
 }

 public static final String TAG_RESOURCEBUNDLE="RESOURCEBUNDLE";
 public static final String TAG_ENTRY="ENTRY";
 public static final String TAG_KEY="KEY";
 public static final String TAG_VALUE="VALUE";

 public String keyValuePair2XML(String key,String value){
  StringBuffer b=new StringBuffer();
  b.append(xml.pushTagCR(TAG_ENTRY));
  b.append(xml.pushTag(TAG_KEY));
  b.append(key);
  b.append(xml.popTagNoIndentCR());

  b.append(xml.pushTag(TAG_VALUE));
  b.append(value);
  b.append(xml.popTagNoIndentCR());
  b.append(xml.popTagCR());
  return b.toString();
 }

 public String keyValuePair2XML(String key,String[] value){
  StringBuffer b=new StringBuffer();
  for(int i=0;i<value.length;i++) b.append(value[i]+'\n');
  return keyValuePair2XML(key,b.toString());
 }

 public String resourceBundle2XML(ResourceBundle bundle){
  StringBuffer b=new StringBuffer();
  b.append(xml.pushTagCR(TAG_RESOURCEBUNDLE));

  String xmlPart;
  Enumeration e=bundle.getKeys();
  while(e.hasMoreElements()){
   String key=(String)e.nextElement();
   try{xmlPart=keyValuePair2XML(key,bundle.getString(key));}
   catch(ClassCastException ex){xmlPart=keyValuePair2XML(key,bundle.getStringArray(key));}
   b.append(xmlPart);
  }

  b.append(xml.popTagCR());
  return b.toString();
 }

 //

 public static void main(String args[]){
  try{
   new JavaResourceBundleToXML(args[0]);
  }catch(Exception e){System.err.println(e);}
 }

}
