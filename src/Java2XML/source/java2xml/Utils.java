//Title:        Java to XML utilities
//Author:       G.Birbilis (birbilis@kagi.com)
//Copyright:    Copyright (c) 2001-2004
//Description:  static utility methods
//Version: 1Nov2004

package java2xml;

public class Utils {

 public static void output(String s){
  System.out.print(s);
 }

 public static String getXMLheader(String version,String encoding,boolean standalone,String doctype,String dtdFile,String xslFile){
  return "<?xml version=\""+version+"\" encoding=\""+encoding+"\" standalone=\""+((standalone)?"yes":"no")+"\"?>\n" +
         "<!DOCTYPE "+doctype+" SYSTEM \""+dtdFile+"\">\n"+
         "<?xml:stylesheet type=\"text/xsl\" href=\""+xslFile+"\"?>";
 }

}
