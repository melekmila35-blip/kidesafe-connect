# تعليمات بناء APK في Android Studio

## الطريقة الأولى: استخدام Terminal في Android Studio

### 1. افتح Terminal في Android Studio

### 2. انسخ والصق هذه الأوامر واحداً تلو الآخر:

```bash
# انتقل إلى مجلد Android
cd android

# امنح صلاحيات التنفيذ
chmod +x gradlew

# نظف المشروع
./gradlew clean

# ابني APK Debug
./gradlew assembleDebug

# أو ابني APK Release
./gradlew assembleRelease
```

### 3. ستجد ملف APK في:
```
android/app/build/outputs/apk/debug/app-debug.apk
android/app/build/outputs/apk/release/app-release.apk
```

---

## الطريقة الثانية: استخدام واجهة Android Studio

### 1. في قائمة Build
- اختر Build > Build Bundle(s) / APK(s)
- اختر Build APK(s)

### 2. انتظر انتهاء البناء
- ستظهر رسالة "APK(s) generated successfully"
- اضغط على "locate" لفتح المجلد

---

## الطريقة الثالثة: سكريبت تلقائي

### 1. انسخ الكود التالي في ملف جديد باسم `build.bat` (Windows):

```batch
@echo off
echo Building KidsafeConnect APK...

cd android
call gradlew clean
call gradlew assembleDebug

echo.
echo APK built successfully!
echo Location: android\app\build\outputs\apk\debug\
pause
```

### 2. أو ملف `build.sh` (Mac/Linux):

```bash
#!/bin/bash
echo "Building KidsafeConnect APK..."

cd android
./gradlew clean
./gradlew assembleDebug

echo ""
echo "APK built successfully!"
echo "Location: android/app/build/outputs/apk/debug/"
```

### 3. شغل الملف بالضغط المزدوج عليه

---

## مشاكل شائعة وحلولها

### خطأ: Permission denied
```bash
chmod +x android/gradlew
```

### خطأ: JAVA_HOME not set
```bash
export JAVA_HOME="/path/to/java"
```

### خطأ: SDK not found
- افتح Android Studio
- اذهب إلى File > Settings > Android SDK
- تأكد من تثبيت Android SDK

---

## للحصول على APK موقع (للنشر)

### 1. أنشئ keystore جديد:
```bash
keytool -genkey -v -keystore kidsafe.keystore -alias kidsafe -keyalg RSA -keysize 2048 -validity 10000
```

### 2. أضف في `android/app/build.gradle`:
```gradle
android {
    signingConfigs {
        release {
            storeFile file('../../kidsafe.keystore')
            storePassword 'your-password'
            keyAlias 'kidsafe'
            keyPassword 'your-password'
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

### 3. ابني APK Release:
```bash
./gradlew assembleRelease
```