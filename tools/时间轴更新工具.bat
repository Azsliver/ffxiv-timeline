@echo off & title ʱ������� By CanisMinor

echo ==========================================================================
echo                   ʱ�����Զ����³���
echo By CanisMinor  ID: �к�ֽե֭��(��ˮ)  ����Ⱥ: 246243038
echo ==========================================================================

echo [*]ֻ��WIN10���Թ��˸��³���
echo [*]���Թ���Ա�������
echo [*]��ѱ��������ʱ����Ŀ¼��
pause
echo [1]��������ʱ����ZIP

set Url=https://github.com/canisminor1990/ffxiv-timeline/archive/master.zip
for %%a in ("%Url%") do set "FileName=%%~nxa"

(echo Download Wscript.Arguments^(0^),Wscript.Arguments^(1^)
echo Sub Download^(url,target^)
echo   Const adTypeBinary = 1
echo   Const adSaveCreateOverWrite = 2
echo   Dim http,ado
echo   Set http = CreateObject^("Msxml2.ServerXMLHTTP"^)
echo   http.open "GET",url,False
echo   http.send
echo   Set ado = createobject^("Adodb.Stream"^)
echo   ado.Type = adTypeBinary
echo   ado.Open
echo   ado.Write http.responseBody
echo   ado.SaveToFile target
echo   ado.Close
echo End Sub)>DownloadFile.vbs
 
DownloadFile.vbs "%Url%" "%cd%\%FileName%"
del DownloadFile.vbs

echo [2]���ڽ�ѹʱ����ZIP

(echo UnZip Wscript.Arguments^(0^),Wscript.Arguments^(1^)
echo Sub UnZip^(ByVal myZipFile, ByVal myTargetDir^)
echo     Set fso = CreateObject^("Scripting.FileSystemObject"^)
echo     If NOT fso.FileExists^(myZipFile^) Then
echo         Exit Sub
echo     ElseIf fso.GetExtensionName^(myZipFile^) ^<^> "zip" Then
echo         Exit Sub
echo     ElseIf NOT fso.FolderExists^(myTargetDir^) Then
echo         fso.CreateFolder^(myTargetDir^)
echo     End If
echo     Set objShell = CreateObject^("Shell.Application"^)
echo     Set objSource = objShell.NameSpace^(myZipFile^)
echo     Set objFolderItem = objSource.Items^(^)
echo     Set objTarget = objShell.NameSpace^(myTargetDir^)
echo     intOptions = 256
echo     objTarget.CopyHere objFolderItem, intOptions
echo End Sub)>UnZip.vbs

UnZip.vbs "%cd%\master.zip" "%cd%"
del UnZip.vbs 
del master.zip

echo [3]���ڸ���ʱ����

copy %cd%\ffxiv-timeline-master\*.xml %cd%
rd /s /q ffxiv-timeline-master

echo [4]�������,��ˢ���ļ���
pause
