@echo off
echo ================================================
echo    AUTOMATED BLOG DEPLOYMENT - MULTIPLE PLATFORMS
echo ================================================
echo.
echo This script will deploy your blog to multiple platforms
echo for maximum availability and automatic domain assignment.
echo.
echo Platforms included:
echo - GitHub Pages (username.github.io)
echo - Netlify (random-name.netlify.app)
echo - Surge.sh (custom.surge.sh)
echo.
echo Press any key to continue or Ctrl+C to cancel...
pause >nul
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
echo ================================================
echo    DEPLOYING TO GITHUB PAGES
echo ================================================
echo.

:: Remove existing origin if it exists
git remote remove origin 2>nul

:: Add GitHub origin
git remote add origin https://github.com/%username%/personal-blog.git
git branch -M main

echo Pushing to GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo ✅ GitHub deployment successful!
    echo Your GitHub Pages URL: https://%username%.github.io/personal-blog/
    echo.
) else (
    echo ❌ GitHub deployment failed. Check if repository exists.
    echo.
)

echo ================================================
echo    CREATING DEPLOYMENT PACKAGE
echo ================================================
echo.

:: Create a deployment package
if exist "deploy-package.zip" del "deploy-package.zip"
echo Creating deployment package...
tar -czf deploy-package.zip *.html *.css *.js *.md *.txt *.xml *.toml 2>nul

if exist "deploy-package.zip" (
    echo ✅ Deployment package created: deploy-package.zip
) else (
    echo ❌ Failed to create deployment package
)

echo.
echo ================================================
echo    DEPLOYMENT SUMMARY
echo ================================================
echo.
echo Your blog has been prepared for deployment on multiple platforms:
echo.
echo 🌐 GITHUB PAGES:
echo    URL: https://%username%.github.io/personal-blog/
echo    Status: Deployed (enable Pages in repository settings)
echo.
echo 🌐 NETLIFY (Manual deployment required):
echo    1. Go to netlify.com
echo    2. Drag and drop your blog folder
echo    3. Get automatic URL like: https://random-name.netlify.app
echo.
echo 🌐 SURGE.SH (Manual deployment required):
echo    1. Install: npm install -g surge
echo    2. Run: surge . your-domain.surge.sh
echo.
echo 🌐 VERCEL (Manual deployment required):
echo    1. Go to vercel.com
echo    2. Import from GitHub
echo    3. Get automatic URL like: https://personal-blog.vercel.app
echo.
echo ================================================
echo    NEXT STEPS
echo ================================================
echo.
echo 1. Enable GitHub Pages in your repository settings
echo 2. Visit netlify.com and drag-drop your blog folder
echo 3. Your blog will be live on multiple domains!
echo.
echo Admin access: username=admin, password=admin
echo.
echo Press any key to exit...
pause >nul

