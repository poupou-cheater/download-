@echo off
Title Installation Auto - Logiciels & Ressources

:: Définition du chemin du dossier Téléchargements
set "DOWNLOADS_DIR=%USERPROFILE%\Downloads"

echo =======================================================
echo 1. Installation des Outils de Developpement (ajoute au PATH)
echo =======================================================

echo Installation de Git (ajoute 'git' au PATH)
winget install --id Git.Git --source winget --accept-package-agreements --accept-source-agreements

echo Installation de Node.js (version LTS - ajoute 'node' et 'npm' au PATH)
winget install --id OpenJS.NodeJS.LTS --source winget --accept-package-agreements --accept-source-agreements

echo Installation de Visual Studio Code (ajoute 'code' au PATH)
winget install --id Microsoft.VisualStudioCode --source winget --accept-package-agreements --accept-source-agreements

echo.
echo =======================================================
echo 2. Installation des Logiciels & Jeux via WinGet
echo =======================================================

:: Navigateurs
winget install --id Mozilla.Firefox --source winget --accept-package-agreements --accept-source-agreements
winget install --id Google.Chrome --source winget --accept-package-agreements --accept-source-agreements

:: Utilitaires et Communication
winget install --id Discord.Discord --source winget --accept-package-agreements --accept-source-agreements
winget install --id 1Password.1Password --source winget --accept-package-agreements --accept-source-agreements
winget install --id WhatsApp.WhatsApp --source winget --accept-package-agreements --accept-source-agreements
winget install --id 7zip.7zip --source winget --accept-package-agreements --accept-source-agreements

:: Gaming & Streaming
winget install --id Steam.Steam --source winget --accept-package-agreements --accept-source-agreements
winget install --id RiotGames.RiotClient --source winget --accept-package-agreements --accept-source-agreements
winget install --id OBSStudio.OBSStudio --source winget --accept-package-agreements --accept-source-agreements

:: Logiciels Specifiques (a verifier pour Prism Launcher et Iriun)
winget install --id PrismLauncher.PrismLauncher --source winget --accept-package-agreements --accept-source-agreements
winget install --id Iriun.Iriun --source winget --accept-package-agreements --accept-source-agreements

echo.
echo =======================================================
echo 3. Telechargement des Fichiers Specifiques
echo =======================================================

:: Création d'un sous-dossier dans Téléchargements pour le nettoyage
mkdir "%DOWNLOADS_DIR%\AutoInstall_Files"
set "DEST_DIR=%DOWNLOADS_DIR%\AutoInstall_Files"

:: Telechargement de BorderlessMinecraft.exe (vous devrez l'executer manuellement)
echo Telechargement de BorderlessMinecraft.exe...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/Mr-Technician/BorderlessMinecraft/releases/download/v1.3.4/BorderlessMinecraft.exe' -OutFile '%DEST_DIR%\BorderlessMinecraft.exe'"
echo Le fichier BorderlessMinecraft.exe a ete telecharge dans %DEST_DIR%

:: Telechargement de la police Monocraft.ttc
echo Telechargement de la police Monocraft.ttc...
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/IdreesInc/Monocraft/releases/download/v4.1/Monocraft.ttc' -OutFile '%DEST_DIR%\Monocraft.ttc'"


echo.
echo =======================================================
echo 4. Installation des Ressources et Dependances
echo =======================================================

:: Installation de la police Monocraft
echo Installation de Monocraft.ttc... (Ouvrira une boite de dialogue)
start "" "%DEST_DIR%\Monocraft.ttc"

:: Installation des dependances PIP directement via l'URL
echo Installation des dependances Python (via pip)...
pip install -r https://raw.githubusercontent.com/poupou-cheater/library-python-i-use/refs/heads/main/listpython


echo.
echo =======================================================
echo 5. Installation des Extensions VS Code
echo =======================================================

code --install-extension dsznajder.es7-react-js-snippets
code --install-extension esbenp.prettier-vscode
code --install-extension CecilyJansen.blue-dragon
code --install-extension formulahendry.code-runner
code --install-extension pucelle.vscode-css-navigation
code --install-extension ritwickdey.LiveServer
code --install-extension christian-kohler.path-intellisense
code --install-extension ms-python.python
code --install-extension natqe.reload
code --install-extension austenc.tailwind-docs


echo.
echo =======================================================
echo 6. Nettoyage et Finalisation
echo =======================================================

:: Supprimer le sous-dossier cree dans Telechargements pour les fichiers telecharges
echo Suppression du dossier temporaire de Telechargements...
rmdir /s /q "%DEST_DIR%"

echo Installation et configuration terminees !
echo N'oubliez pas de reouvrir votre terminal pour que le nouveau PATH soit charge.
pause