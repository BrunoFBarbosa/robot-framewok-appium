*** Settings ***

Documentation    Elementos e ações da tela de login

Library    AppiumLibrary

*** Variables ***

${API_IP}    localhost

*** Keywords ***

Login Into Application
    Input Text    xpath=//*[@resource-id="apiIp"]    ${API_IP}
    Click Element    xpath=//*[@resource-id="signInButton"]