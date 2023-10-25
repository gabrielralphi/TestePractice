
*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${LOGIN_TITLE}                   Login - My Store
${EMAIL_ADDRESS}                 //input[@type='email'][contains(@id,'create')]
${BTN_CREATE}                    //span[contains(.,'Create an account')]
${PERSONAL_INFO}                 Your personal information
${FIRST_NAME}                    //input[contains(@name,'customer_firstname')]
${LAST_NAME}                     //input[contains(@name,'customer_lastname')]
${FIELD_EMAIL}                   //input[contains(@type,'email')]
${FIELD_PASSWORD}                //input[contains(@type,'password')]
# ${DATE_DAYS}                      //select[contains(@name,'days')]
# ${DATE_MOUTHS}                    //select[contains(@name,'months')]
# ${DATE_YEARS}                     //select[contains(@name,'years')]
${ADDRESS_FIRST}                 //input[@name='firstname']
${ADDRESS_LAST}                  //input[@name='lastname']
${ADDRESS_COMPANY}               //input[contains(@name,'company')]
${ADDRESS}                       //input[contains(@name,'address1')]
${ADDRESS2}                      //input[contains(@name,'address2')]
${ADDRESS_CITY}                  //input[contains(@name,'city')]
${ADDRESS_STATE}                 //select[@name='id_state'][contains(@id,'state')]
${ADDRESS_ZIP}                   //input[contains(@class,'validate form-control uniform-input text')]
${ADDRESS_PHONE}                 //input[@name='phone']
${ADDRESS_MOBILE}                //input[@name='phone_mobile']
${BTN_REGISTER}                  //span[contains(.,'Register')]



*** Keywords ***

Informar um e-mail válido
    ${EMAIL}          Generate Random String        length=8  chars=[LETTERS]
    ${EMAIL}  Convert To Lower Case   ${EMAIL}
    Set Test Variable     ${EMAIL_VALIDO}  ${EMAIL}@emailteste.com

    Title Should Be     ${LOGIN_TITLE}
    Wait Until Element Is Visible    ${EMAIL_ADDRESS}
    Input Text    ${EMAIL_ADDRESS}    ${EMAIL_VALIDO}
    
    
Clicar em "Create an account"
    Click Element    ${BTN_CREATE}

Preencher os dados obrigatórios
    ${PRIMEIRO_NOME}          Generate Random String        length=8  chars=[LETTERS]
    ${SEGUNDO_NOME}           Generate Random String        length=8  chars=[LETTERS]
    ${SENHA}                  Generate Random String        length=5  chars=[NUMBERS]
    ${CIA}                    Generate Random String        length=8  chars=[LETTERS]
    

    Wait Until Page Contains    ${PERSONAL_INFO}
    Input Text    ${FIRST_NAME}    ${PRIMEIRO_NOME}
    Input Text    ${LAST_NAME}    ${SEGUNDO_NOME}
    Input Text    ${FIELD_PASSWORD}    ${SENHA} 
    Press Keys    ${FIELD_EMAIL}    TAB
    Input Text    ${ADDRESS_FIRST}    ${PRIMEIRO_NOME}
    Input Text    ${ADDRESS_LAST}    ${SEGUNDO_NOME} 
    Input Text    ${ADDRESS_COMPANY}    ${CIA}
    Input Text    ${ADDRESS}    Street xxxxx
    Input Text    ${ADDRESS2}    Apartment 202xxxxx
    Input Text    ${ADDRESS_CITY}    Florianopolis
    Select From List by Value   ${ADDRESS_STATE}    1
    Input Text    ${ADDRESS_ZIP}    00001
    Input Text    ${ADDRESS_PHONE}    123456
    Input Text    ${ADDRESS_MOBILE}    987654


Submeter cadastro
    Click Element    ${BTN_REGISTER}