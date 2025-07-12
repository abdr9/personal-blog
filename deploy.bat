@echo off
echo ================================
echo    Blog Deployment Script
echo ================================
echo.

:: Check if we're in the right directory
if not exist "index.html" (
    echo ERROR: index.html not found!
    echo Please run this script from the blog directory.
    pause
    exit /b 1
)

:: Get GitHub username
set /p username="Enter your GitHub username: "
if "%username%"=="" (
    echo ERROR: Username cannot be empty!
    pause
    exit /b 1
)

echo.
echo Setting up Git repository...

:: Remove existing origin if it exists
git remote remove origin 2>nul

:: Add new origin
git remote add origin https://github.com/%username%/personal-blog.git

:: Rename branch to main
git branch -M main

echo.
echo Pushing to GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ================================
    echo    SUCCESS!
    echo ================================
    echo.
    echo Your blog has been uploaded to GitHub!
    echo.
    echo Next steps:
    echo 1. Go to: https://github.com/%username%/personal-blog
    echo 2. Click Settings ^> Pages
    echo 3. Enable GitHub Pages from 'main' branch
    echo 4. Your site will be live at: https://%username%.github.io/personal-blog/
    echo.
    echo For a free domain, follow the guide in DEPLOYMENT_GUIDE.md
    echo.
) else (
    echo.
    echo ================================
    echo    ERROR!
    echo ================================
    echo.
    echo Something went wrong. Please:
    echo 1. Make sure you created the repository on GitHub
    echo 2. Check your internet connection
    echo 3. Verify the repository name is 'personal-blog'
    echo.
)

echo Press any key to exit...
pause >nul

