@ECHO OFF
title folderSecurity

:: begin config prompt
color 8E
mode 57, 20
:: end config

if EXIST "unlock" goto CONFIRM
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B80349D}" goto UNLOCK
if NOT EXIST "lock" goto MDLOCKER

:CONFIRM
echo(
echo(
cls
echo þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
echo(
echo          Author: Felipe Erick A. B. Da Silva
echo(
echo         Github: https://github.com/Felipeerick.
echo(
echo þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ
echo      Tem certeza que deseja bloquear a pasta? (S/N)
set /p "cho=>"

if /i "%cho%"=="S" goto LOCK
if /i "%cho%"=="N" goto END

echo Escolha inválida.
goto CONFIRM

:LOCK
if exist "unlock" ( ren "unlock" "lock")

ren "lock" "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B80349D}"
attrib +h "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B80349D}"
set var="Control Panel.{21EC2020-3AEA-1069-A2DD-08002B80349D}"
icacls %var% /deny *S-1-1-0:(OI)(CI)F >nul
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B80349D}" "lock"

cls
echo "Pasta bloqueada e ocultada."
pause
goto End

:UNLOCK
if not exist "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B80349D}" goto LOCK

echo Digite a senha da pasta para desbloquear:
set /p "pass=>"
if NOT "%pass%"=="Fb2610@@!!" goto FAIL

attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B80349D}"
set var="Control Panel.{21EC2020-3AEA-1069-A2DD-08002B80349D}"
icacls %var% /grant *S-1-1-0:(OI)(CI)F >nul
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B80349D}" "unlock"
cls
echo Pasta desbloqueada e revelada com sucesso.
pause
goto End

:FAIL
echo Senha invalida.
pause>nul

goto END

:MDLOCKER
if not exist "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B80349D}" (
    md "lock"
    cls
    echo Pasta criada com sucesso.
    pause>nul
)
goto End

:End