Sub Macro1()
'
' Macro1 Macro
'
'
    Selection.PasteAndFormat (wdFormatPlainText)
End Sub
Sub Macro2()
'
' Macro2 Macro
'
'
    Selection.Font.Bold = wdToggle
    If Selection.Font.Underline = wdUnderlineNone Then
        Selection.Font.Underline = wdUnderlineSingle
    Else
        Selection.Font.Underline = wdUnderlineNone
    End If
End Sub
Sub Macro3()
'
' Macro3 Macro
'
'
    If Selection.Font.Underline = wdUnderlineNone Then
        Selection.Font.Underline = wdUnderlineSingle
    Else
        Selection.Font.Underline = wdUnderlineNone
    End If
End Sub

Sub Macro5()
'Selection.Font.Color = wdColorRed
'WasteTime (3)
Selection.Font.Color = wdColorBlack
End Sub
Sub WasteTime(Finish As Long)
 
    Dim NowTick As Long
    Dim EndTick As Long
 
    EndTick = GetTickCount + (Finish * 1000)
     
    Do
 
        NowTick = GetTickCount
        DoEvents
 
    Loop Until NowTick >= EndTick
 
End Sub
