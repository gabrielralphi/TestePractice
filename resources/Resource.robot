*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}      chrome

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    #Open Browser        about:blank   ${BROWSER}    headlesschrome
    #Maximize Browser Window

    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()
    Call Method    ${options}    add_argument    --headless
    Create Webdriver    Chrome    options=${options}

Fechar navegador
    Capture Page Screenshot
    Close Browser

