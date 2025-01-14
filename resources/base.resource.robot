*** Settings ***

Library    AppiumLibrary
Library    libs/mongo.py

Resource    screens/login.resource
Resource    screens/tasks.resource

*** Variables ***

${EMULATOR_UDID}    emulator-5554

*** Keywords ***

Start Session
    Open Application    http://localhost:4723
    ...                 automationName=uiautomator2
    ...                 platformName=Android
    ...                 deviceName=Emulator
    ...                 udid=${EMULATOR_UDID}
    ...                 autoGrantPermissions=true
    ...                 app=${EXECDIR}/apps/markx.apk

    Wait Until Page Contains    Endereço IP da Api

Finish Session
    Capture Page Screenshot
    Close Application