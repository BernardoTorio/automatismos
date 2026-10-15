@echo off
chcp 65001 >nul
title Subir la web de Automatismos a GitHub
setlocal
cd /d "%~dp0"

set "REPO=BernardoTorio/automatismos"
set "WEB=https://bernardotorio.github.io/automatismos/"

echo ============================================
echo   Subir la web de Automatismos a GitHub
echo   Carpeta: %CD%
echo ============================================
echo.

rem --- 0. Si la carpeta no es todavia un repositorio, se conecta con el que ya existe en GitHub ---
if not exist ".git" (
  echo La carpeta no era un repositorio: la conecto con %REPO%...
  git init -b main >nul
  git remote add origin https://github.com/%REPO%.git
)

rem --- 1. Primero se BAJA todo lo que hay en la web (lo que falte en esta carpeta aparece aqui) ---
echo Bajando de GitHub lo que haya en la web...
git fetch origin main
if errorlevel 1 (
  echo ERROR al conectar con GitHub. Comprueba la conexion o "gh auth status".
  goto fin
)
git rev-parse --verify -q HEAD >nul 2>&1
if errorlevel 1 (
  rem repositorio recien creado: se pone en el estado de la web sin tocar los archivos locales
  git reset --mixed origin/main >nul
  git checkout -- . 2>nul
) else (
  git pull --rebase --autostash origin main
)
echo.

rem --- 2. Busca el automatismos*.zip mas reciente en Descargas o en esta carpeta y lo descomprime encima ---
set "ZIP="
for /f "delims=" %%f in ('dir /b /o-d "%USERPROFILE%\Downloads\automatismos*.zip" 2^>nul ^| findstr /v /i "_subido_ viejo_"') do if not defined ZIP set "ZIP=%USERPROFILE%\Downloads\%%f"
if not defined ZIP for /f "delims=" %%f in ('dir /b /o-d "automatismos*.zip" 2^>nul ^| findstr /v /i "_subido_ viejo_"') do if not defined ZIP set "ZIP=%CD%\%%f"
if not defined ZIP (
  echo No hay ningun automatismos*.zip nuevo: se sube lo que haya en la carpeta.
  goto subir
)
echo Encontrado: %ZIP%
echo Contenido:
tar -tf "%ZIP%"
echo.
echo Descomprimiendo encima de la carpeta (sobrescribe los archivos con el mismo nombre)...
tar -xf "%ZIP%" -C "%CD%"
if errorlevel 1 (
  echo ERROR al descomprimir el zip.
  goto fin
)
for /f %%d in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd_HHmmss"') do set "STAMP=%%d"
move /y "%ZIP%" "%USERPROFILE%\Downloads\automatismos_subido_%STAMP%.zip" >nul
echo Zip descomprimido. Queda guardado en Descargas como automatismos_subido_%STAMP%.zip
rem Las copias viejas que queden en Descargas se marcan para que no molesten
for /f "delims=" %%f in ('dir /b "%USERPROFILE%\Downloads\automatismos*.zip" 2^>nul ^| findstr /v /i "_subido_ viejo_"') do ren "%USERPROFILE%\Downloads\%%f" "viejo_%%f"
echo.

:subir
rem --- 3. Nunca se suben zips ni Word: si alguno se colo en el repositorio, se saca ---
if not exist ".gitignore" (
  echo *.zip>.gitignore
  echo *.docx>>.gitignore
  echo viejo_*>>.gitignore
)
if not exist ".nojekyll" type nul > .nojekyll
git rm -r --cached --quiet --ignore-unmatch *.zip *.docx >nul 2>&1

rem --- 4. Anadir todo, commit y push ---
git add -A
git diff --cached --quiet
if not errorlevel 1 (
  echo No hay cambios que subir: todo esta ya en GitHub.
  goto listo
)
echo Archivos que cambian:
git diff --cached --name-status
echo.
for /f "delims=" %%d in ('powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd HH:mm'"') do set "FECHA=%%d"
git commit -q -m "Actualizacion de la web %FECHA%"
git push -u origin main
if errorlevel 1 (
  echo.
  echo ERROR al hacer push. Revisa la conexion o "gh auth status".
  goto fin
)

:listo
echo.
echo ============================================
echo   Hecho. En 1 o 2 minutos estara en:
echo   %WEB%
echo   (si ves la version vieja, recarga con Ctrl+F5)
echo ============================================
start "" "%WEB%"

:fin
echo.
pause
