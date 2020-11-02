@echo off

rem �䤣��sqlcmd�ɻݭn��path
rem set path=./sqlexe;%path%

rem ���ɶ����ɦW��
FOR /F "tokens=1-4 delims=/ " %%a IN ("%date%") DO (
	SET myDate=%%a%%b%%c
)

set dbIp="127.0.0.1"
set dbUsrAcc="root"
set dbUsrPwd="root"
set sqlCmdFilePath=./sqlCmd
set resFilePath=./csvResult

:SET mypath=%~dp0
for %%i in (%sqlCmdFilePath%/*.sql) do (
	echo ����_%%i
	sqlcmd -S%dbIp% -U%dbUsrAcc% -P%dbUsrPwd% -s"," -i"%sqlCmdFilePath%/%%i" -o %resFilePath%/%%~ni_%myDate%.csv
)


pause