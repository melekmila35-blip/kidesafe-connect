@echo off
title KidsafeConnect APK Builder
color 0A

echo.
echo  =============================================
echo  🚀 Starting KidsafeConnect APK Build...
echo  =============================================
echo.

REM تحقق من وجود مجلد android
if not exist "android" (
    echo ❌ Error: Android folder not found!
    echo Run 'npx cap add android' first
    pause
    exit /b 1
)

REM انتقل إلى مجلد android
cd android

REM نظف المشروع
echo 🧹 Cleaning project...
call gradlew clean

REM ابني APK Debug
echo 🔨 Building Debug APK...
call gradlew assembleDebug

REM تحقق من نجاح البناء
if %errorlevel% == 0 (
    echo.
    echo ✅ APK Built Successfully!
    echo 📍 Location: android\app\build\outputs\apk\debug\app-debug.apk
    echo.
    echo 🎉 Ready to install on your device!
    
    REM انسخ APK إلى المجلد الرئيسي
    copy "app\build\outputs\apk\debug\app-debug.apk" "..\KidsafeConnect.apk" >nul
    echo 📋 APK copied to: KidsafeConnect.apk
    echo.
    echo Press any key to exit...
    pause >nul
) else (
    echo.
    echo ❌ Build failed! Check the error messages above.
    echo.
    pause
    exit /b 1
)