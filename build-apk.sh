#!/bin/bash

echo "🚀 Starting KidsafeConnect APK Build..."
echo "======================================"

# تحقق من وجود مجلد android
if [ ! -d "android" ]; then
    echo "❌ Error: Android folder not found!"
    echo "Run 'npx cap add android' first"
    exit 1
fi

# انتقل إلى مجلد android
cd android

# امنح صلاحيات التنفيذ
echo "📝 Setting permissions..."
chmod +x gradlew

# نظف المشروع
echo "🧹 Cleaning project..."
./gradlew clean

# ابني APK Debug
echo "🔨 Building Debug APK..."
./gradlew assembleDebug

# تحقق من نجاح البناء
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ APK Built Successfully!"
    echo "📍 Location: android/app/build/outputs/apk/debug/app-debug.apk"
    echo ""
    echo "🎉 Ready to install on your device!"
    
    # انسخ APK إلى المجلد الرئيسي
    cp app/build/outputs/apk/debug/app-debug.apk ../KidsafeConnect.apk
    echo "📋 APK copied to: KidsafeConnect.apk"
else
    echo ""
    echo "❌ Build failed! Check the error messages above."
    exit 1
fi