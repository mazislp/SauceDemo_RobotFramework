# SawitPro

Automated testing project for the Android mobile app (Sauce Labs Demo) using **Robot Framework** and **Appium**.

## Overview

- **Framework:** Robot Framework  
- **Library:** AppiumLibrary (Appium 2)  
- **Platform:** Android (UiAutomator2)  
- **Application under test:** Sauce Demo (`saucedemo.apk`)

Each test runs with **full reset** (`fullReset=True`), so every test gets a clean app install.

---

## Prerequisites

- **Python** 3.8+
- **Node.js** (to run Appium 2)
- **Android SDK** and **adb** in your PATH
- **Android emulator** or a connected physical device

---

## Setup

### 1. Clone and enter the project folder

```bash
cd SawitPro
```

### 2. Create a virtual environment and install Python dependencies

```bash
python -m venv venv
source venv/bin/activate   # Windows: venv\Scripts\activate
pip install -r requirements.txt
```

### 3. Install Appium 2

```bash
npm install -g appium
appium driver install uiautomator2
```

### 4. Start the Appium server

In a separate terminal:

```bash
appium
```

The server runs at `http://127.0.0.1:4723` by default.

### 5. Ensure device/emulator is connected

```bash
adb devices
```

Make sure at least one device is listed before running tests.

---

## Running Tests

Run from the **project root** (SawitPro folder):

```bash
# Activate venv if needed
source venv/bin/activate

# Run all tests in the login_logout suite
robot tests/login_logout.robot

# Run a specific test
robot -t "Login Positive Test" tests/login_logout.robot
robot -t "Login Negative Test" tests/login_logout.robot
```

After execution, reports are generated at:
- **report.html** — results report
- **log.html** — execution log
- **output.xml** — XML output

---

## Project Structure

```
SauceDemo_RobotFramework/
├── app/
│   └── saucedemo.apk      # App APK (you must add this file)
├── resources/
│   └── keywords.robot     # Keywords for opening app, login, verification, etc.
├── tests/
│   └── login_logout.robot # Login positive & negative test cases
├── variables/
│   └── variables.robot    # Appium URL, capabilities, credentials
├── requirements.txt
└── README.md
```

---

## Test Cases

| Test                  | Description                                                                 |
|-----------------------|-----------------------------------------------------------------------------|
| **Login Positive Test** | Log in with `standard_user` / `secret_sauce`; verify PRODUCTS page is shown. |
| **Login Negative Test** | Log in with invalid credentials; verify error message is shown.            |

---

## Configuration

Key variables in `variables/variables.robot`:

| Variable          | Default                     | Description                    |
|-------------------|-----------------------------|--------------------------------|
| `${REMOTE_URL}`   | http://127.0.0.1:4723       | Appium server URL (Appium 2)   |
| `${APP_PATH}`     | ${EXECDIR}/app/saucedemo.apk| Path to the APK                |
| `${DEVICE_NAME}`  | Android Emulator            | Device name from `adb devices` |
| `${APP_PACKAGE}`  | com.swaglabsmobileapp       | App package name               |
| `${APP_ACTIVITY}` | com.swaglabsmobileapp.MainActivity | Main activity          |

Test credentials are in `${VALID_USERNAME}`, `${VALID_PASSWORD}`, `${INVALID_USERNAME}`, and `${INVALID_PASSWORD}`.

---

## Troubleshooting

- **Session could not be created / resource could not be found**  
  Use Appium 2 (URL without `/wd/hub`) and set `automationName=UiAutomator2`.

- **'noReset' / 'fullReset' must be of type boolean**  
  Use Robot’s boolean variables `${True}` and `${False}` in keywords, not plain strings.

- **No application is open**  
  Ensure the Appium server is running and a device/emulator is connected (`adb devices`).

- **APK not found**  
  Run tests from the project root and ensure `app/saucedemo.apk` exists, or update `${APP_PATH}`.
