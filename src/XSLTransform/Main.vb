'XSLTransform - Transforms an XML document via an XSL stylesheet
'(C)2002-2014 George Birbilis (birbilis@kagi.com)
'Version: 20140926

Imports System.Xml.Xsl
Imports Mvp.Xml.XInclude
Imports System.Xml.XPath
Imports System.IO

Module Main

  Const ERR_SYNTAX As Integer = 1
  Const ERR_TRANSFORM As Integer = 2

  Function Main(ByVal params() As String) As Integer
    If params.Length <> 3 Then
      Console.WriteLine("Syntax: xmlFile xslFile outFile")
      Return ERR_SYNTAX
    End If

    Try
      Dim xmlFile As String = params(0)
      Dim xslFile As String = params(1)
      Dim outFile As String = params(2)

      'Dim transform As New XslTransform() 'deprecated
      'transform.Load(xslFile)
      'transform.Transform(xmlFile, outFile)

      Dim transform As New XslCompiledTransform()
      transform.Load(xslFile)

      Dim reader As New XIncludingReader(xmlFile)
      'reader.XmlResolver = New XmlTracingResolver() 'prints to debug output the URL absolutepaths

      Dim xdoc As New XPathDocument(reader)
      transform.Transform(xdoc, Nothing, New StreamWriter(outFile))

    Catch e As Exception
      Console.WriteLine("Transformation error: " & e.Message) 'use e.ToString instead of e.Message to see stack trace
      Return ERR_TRANSFORM
    End Try

    Return 0  ' Zero usually means successful completion.
  End Function

End Module
