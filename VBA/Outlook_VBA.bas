Sub insertHTMLFile()
Dim insp As Inspector
Set insp = ActiveInspector
If insp.IsWordMail Then
Dim wordDoc As Word.Document
Set wordDoc = insp.WordEditor
wordDoc.Application.Selection.InsertFile "C:\Users\Owner\OneDrive - SOLLUS\SOLLUS\Marketing\marketing2_v1.html", , False, False, False
End If
End Sub

Sub AddiShipForm()

    ' https://msdn.microsoft.com/EN-US/library/office/ff861028.aspx

    Dim myNamespace As Outlook.NameSpace
    Dim myItems As Outlook.Items
    Dim myFolder As Outlook.Folder
    Dim MyItem As Outlook.MailItem

    Set myNamespace = Application.GetNamespace("MAPI")
    Set myFolder = myNamespace.GetDefaultFolder(olFolderInbox)
    Set myItems = myFolder.Items
    Set MyItem = myItems.Add("IPM.Note.Project_Template_v1")

    Set myNamespace = Nothing
    Set myFolder = Nothing
    Set myItems = Nothing
    Set MyItem = Nothing

End Sub
Sub MakeItem() '!!!!!DO NOT DELETE!!!!!!

Set newItem = Application.CreateItemFromTemplate("C:\Users\Owner\AppData\Roaming\Microsoft\Templates\Project.oft")    '_Template.oft")
newItem.Subject = "Project Name Here"
newItem.Body = "Be sure to modify Main Project Checkbox, and Project category. Updates dates as necessary."
newItem.StartDate = Now
newItem.DueDate = Now + 21
newItem.Display
Set newItem = Nothing

End Sub

Sub SubTaskItem() '!!!!!DO NOT DELETE!!!!!!
Dim objApp
Dim objInsp
Dim Task As Outlook.TaskItem
On Error Resume Next

Set objApp = GetObject("", "Outlook.Application")
Set objInsp = objApp.ActiveInspector.CurrentItem

If TypeName(objInsp) = "Nothing" Then
    MsgBox "No inspector window found"
Else
    Project = objInsp.Subject
    ProjectCat = objInsp.UserProperties("Project Category").Value

End If

'Dim MyItem As Outlook.TaskItem
Set outlook_app = CreateObject("Outlook.Application")

    With outlook_app.CreateItemFromTemplate("C:\Users\Owner\AppData\Roaming\Microsoft\Templates\ProjectTask.oft")
        .Importance = 1
        .Subject = "New SubTask"
        .StartDate = Now
        .DueDate = Now + 7
        '.ReminderTime = Now
        .Subject = Project & " - " '& ProjectCat
        '.Body = "Project Category: " & ProjectCat & " ; SubTasks Comments: " '"Main Project: " & Subject &
        .objInsp.UserProperties("Project Category").Value = ProjectCat
        .Display
        '.Save
    End With

Set objApp = GetObject("", "Outlook.Application")
Set objInsp = objApp.ActiveInspector.CurrentItem

If TypeName(objInsp) = "Nothing" Then
    MsgBox "No inspector window found"
Else
    objInsp.UserProperties("Project Category").Value = ProjectCat

End If
'MsgBox ProjectCat

End Sub
Sub create_outlook_task() 'THIS IS GOOD  '!!!!!DO NOT DELETE!!!!!!

'Const olImportanceLow = 0
'Const olImportanceNormal = 1
'Const olImportanceHigh = 2

Dim outlook_app As Object
Set outlook_app = CreateObject("Outlook.Application")

    With outlook_app.CreateItem(3)
        .Importance = 2
        .Subject = "THIS IS A TASK"
        .StartDate = Now + 5
        .DueDate = Now + 10
        .ReminderTime = Now - 3
        .Body = "HI YOU CREATED THIS TASK"
        .Display
        '.Save
    End With

Set outlook_app = Nothing

