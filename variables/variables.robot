*** Variables ***
# Appium 2 uses root URL (no /wd/hub). Use http://127.0.0.1:4723 for Appium 2.
${REMOTE_URL}      http://127.0.0.1:4723
${PLATFORM_NAME}   Android
${AUTOMATION_NAME}    UiAutomator2
${DEVICE_NAME}     Android Emulator
# Path ke APK (jalan dari root proyek). Letakkan saucedemo.apk di folder app/
${APP_PATH}        ${EXECDIR}/app/saucedemo.apk
${APP_PACKAGE}     com.swaglabsmobileapp
${APP_ACTIVITY}    com.swaglabsmobileapp.MainActivity

${VALID_USERNAME}      standard_user
${VALID_PASSWORD}      secret_sauce

${INVALID_USERNAME}    invalid_user
${INVALID_PASSWORD}    wrong_password