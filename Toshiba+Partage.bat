@echo off
REM ====================================================
REM Script de création utilisateur + dossier + partage
REM ====================================================

REM --- Variables ---
set "UserName=Toshiba"
set "Password=T0sh!b@"
set "FolderPath=C:\Scan"
set "ShareName=Scan"
set "CommentPartage=Scan copieur TOSHIBA"
set "NbrMaxUtilisateurs=10"

echo ============================
echo  Création de l'utilisateur
echo ============================

REM Création de l'utilisateur local Toshiba
net user %UserName% %Password% /add /comment:"%UserName%" /fullname:"%UserName%" /logonpasswordchg:no

REM Le mot de passe ne doit pas expirer
wmic useraccount where name='%UserName%' set PasswordExpires=FALSE

REM Ajout au groupe Administrateurs locaux
net localgroup Administrateurs %UserName% /add

echo ============================
echo  Création du dossier partagé
echo ============================

REM Création du dossier s'il n'existe pas
if not exist "%FolderPath%" (
    mkdir "%FolderPath%"
    echo Dossier %FolderPath% créé.
) else (
    echo Dossier %FolderPath% déjà existant.
)

REM Paramètres du partage SMB
net share %ShareName%="%FolderPath%" /remark:"%CommentPartage%" /users:%NbrMaxUtilisateurs% /grant:%UserName%,FULL /grant:"Tout le monde",FULL

echo ============================
echo  Attribution des droits NTFS
echo ============================

REM Donne le contrôle total à Toshiba et Tout le monde
icacls "%FolderPath%" /grant "%UserName%":(OI)(CI)F /grant "Tout le monde":(OI)(CI)F /C /Q

echo.
echo ✅ Configuration terminée avec succès !
echo Utilisateur : %UserName%
echo Dossier partagé : %FolderPath%
echo Partage : \\%COMPUTERNAME%\%ShareName%
echo.

pause
