Sub Macro1()
' Macro1 Macro
' alt + q; copy and pastes in plain text

    Selection.PasteAndFormat (wdFormatPlainText)
End Sub

Sub Macro2()
' Macro2 Macro
' alt + w; toggles bold and underline
'
    Selection.Font.Bold = wdToggle
    If Selection.Font.Underline = wdUnderlineNone Then
        Selection.Font.Underline = wdUnderlineSingle
    Else
        Selection.Font.Underline = wdUnderlineNone
    End If
End Sub

Sub Macro3()
' Macro3 Macro
' alt + e; toggles underline
'
    If Selection.Font.Underline = wdUnderlineNone Then
        Selection.Font.Underline = wdUnderlineSingle
    Else
        Selection.Font.Underline = wdUnderlineNone
    End If
End Sub

Sub Macro5()
' Macro5 Macro
' alt + s; font set to black

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

Sub Macro4()
' Macro4 Macro
' alt + a; removes highlight
'
    Options.DefaultHighlightColorIndex = wdNoHighlight
    Selection.Range.HighlightColorIndex = wdNoHighlight
End Sub