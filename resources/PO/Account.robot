
*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${ACCOUNT_TITLE}                My account - My Store
${BTN_ORDER}                    //span[contains(.,'Order history and details')]



*** Keywords ***

Conferir se o cadastro foi efetuado com sucesso
    Title Should Be    ${ACCOUNT_TITLE}
    Wait Until Element Is Visible    ${BTN_ORDER}
