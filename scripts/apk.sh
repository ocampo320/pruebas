#!/bin/sh
cat <<EOF
APK Builder

Select Option:

    1. Dev
    2. Profile
    3. Release
EOF

read option

if [ $option = 1 ]; then
  clear
  echo "Building Dev APK..."
  flutter clean
  flutter build apk --debug -t lib/main_dev.dart
elif [ $option = 2 ]; then
  clear
  echo "Building Profile APK..."
  flutter clean
  flutter build apk --profile -t lib/main_profile.dart
  cp build/app/outputs/apk/profile/app-profile.apk app-profile.apk
elif [ $option = 3 ]; then
  clear
  echo "Building Release APK..."
  flutter clean
  flutter build apk --split-per-abi
else
  echo 'Invalid option'
fi
