@echo off
echo Initializing Git repository...
git init
if errorlevel 1 goto error

echo Adding files...
git add .
if errorlevel 1 goto error

echo Committing changes...
git commit -m "Initial commit: WensClean website" -m "Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>"
if errorlevel 1 (
    echo Checking if already committed...
    git status
)

echo Setting branch to main...
git branch -M main
if errorlevel 1 goto error

echo Adding remote origin...
git remote add origin https://github.com/Icemclovin/WensClean.git
if errorlevel 1 (
    echo Remote might already exist, trying to set URL...
    git remote set-url origin https://github.com/Icemclovin/WensClean.git
)

echo Pushing to GitHub...
git push -u origin main
if errorlevel 1 goto error

echo.
echo SUCCESS! Code pushed to GitHub.
echo You can now deploy on Cloudflare Pages.
pause
exit /b 0

:error
echo.
echo ERROR! Something went wrong.
echo Make sure Git is installed and you have access to GitHub.
pause
exit /b 1
