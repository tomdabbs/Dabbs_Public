

Sub NewTask() 
'Used to create new Outlook task with custom fields for Project and Project Category.
Dim objApp
Dim objInsp
Dim Task As Outlook.TaskItem
On Error Resume Next

Set objApp = GetObject("", "Outlook.Application")
Set objInsp = objApp.ActiveInspector.CurrentItem

Set outlook_app = CreateObject("Outlook.Application")

    With outlook_app.CreateItemFromTemplate("C:\Users\Owner\AppData\Roaming\Microsoft\Templates\TaskMod.oft")
        .Importance = 1
        .StartDate = Now
        .DueDate = Now + 7
        .Subject = "Enter Task Description."
        .Body = "Enter Task Details here. Be sure to enter Project and Project Category."
        .Display
    End With


End Sub