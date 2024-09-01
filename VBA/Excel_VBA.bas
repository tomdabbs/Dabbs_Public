'Module 1
'Refreshes range of cells with stock ticker symbols and then updates linked data associated with those symbols.
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
'Allows user to select a cell which contains a stock ticker symbol (ex/ Apple ticker equals AAPL), then opens Yahoo finance for the selected stock.
Dim WebUrl As String
Dim i As Integer
WebUrl = "https://finance.yahoo.com/quote/" & ActiveCell.Value & """"
Shell ("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe -url " & WebUrl)

End Sub


'Module 2
'Saves workbook and then closes. Used for password spreadsheet.
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
' Macro2 Macro
' Shortcut for copying in data from other sources as Paste Values Only.
' Keyboard Shortcut: Ctrl+q
    
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Application.CutCopyMode = False
End Sub