End Sub
Sub CreateFromTemplate() 'THIS IS BETTER / GREAT  '!!!!!DO NOT DELETE!!!!!!
Dim MyItem As Outlook.TaskItem
Set outlook_app = CreateObject("Outlook.Application")

    With outlook_app.CreateItemFromTemplate("C:\Users\Owner\AppData\Roaming\Microsoft\Templates\Project_Template.oft")
        .Importance = 2
        .Subject = "THIS IS A TASK"
        .StartDate = Now + 5
        .DueDate = Now + 10
        .ReminderTime = Now - 3
        .Body = "Main Project:  "
        .Display
        '.Save
    End With
 'Set MyItem = Application.CreateItemFromTemplate("C:\Users\Owner\AppData\Roaming\Microsoft\Templates\Project_Template.oft")
 'MyItem.Display
 
    
End Sub
Sub DisplayTaskItems() '!!!!!!!!!!!!!!!!DO NOT DELETE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Dim objApp
Dim objInsp
Dim Task As Outlook.TaskItem
On Error Resume Next
Set objApp = GetObject("", "Outlook.Application")
'If objApp Is Nothing Then
'Set objApp = Application.CreateObject("Outlook.Application")
'End If
Set objInsp = objApp.ActiveInspector.CurrentItem
If TypeName(objInsp) = "Nothing" Then
MsgBox "No inspector window found"
Exit Sub
Else
'Set Mail = Outlook.CreateItem(olMailItem)
'Set Task = Outlook.CreateItem(olTaskItem)
'With Task
'.To = "mymail@mymail.com"
'.BCC = "List1"
Subject = objInsp.Subject
Body = objInsp.UserProperties("Project Category").Value '!!!!!!!!!!THIS IS IMPORTANT!!!!!!!!!!!!!
Body = objInsp.UserProperties("Project Category").Value '!!!!!!!!!!THIS IS IMPORTANT!!!!!!!!!!!!!
'.Send
'End With
'Set Mail = Nothing
Debug.Print "Task Subject: " & Subject
Debug.Print "Due Date: " & Body
        'Debug.Print "Priority: " & priority
MsgBox "1"
MsgBox Subject
MsgBox Body
End If

End Sub
Sub create_outlook_marketing_email()

'Const olImportanceLow = 0
'Const olImportanceNormal = 1
'Const olImportanceHigh = 2

Dim outlook_app As Object
Set outlook_app = CreateObject("Outlook.Application")

Dim fso As Scripting.FileSystemObject
Dim tsTextIn As Scripting.TextStream
Dim strTextIn As String
Set fso = New Scripting.FileSystemObject
Set tsTextIn = fso.OpenTextFile("C:\Users\Owner\OneDrive - SOLLUS\Personal\Documents\GitHub\Dabbs_Main\HTML\MarketingEmail_Template.html")
strTextIn = tsTextIn.ReadAll
 
    With outlook_app.CreateItem(0)
        .Subject = "Small Business Introduction: SOLLUS - Provider of BI Solutions"
        .ReadReceiptRequested = True
        .OriginatorDeliveryReportRequested = True
        .FlagRequest = "Flagged"
        .FlagDueBy = Now + 7
        .BodyFormat = olFormatHTML
        .HTMLBody = strTextIn
        .Display
        '.Save
    End With
MsgBox "Be sure to Add Follow-Up"
Set outlook_app = Nothing


End Sub

Sub NewTask() '!!!!!DO NOT DELETE - Created 8/10/24 to replace original!!!!!!
Dim objApp
Dim objInsp
Dim Task As Outlook.TaskItem
On Error Resume Next

Set objApp = GetObject("", "Outlook.Application")
Set objInsp = objApp.ActiveInspector.CurrentItem

'Dim MyItem As Outlook.TaskItem
Set outlook_app = CreateObject("Outlook.Application")

    With outlook_app.CreateItemFromTemplate("C:\Users\Owner\AppData\Roaming\Microsoft\Templates\TaskMod.oft")
        .Importance = 1
        '.Subject = "New SubTask"
        .StartDate = Now
        .DueDate = Now + 7
        '.ReminderTime = Now
        .Subject = "Enter Task Description."
        .Body = "Enter Task Details here. Be sure to enter Project and Project Category."
        '.objInsp.UserProperties("Project Category").Value = ProjectCat
        .Display
        '.Save
    End With


End Sub