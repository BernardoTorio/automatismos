@echo off
chcp 65001 >nul
title Subir animaciones de Automatismos a GitHub
setlocal
cd /d "%~dp0"

set "REPO=BernardoTorio/automatismos"
set "WEB=https://bernardotorio.github.io/automatismos/"

echo ============================================
echo   Subir animaciones de Automatismos a GitHub
echo   Carpeta: %CD%
echo ============================================
echo.

rem --- 1. Busca el automatismos*.zip mas reciente en Descargas (tambien "automatismos (1).zip") ---
set "ZIP="
for /f "delims=" %%f in ('dir /b /o-d "%USERPROFILE%\Downloads\automatismos*.zip" 2^>nul ^| findstr /v /i "_subido_"') do if not defined ZIP set "ZIP=%USERPROFILE%\Downloads\%%f"
if not defined ZIP goto sinzip
echo Encontrado en Descargas: %ZIP%
echo Descomprimiendo...
tar -xf "%ZIP%" -C "%CD%"
if errorlevel 1 (
  echo ERROR al descomprimir el zip.
  goto fin
)
for /f %%d in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd_HHmmss"') do set "STAMP=%%d"
ren "%ZIP%" "automatismos_subido_%STAMP%.zip"
echo Zip descomprimido. En Descargas queda como automatismos_subido_%STAMP%.zip
rem Si quedan mas zips sin subir (copias antiguas), se marcan para que no molesten
for /f "delims=" %%f in ('dir /b "%USERPROFILE%\Downloads\automatismos*.zip" 2^>nul ^| findstr /v /i "_subido_"') do ren "%USERPROFILE%\Downloads\%%f" "viejo_%%f"
echo.
:sinzip

rem --- 2. Por si la carpeta aun no fuera un repositorio ---
if not exist ".git" (
  echo Primera vez: creando el repositorio %REPO%...
  git init -b main
  if not exist ".nojekyll" type nul > .nojekyll
  git add -A
  git commit -m "Primera subida de las animaciones de Automatismos"
  gh repo create %REPO% --public --source=. --remote=origin --push --description "Animaciones de Automatismos Industriales - I.E.S. Trinidad Arroyo"
  if errorlevel 1 (
    echo ERROR al crear el repositorio. Comprueba "gh auth status".
    goto fin
  )
  gh api -X POST repos/%REPO%/pages -f "source[branch]=main" -f "source[path]=/" >nul 2>&1
  echo Repositorio creado y GitHub Pages activado.
  goto listo
)

rem --- 3. Subida normal: traer cambios, anadir, commit y push ---
git pull --rebase --autostash >nul 2>&1
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
git commit -m "Actualizacion de animaciones %FECHA%"
git push
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
