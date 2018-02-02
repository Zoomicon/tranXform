//Title:        Java Class to XML
//Author:       G.Birbilis (birbilis@kagi.com)
//Copyright:    Copyright (c) 2001-2004
//Description:  Extracts the structure of a Java class to an XML tree
//Version: 1Nov2004

package java2xml;

import java.lang.reflect.*;

public class JavaClassToXML {

 private XML xml=new XML();

 public JavaClassToXML(String classname) throws ClassNotFoundException{
  Class c=Class.forName(classname);
  Utils.output(Utils.getXMLheader("1.0","ISO-8859-1",true,"CLASS","JavaClass.dtd","JavaClass.xsl")
               +"\n"+class2xml(c));
 }

 public static final String TAG_NAME="NAME";
 public static final String TAG_CLASS="CLASS";
 public static final String TAG_SUPERCLASS="SUPERCLASS";
 public static final String TAG_CLASS_MODIFIERS="CLASS_MODIFIERS";
 public static final String TAG_CONSTRUCTORS="CONSTRUCTORS";
 public static final String TAG_CONSTRUCTOR="CONSTRUCTOR";
 public static final String TAG_METHODS="METHODS";
 public static final String TAG_METHOD="METHOD"; 
 public static final String TAG_METHOD_MODIFIERS="METHOD_MODIFIERS";
 public static final String TAG_FIELDS="FIELDS";
 public static final String TAG_FIELD="FIELD";
 public static final String TAG_FIELD_MODIFIERS="FIELD_MODIFIERS";
 public static final String TAG_TYPE="TYPE";

 public static final String ATTR_PUBLIC="public";
 public static final String ATTR_PRIVATE="private";
 public static final String ATTR_PROTECTED="protected";
 public static final String ATTR_ABSTRACT="abstract";
 public static final String ATTR_STATIC="static"; 
 public static final String ATTR_FINAL="final";
 public static final String ATTR_TRANSIENT="transient";
 public static final String ATTR_VOLATILE="volatile";
 public static final String ATTR_NATIVE="native";
 public static final String ATTR_SYNCHRONIZED="synchronized";
 public static final String ATTR_INTERFACE="interface"; 
 public static final String ATTR_STRICT="strictfp";

 //

 protected void appendModifier(StringBuffer b,String modifier){
  b.append(" "+modifier+"=\"\"");
 }

 public String modifiers2xml(int mod,String tag){
  if(mod==0) return "";
  StringBuffer b=new StringBuffer();

	if ((mod & Modifier.PUBLIC) != 0)	appendModifier(b,ATTR_PUBLIC);
	if ((mod & Modifier.PRIVATE) != 0)	appendModifier(b,ATTR_PRIVATE);
	if ((mod & Modifier.PROTECTED) != 0) appendModifier(b,ATTR_PROTECTED);

	/* Canonical order */
	if ((mod & Modifier.ABSTRACT) != 0)	appendModifier(b,ATTR_ABSTRACT);
	if ((mod & Modifier.STATIC) != 0)	appendModifier(b,ATTR_STATIC);
	if ((mod & Modifier.FINAL) != 0) appendModifier(b,ATTR_FINAL);
	if ((mod & Modifier.TRANSIENT) != 0) appendModifier(b,ATTR_TRANSIENT);
	if ((mod & Modifier.VOLATILE) != 0)	appendModifier(b,ATTR_VOLATILE);

	if ((mod & Modifier.NATIVE) != 0)	appendModifier(b,ATTR_NATIVE);
	if ((mod & Modifier.SYNCHRONIZED) != 0)	appendModifier(b,ATTR_SYNCHRONIZED);

	if ((mod & Modifier.INTERFACE) != 0) appendModifier(b,ATTR_INTERFACE);

	if ((mod & Modifier.STRICT) != 0)	appendModifier(b,ATTR_STRICT);

  return xml.indent()+xml.openAndCloseTag(tag,b.toString())+'\n';
 }

 public String name2xml(String name){
  return xml.pushTag(TAG_NAME)+name+xml.popTagNoIndentCR();
 }

 public String constructor2xml(Constructor co){
  StringBuffer b=new StringBuffer();
  b.append(xml.pushTagCR(TAG_CONSTRUCTOR));

  //constructor name
  b.append(name2xml(co.getName()));

  //constructor modifiers
  b.append(modifiers2xml(co.getModifiers(),TAG_METHOD_MODIFIERS));

  b.append(xml.popTagCR());
  return b.toString();
 }

 public String method2xml(Method m){
  StringBuffer b=new StringBuffer();
  b.append(xml.pushTagCR(TAG_METHOD));

  //method name
  b.append(name2xml(m.getName()));

  //method modifiers
  b.append(modifiers2xml(m.getModifiers(),TAG_METHOD_MODIFIERS));

  b.append(xml.popTagCR());
  return b.toString();
 }

 public String field2xml(Field f){
  StringBuffer b=new StringBuffer();
  b.append(xml.pushTagCR(TAG_FIELD));

  //field name
  b.append(name2xml(f.getName()));

  //field type
  b.append(xml.pushTag(TAG_TYPE));
  b.append(f.getType().getName());
  b.append(xml.popTagCR());

  //field modifiers
  b.append(modifiers2xml(f.getModifiers(),TAG_FIELD_MODIFIERS));

  b.append(xml.popTagCR());
  return b.toString();
 }

 public String class2xml(Class c){
  StringBuffer b=new StringBuffer();
  b.append(xml.pushTagCR(TAG_CLASS));

  //class name
  b.append(name2xml(c.getName()));

  //super class
  b.append(xml.pushTagCR(TAG_SUPERCLASS));
  b.append(name2xml(c.getSuperclass().getName()));
  b.append(xml.popTagCR());

  //class modifiers
  b.append(modifiers2xml(c.getModifiers(),TAG_CLASS_MODIFIERS));

  //constructors
  b.append(xml.pushTagCR(TAG_CONSTRUCTORS));
  Constructor[] co=c.getConstructors();
  for(int i=0;i<co.length;i++) b.append(constructor2xml(co[i]));
  b.append(xml.popTagCR());

  //methods
  b.append(xml.pushTagCR(TAG_METHODS));
  Method[] m=c.getMethods();
  for(int i=0;i<m.length;i++) b.append(method2xml(m[i]));
  b.append(xml.popTagCR());

  //fields
  b.append(xml.pushTagCR(TAG_FIELDS));
  Field[] f=c.getFields();
  for(int i=0;i<f.length;i++) b.append(field2xml(f[i]));
  b.append(xml.popTagCR());

  b.append(xml.popTagCR());
  return b.toString();
 }

 //

 public static void main(String args[]){
  try{
   new JavaClassToXML(args[0]);
  }catch(Exception e){System.err.println(e);}
 }

}
