'Filename: XmlTracingResolver
'Author: George Birbilis (http://zoomicon.com)
'Version: 20140926

Imports System.Xml

Public Class XmlTracingResolver
  Inherits XmlUrlResolver

  Public Overrides Function GetEntity(absoluteUri As Uri, role As String, ofObjectToReturn As Type) As Object
    If (absoluteUri = Nothing) Then Throw New ArgumentNullException("absoluteUri")

    Debug.Print(absoluteUri.AbsolutePath)

    Try
      Return MyBase.GetEntity(absoluteUri, role, ofObjectToReturn)
    Catch e As Exception
      Debug.Print(e.Message)
      Return Nothing
    End Try
  End Function

End Class
