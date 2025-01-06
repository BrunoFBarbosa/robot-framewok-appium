*** Settings ***
Documentation    Elementos e ações da tela de tarefas

Library    AppiumLibrary

*** Variables ***
${new_task_input}    xpath=//*[contains(@text, "nova tarefa")]
${create_button}     xpath=//*[@resource-id="createTask"]
${yes_button}         xpath=//android.widget.Button[@text="SIM"]

*** Keywords ***

Create New Task
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    ${new_task_input}
    Input Text    ${new_task_input}    ${task_name}
    Click Element    ${create_button}

Task Should Be Visible
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    xpath=//*[@resource-id="taskText"][@text="${task_name}"]

Remove Task By Name
    [Arguments]    ${task_name}

    Click Element    xpath=//*[@text="${task_name}"]//ancestor::*/*[@resource-id="removeTask"]
    
    Wait Until Element Is Visible    ${yes_button}
    Click Element    ${yes_button}

Finish Task
    [Arguments]    ${task_name}

    Click Element    xpath=//*[@text="${task_name}"]/..

Task Should Be Done
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    xpath=//*[@text="${task_name}"]/..//android.widget.ImageView