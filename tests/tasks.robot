*** Settings ***
Documentation    Suite de testes do cadastro de tarefas

Resource          ${EXECDIR}/resources/base.resource.robot
Library           FakerLibrary

Test Setup       Run Keywords    Start Session    AND
...                                      Login Into Application
Test Teardown    Run Keywords    Remove Task From Database    ${task}    AND
...                                      Finish Session

*** Test Cases ***

Task Should Be Created
    [Tags]    create
    ${task}    FakerLibrary.Text    max_nb_chars=20
    
    Create New Task           ${task}
    Task Should Be Visible    ${task}

Task Should Be Removed
    [Tags]    delete
    [Teardown]    NONE
    ${task}    FakerLibrary.Text    max_nb_chars=20
    
    Create New Task           ${task}
    Task Should Be Visible    ${task}

    Remove Task By Name                    ${task}
    Wait Until Page Does Not Contain    ${task}

Task Should Be Concluded
    [Tags]    update
    ${task}    FakerLibrary.Text    max_nb_chars=20
    
    Create New Task           ${task}
    Task Should Be Visible    ${task}

    Finish Task            ${task}
    Task Should Be Done    ${task}