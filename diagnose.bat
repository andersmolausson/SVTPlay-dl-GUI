@echo off
echo ==========================================
echo SVTPlay-dl Web GUI - Diagnostik
echo ==========================================
echo.

REM Kontrollera aktuell branch
echo 1. Kontrollerar din branch...
git branch --show-current
echo.

REM Kontrollera senaste commit
echo 2. Senaste commit pa din lokala maskin:
git log --oneline -1
echo.

REM Kontrollera om det finns nya commits på remote
echo 3. Hamtar information fran remote...
git fetch origin
echo.

echo 4. Nya commits pa remote som du inte har lokalt:
for /f "tokens=*" %%i in ('git branch --show-current') do set BRANCH=%%i
git log HEAD..origin/%BRANCH% --oneline
echo.

REM Kontrollera om cookie-sektionen finns i HTML
echo 5. Kontrollerar om cookie-autentisering finns i templates/index.html...
findstr /C:"cookieCard" templates\index.html >nul
if %errorlevel%==0 (
    echo [92m✓ Cookie-autentisering FINNS i din lokala kod[0m
) else (
    echo [91m✗ Cookie-autentisering SAKNAS i din lokala kod[0m
    echo    Du behover kora: git pull origin %BRANCH%
)
echo.

echo ==========================================
echo Rekommenderad atgard:
echo ==========================================
echo 1. Stoppa servern (Ctrl+C i serverfonstret)
echo 2. Kor: git pull origin %BRANCH%
echo 3. Kor: start.bat
echo 4. Oppna webblasaren och tryck Ctrl+F5
echo.
pause
