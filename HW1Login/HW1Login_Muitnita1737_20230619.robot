*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${url}                                  https://automate-test.stpb-digital.com/login/
${browser}                              chrome
${locator_email}                        id=email
${locator_password}                     name=password
${locator_btn-login}                    id=btn-login
${locator_linkRegister}                 css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div.MuiBox-root.css-15tnlg1 > div > div > form > div.MuiBox-root.css-z0xj7h > p.MuiTypography-root.MuiTypography-body1.css-azsy9a > a
${locator_error-email}                  xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[1]/p
${locator_error-password}               xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[2]/p

*** Keywords ***
Open WebBrowser KruPBeam
    Open Browser                        ${url}                     ${browser}
    Maximize Browser Window
    Set Selenium Speed    0.2s
    Wait Until Page Contains                                       Welcome to Kru P' Beam! 

Input Data for Login-Pass
    ${passwordLogin}    Set Variable    ${123456789}                    
    Wait Until Element Is Visible       ${locator_email}
    Wait Until Element Is Visible       ${locator_password}
    Input Text                          ${locator_email}           user.test@krupbeam.com
    Input Password                      ${locator_password}        ${passwordLogin}
    Click Element                       ${locator_btn-login}
    Wait Until Page Contains            Search Filter

Input Email-Fail
    Wait Until Element Is Visible       ${locator_email}
    Input Text                          ${locator_email}           iiioso1234วทหก
    Click Element                       ${locator_btn-login}
    Wait Until Element Is Visible       ${locator_error-email}    
    ${errtxt_email}=    Get Text        ${locator_error-email}
    Should Be Equal As Strings          ${errtxt_email}            email must be a valid email

Input Password-Fail
    Wait Until Element Is Visible       ${locator_password}
    ${passwordFail}    Set Variable     123
    Input Password                      ${locator_password}        ${passwordFail}
    Click Element                       ${locator_btn-login}
    Wait Until Element Is Visible       ${locator_error-password}
    ${errtxt_password}=    Get Text     ${locator_error-password}
    Should Be Equal As Strings          ${errtxt_password}          password must be at least 5 characters

Link Register-Hyperlink_CreateNewAccount
    Wait Until Element Is Visible       ${locator_linkRegister}
    Click Element                       ${locator_linkRegister}
    Wait Until Page Contains            Kru P' Beam

Verify Input Data-Missing Field
    Wait Until Element Is Visible       ${locator_email}
    Wait Until Element Is Visible       ${locator_password}
    Input Text                          ${locator_email}             ${EMPTY}
    Input Password                      ${locator_password}          ${EMPTY}
    Click Element                       ${locator_btn-login}
    Wait Until Element Is Visible       ${locator_error-email}    
    ${errMissingEmail}=    Get Text     ${locator_error-email}
    Wait Until Element Is Visible       ${locator_error-password}
    ${errMissingPassword}=  Get Text    ${locator_error-password}
    Should Be Equal As Strings          ${errMissingEmail}           email is a required field
    Should Be Equal As Strings          ${errMissingPassword}        password must be at least 5 characters


*** Test Cases ***
TC001-Open Login Page(default)
    Open WebBrowser KruPBeam
    Wait Until Element Is Visible       ${locator_email}            
    Wait Until Element Is Visible       ${locator_password}         
    Wait Until Element Is Visible       ${locator_btn-login}        
    Wait Until Element Is Visible       ${locator_linkRegister}     
    Close Browser

TC002-Login_PASS
    [Tags]    Login
    Open WebBrowser KruPBeam
    Input Data for Login-Pass
    Close Browser

TC003-Login Invalid Email-FAIL
    Open WebBrowser KruPBeam
    Input Email-Fail
    Close Browser

TC004-Login Invalid Password-FAIL
    Open WebBrowser KruPBeam
    Input Password-Fail
    Close Browser

TC005-Login for Non-membership-PASS
    Open WebBrowser KruPBeam
    Link Register-Hyperlink_CreateNewAccount
    Close Browser

TC006-Login with MissingFields-FAIL
    Open WebBrowser KruPBeam
    Verify Input Data-Missing Field
    Close Browser