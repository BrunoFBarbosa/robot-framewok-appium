# Mobile Testing With Robot Framework + Appium

Mobile Testing framework for markX, a task management example app provided by [QAx](https://github.com/qaxperience)

## Requirements

To run this project, you will need:

- [Git](https://git-scm.com/downloads)
- [Python](https://www.python.org/downloads/) (I've used version `3.10.6` while making this project)
- [Docker](https://www.docker.com/get-started/)
- [NodeJS](https://nodejs.org/en/) (I've used version `v18.20.5` while making this project)
- NPM
- [Android Studio](https://developer.android.com/studio)
- [Appium](http://appium.io) (I've used version `2.14.0` while making this project)
- [UIAutomator Driver](https://github.com/appium/appium-uiautomator2-driver) (I've used version `3.9.7` while making this project)

## Installation

Before anything else, make sure you have installed [Java JDK](http://appium.io/docs/en/latest/quickstart/uiauto2-driver/#java-jdk) and [Android SDK](http://appium.io/docs/en/latest/quickstart/uiauto2-driver/#android-sdk) on your system. It is also important to set the environments variables `ANDROID_HOME` and `JAVA_HOME` correctly

### 1. Clone this repository

```
git clone https://github.com/BrunoFBarbosa/robot-framewok-appium.git
```

### 2. Install App's API Dependencies

To install the dependencies, run `npm install` in the API project's folder.

```
cd /apps/api
npm install
```

### 3. Install Test Framework's Node Dependencies

To install the dependencies, run `npm install` in the project's root folder.

```
~/robot-framework-appium
npm install
```

### 4. Install Test Framework Python Dependencies

To install the test framework dependencies, open a new terminal instance and run `pip install -r requirements.txt` in the project's root folder.

```
~/robot-framework-appium
pip install -r requirements.txt
```

### 5. Verifying The Installation

In order to verify everything is set correctly, run the following command in project's root folder

```
~/robot-framework-appium
npx appium driver doctor uiautomator2
```

Verify the green checkmarks on the `ANDROID_HOME`, `adb`, `JAVA_HOME` and `bin/java`

![image info](./images/verify_install.png)

Otherwise, the tool will tell you what needs to be fixed in the output

### 3. Create A MongoDB Instance

The application uses a simple MongoDB database to store the data. To instantiated it, make sure you have Docker installed and run the following command in the repository root folder:

```
~/robot-framework-appium
docker-compose up --build -d mongodb
```

### 4. Update Environments Variables

#### 4.1 Update the ENV in the API folder
Rename the `.env.example` file under `/apps/api` to `.env` and update it with the following Mongo URI:

```
MONGO_URI="mongodb://test:test@localhost:27017/testdb"
```
#### 4.2 Update the ENV in the projects root folder

Do the same for the `.env.example` file in repository root folder

```
MONGO_URI="mongodb://test:test@localhost:27017/testdb"
```

### 4. Start The API Server

```
cd /apps/api
npm run dev
```
The output should be something similiar to this:

```
[nodemon] watching extensions: js,mjs,json
[nodemon] starting `npx babel-node build/app.js`
Api do markX online em: http://192.168.101.136:3333 🤘
```
In this case, we will access the API via 192.168.101.136 IP address

## Running The Tests

Before running the tests you need to start an instance of Android Studio and create a new virtual device to grab its UDID.

With the virtual device started you can use the `adb` command to get its UDID:

In a new terminal type the following command:

```
adb devices
```

The output should be similiar to this:

```
List of devices attached
emulator-5554   device
```
In this case the emulator's UDID is `emulator-5554`

After that, go to the repository root folder and start the Appium server by running the following command

```
~/robot-framework-appium 
npx appium
```

To run a test you will need the API_IP mentioned earlier and the EMULATOR_UDID, for example:

```
robot -v API_IP:192.168.101.136 -v EMULATOR_UDID:emulator-5554 -d ./logs tests/tasks.robot
```
![image info](./images/success.png)
