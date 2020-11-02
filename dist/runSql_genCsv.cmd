@echo off

rem 找不到sqlcmd時需要改path
rem set path=./sqlexe;%path%

rem 拿時間給檔名用
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
	echo 執行_%%i
	sqlcmd -S%dbIp% -U%dbUsrAcc% -P%dbUsrPwd% -s"," -i"%sqlCmdFilePath%/%%i" -o %resFilePath%/%%~ni_%myDate%.csv
)


pause