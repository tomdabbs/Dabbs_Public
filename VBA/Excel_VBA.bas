'Module 1
Sub Macro1()

    If ActiveSheet.FilterMode Then ActiveSheet.ShowAllData
    Range("A4:A1200").Select
    Selection.Copy
    Range("B4").Select
    ActiveWindow.SmallScroll Down:=-3
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Selection.ConvertToLinkedDataType ServiceID:=268435456, LanguageCulture:= _
        "en-US"
End Sub
Sub FollowLink()

Dim WebUrl As String
Dim i As Integer

    'For i = 1 To ActiveSheet.Cells(1, 2).Value
    'WebUrl = "https://finance.yahoo.com/quote/" '& (i, 1).Value & """"
WebUrl = "https://finance.yahoo.com/quote/" & ActiveCell.Value & """"

Shell ("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe -url " & WebUrl)

End Sub


'Module 2
Dim CloseTime As Date
Sub TimeSetting()
    CloseTime = TimeValue("19:10:00")
    On Error Resume Next
    Application.OnTime EarliestTime:=CloseTime, _
      Procedure:="SavedAndClose", Schedule:=True
End Sub
Sub TimeStop()
    On Error Resume Next
    Application.OnTime EarliestTime:=CloseTime, _
      Procedure:="SavedAndClose", Schedule:=False
 End Sub
Sub SavedAndClose()
    ThisWorkbook.Close Savechanges:=True
End Sub


Sub PasteValues()
'
' Macro2 Macro
'
' Keyboard Shortcut: Ctrl+q
'
    'Range("A21").Select
    
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Application.CutCopyMode = False
End Sub
