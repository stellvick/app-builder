#!/bin/bash
set -e

cd /workspace

if [ ! -f "package.json" ]; then
  echo "❌ No Expo project found in /workspace. Clone one first!"
  echo "Example: git clone https://github.com/your-org/your-expo-app.git"
  exit 1
fi

echo "📦 Installing dependencies..."
npm install

echo "🚀 Building APK with EAS..."
eas build --platform android --local --output /workspace/app-release.apk

mkdir -p /output

cp /workspace/app-release.apk /output/

echo "✅ Build complete!"
echo "📂 Your file is available at: /output/app-release.apk"
echo "🌐 If the Caddy service is running, you can download it from:"
echo "👉 https://unix.stellvick.fun/app-release.apk"
