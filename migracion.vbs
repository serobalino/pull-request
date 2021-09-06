Dim Arg, texto, fso, MyFile, dtsnow, archivo, objShell, objWshScriptExec, ping
Set Arg = WScript.Arguments
Set objShell = CreateObject("WScript.Shell")
texto = "S/N"

If (Arg.Count=1) Then
    texto = Arg(0)
End If

dtsnow = Now()

'Individual date components
dd = Right("00" & Day(dtsnow), 2)
mm = Right("00" & Month(dtsnow), 2)
yy = Year(dtsnow)
hh = Right("00" & Hour(dtsnow), 2)
nn = Right("00" & Minute(dtsnow), 2)
ss = Right("00" & Second(dtsnow), 2)

Set fso = CreateObject("Scripting.FileSystemObject")
Set MyFile = fso.CreateTextFile("migraciones\"&yy&mm&dd&"_"&hh&nn&ss&" "&texto&".txt", True)
MyFile.WriteLine dtsnow

Set ping = objShell.Exec("git config user.name")
Do While ping.Status = 0
  WScript.Sleep 100
Loop
MyFile.WriteLine ping.StdOut.ReadAll

MyFile.WriteLine "####################################"

Set ping = objShell.Exec("ping google.com")
Do While ping.Status = 0
  WScript.Sleep 100
Loop
MyFile.WriteLine ping.StdOut.ReadAll

MyFile.Close

