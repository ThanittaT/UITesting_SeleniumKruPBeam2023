*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                                          https://automate-test.stpb-digital.com/register/
${browser}                                      chrome
${locator_firstname}                            id=firstname
${locator_lastname}                             id=lastname
${locator_email}                                id=email
${locator_password}                             id=password
${locator_mobile}                               id=mobile-phone

#---RadioButton Gender
#${locator_radio_gender}             name=validation-basic-radio      ----> ที่เครื่อง Windows หมุย รันหาปุ่ม RadioButton ไม่เจอถ้าใช้ Locator ตามพี่บีม comment ไว้ใน Keywords ด้านล่างนะคะ
${locator_radio_genderFieldappear}              xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[6]/div/label[1]/span[1]/span[1]

#---Course
#-------checkbox ส่วนนี้ที่ต้องแยกระหว่าง name vs. xpath เพราะว่า หลังกดปุ่ม Register และต้องมี Expected Result webpage แสดง Field-Input ไหนบ้าง หาด้วย name=xxx TestScript รันที่เครื่องหมุยจะขึ้น Fail 
${locator_checkboxSQL}                          name=courses.SQL
${locator_checkboxSQLFieldappear}               xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[7]/div/label[1]/span[1]
${locator_checkboxTestManual}                   name=courses.Test Manual
${locator_checkboxTestManualFieldappear}        xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[7]/div/label[2]/span[1]
${locator_checkboxAutomate1}                    name=courses.Automate Test
${locator_checkboxAutomate1Fieldappear}         xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[7]/div/label[3]/span[1]
${locator_checkboxAutomate2}                    name=courses.Automate Test2
${locator_checkboxAutomate2Fieldappear}         xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[7]/div/label[4]/span[1]

#List
${locator_listShowNationality}                  id=nationality
${locator_selectNationality}                    xpath=//*[@id="menu-"]/div[3]/ul/li[83]
${locator_selectNationalityCzech}               xpath=//*[@id="menu-"]/div[3]/ul/li[60]
${locator_listShowRole}                         id=select-role
${locator_selectRole}                           xpath=//*[@id="menu-"]/div[3]/ul/li[5]
${locator_listShowPlan}                         id=select-plan
${loctor_selectPlan}                            xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_btn-signup}                           id=btn-sign-up
${locator_btn-reset}                            id=reset
${locator_hyperlinkSignin}                      xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[11]/p[2]/a
${locator_btn-OKSuccessRegister}                id=btn-ok
#---Error message
${locator_error-firstname}                      id=error-firstname
${locator_error-lastname}                       id=error-lastname
${locator_error-email}                          id=error-email
${locator_error-password}                       id=error-password
${locator_error-Mobile}                         id=error-mobile-phone
${locator_error-radioGender}                    id=validation-basic-gender
${locator_error-checkboxCourse}                 id=validation-basic-courses
${locator_error-listNation}                     id=validation-basic-nationality
${locator_error-listRole}                       id=validation-role
${locator_error-listPlan}                       id=validation-plan


*** Keywords ***
Open WebBrowser for Register
    Open Browser                      ${url}                            ${browser}
    Wait Until Page Contains          Kru P' Beam                       0.5s
    Maximize Browser Window

Input Data for Register-PASS
    Input Text                        ${locator_firstname}              ธนิตตา
    Input Text                        ${locator_lastname}               ถง
    ${passwordRegistration}           Set Variable                      12345678
    Input Text                        ${locator_email}                  testAutomate@email.com
    Input Password                    ${locator_password}               ${passwordRegistration}
    Input Text                        ${locator_mobile}                 0801112233  
#Select Radio Button               ${locator_radio_gender}           female        Note: codePBeam รันไม่ผ่านที่เครื่องหมุย
# Select Radio Button    name=xxxxxxxx    value=xxx        ไม่ได้ทำตามพี่บีมเพราะของหมุยขึ้น Error-message: Element 'name=validation-basic-radio' not visible after 5 seconds.
#Clip เรียนเพิ่มเติม = https://www.youtube.com/watch?v=AH8SimEiFSc
    Select Radio Button               validation-basic-radio            female  

    Select Checkbox                   ${locator_checkboxSQL}
    Select List Nationality
    Select List Role
    Select List Plan
    Click Element                     ${locator_btn-signup}
    #----------------------------------------------------------------------------pop-up once press "sign-up" button
    Wait Until Page Contains          Register Success                   
    Click Element                     ${locator_btn-OKSuccessRegister}
    Wait Until Page Contains          Welcome to Kru P' Beam!              
    Wait Until Element Is Visible     ${locator_email}


Select List Nationality
    Wait Until Element Is Visible     ${locator_listShowNationality}
    Click Element                     ${locator_listShowNationality}
#---ถ้าไม่ใช้คำสั่ง sleep xx รันที่เครื่องหมุย script=Fail
    Sleep    0.5s 
    Wait Until Element Is Visible     ${locator_selectNationality}              
    Click Element                     ${locator_selectNationality}


Select List Nation for RESET
    Wait Until Element Is Visible     ${locator_listShowNationality}
    Click Element                     ${locator_listShowNationality}
#---ถ้าไม่ใช้คำสั่ง sleep xx รันที่เครื่องหมุย script=Fail
    Sleep    0.5s                              
    Wait Until Element Is Visible     ${locator_selectNationalityCzech}             
    Click Element                     ${locator_selectNationalityCzech}
    
Select List Role
    Wait Until Element Is Visible    ${locator_listShowRole} 
    Click Element                     ${locator_listShowRole} 
    Wait Until Element Is Visible     ${locator_selectRole}                                  #---Select=Subscriber
    Click Element                     ${locator_selectRole}

Select List Plan
    Wait Until Element Is Visible     ${locator_listShowPlan}
    Click Element                     ${locator_listShowPlan} 
    Wait Until Element Is Visible     ${loctor_selectPlan}                                  #---Select=Basic 
    Click Element                     ${loctor_selectPlan}

Input Data for Reset_Button-PASS
    Input Text                        ${locator_firstname}               ธนิตตา
    Input Text                        ${locator_lastname}                ถง
    ${passwordRegistration}           Set Variable                       12345678
    Input Text                        ${locator_email}                   testAutomate@email.com
    Input Password                    ${locator_password}                ${passwordRegistration}
    Input Text                        ${locator_mobile}                  0801112233  
#Select Radio Button               ${locator_radio_gender}           female        Note: codePBeam รันไม่ผ่านที่เครื่องหมุย
# Select Radio Button    name=xxxxxxxx    value=xxx        ไม่ได้ทำตามพี่บีมเพราะของหมุยขึ้น Error-message: Element 'name=validation-basic-radio' not visible after 5 seconds.
#Clip เรียนเพิ่มเติม = https://www.youtube.com/watch?v=AH8SimEiFSc
    Select Radio Button               validation-basic-radio             female  

    Select Checkbox                   ${locator_checkboxSQL}
    Select Checkbox                   ${locator_checkboxTestManual}
    Select Checkbox                   ${locator_checkboxAutomate1} 
    Select Checkbox                   ${locator_checkboxAutomate2}
    Select List Nation for RESET
    Select List Role
    Select List Plan
    Click Element                     ${locator_btn-reset}

Input Data for Missing-firstname_FAIL                                        
    Input Text                        ${locator_firstname}               ${EMPTY}        #-----Firstname Missing 
    Input Text                        ${locator_lastname}                ถง
    ${passwordRegistration}           Set Variable                       12345678
    Input Text                        ${locator_email}                   testAutomate@email.com
    Input Password                    ${locator_password}                ${passwordRegistration}
    Input Text                        ${locator_mobile}                  0801112233  
#Select Radio Button               ${locator_radio_gender}           female        Note: codePBeam รันไม่ผ่านที่เครื่องหมุย
# Select Radio Button    name=xxxxxxxx    value=xxx        ไม่ได้ทำตามพี่บีมเพราะของหมุยขึ้น Error-message: Element 'name=validation-basic-radio' not visible after 5 seconds.
#Clip เรียนเพิ่มเติม = https://www.youtube.com/watch?v=AH8SimEiFSc
    Select Radio Button               validation-basic-radio             female  

    Select Checkbox                   ${locator_checkboxSQL}
    Select List Nationality
    Select List Role
    Select List Plan
    Click Element                     ${locator_btn-signup}

Verify error-msg for firstname
    ${errFirstname}=    Get Text      ${locator_error-firstname}
    Should Be Equal As Strings        ${errFirstname}                    This field is required


Input Data for Missing-lastname_FAIL                                         
    Input Text                        ${locator_firstname}               ธนิตตา
    Input Text                        ${locator_lastname}                ${EMPTY}            #-----Lastname Missing  
    ${passwordRegistration}           Set Variable                       12345678
    Input Text                        ${locator_email}                   testAutomate@email.com
    Input Password                    ${locator_password}                ${passwordRegistration}
    Input Text                        ${locator_mobile}                  0801112233  
#Select Radio Button               ${locator_radio_gender}           female        Note: codePBeam รันไม่ผ่านที่เครื่องหมุย
# Select Radio Button    name=xxxxxxxx    value=xxx        ไม่ได้ทำตามพี่บีมเพราะของหมุยขึ้น Error-message: Element 'name=validation-basic-radio' not visible after 5 seconds.
#Clip เรียนเพิ่มเติม = https://www.youtube.com/watch?v=AH8SimEiFSc
    Select Radio Button               validation-basic-radio             female  

    Select Checkbox                   ${locator_checkboxSQL}
    Select List Nationality
    Select List Role
    Select List Plan
    Click Element                     ${locator_btn-signup}

Verify error-msg for lastname
    ${errLastname}=    Get Text       ${locator_error-lastname}
    Should Be Equal As Strings        ${errLastname}                     This field is required   


Input Data for Missing-Email_FAIL                                         
    Input Text                        ${locator_firstname}               ธนิตตา
    Input Text                        ${locator_lastname}                ถง            
    ${passwordRegistration}           Set Variable                       12345678
    Input Text                        ${locator_email}                   ${EMPTY}            #-----Email Missing  
    Input Password                    ${locator_password}                ${passwordRegistration}
    Input Text                        ${locator_mobile}                  0801112233  
#Select Radio Button               ${locator_radio_gender}           female        Note: codePBeam รันไม่ผ่านที่เครื่องหมุย
# Select Radio Button    name=xxxxxxxx    value=xxx        ไม่ได้ทำตามพี่บีมเพราะของหมุยขึ้น Error-message: Element 'name=validation-basic-radio' not visible after 5 seconds.
#Clip เรียนเพิ่มเติม = https://www.youtube.com/watch?v=AH8SimEiFSc
    Select Radio Button               validation-basic-radio             female  

    Select Checkbox                   ${locator_checkboxSQL}
    Select List Nationality
    Select List Role
    Select List Plan
    Click Element                     ${locator_btn-signup}

Verify error-msg for Email
    ${errEmail}=    Get Text          ${locator_error-email}
    Should Be Equal As Strings        ${errEmail}                        This field is required  


Input Data for Missing-Password_FAIL                                         
    Input Text                        ${locator_firstname}               ธนิตตา
    Input Text                        ${locator_lastname}                ถง           
    ${passwordRegistration}           Set Variable                       ${EMPTY}                    #-----Password Missing  
    Input Text                        ${locator_email}                   testAutomate@email.com
    Input Password                    ${locator_password}                ${passwordRegistration}        #-----Password Missing 
    Input Text                        ${locator_mobile}                  0801112233  
#Select Radio Button               ${locator_radio_gender}           female        Note: codePBeam รันไม่ผ่านที่เครื่องหมุย
# Select Radio Button    name=xxxxxxxx    value=xxx        ไม่ได้ทำตามพี่บีมเพราะของหมุยขึ้น Error-message: Element 'name=validation-basic-radio' not visible after 5 seconds.
#Clip เรียนเพิ่มเติม = https://www.youtube.com/watch?v=AH8SimEiFSc
    Select Radio Button               validation-basic-radio             female  

    Select Checkbox                   ${locator_checkboxSQL}
    Select List Nationality
    Select List Role
    Select List Plan
    Click Element                     ${locator_btn-signup}

Verify error-msg for Password
    ${errMissPassword}=               Get Text                           ${locator_error-password}
    Should Be Equal As Strings        ${errMissPassword}                 This field is required


Input Data for Missing-Mobile_FAIL                                         
    Input Text                        ${locator_firstname}               ธนิตตา
    Input Text                        ${locator_lastname}                ถง           
    ${passwordRegistration}           Set Variable                       12345678                    
    Input Text                        ${locator_email}                   testAutomate@email.com
    Input Password                    ${locator_password}                ${passwordRegistration}        
    Input Text                        ${locator_mobile}                  ${EMPTY}                            #-----Mobile Missing
#Select Radio Button               ${locator_radio_gender}           female        Note: codePBeam รันไม่ผ่านที่เครื่องหมุย
# Select Radio Button    name=xxxxxxxx    value=xxx        ไม่ได้ทำตามพี่บีมเพราะของหมุยขึ้น Error-message: Element 'name=validation-basic-radio' not visible after 5 seconds.
#Clip เรียนเพิ่มเติม = https://www.youtube.com/watch?v=AH8SimEiFSc
    Select Radio Button               validation-basic-radio             female  

    Select Checkbox                   ${locator_checkboxSQL}
    Select List Nationality
    Select List Role
    Select List Plan
    Click Element                     ${locator_btn-signup}

Verify error-msg for Mobile
    ${errMobile}=    Get Text         ${locator_error-Mobile}
    Should Be Equal As Strings        ${errMobile}                       This field is required


Input Data for Missing-Gender_FAIL                                         
    Input Text                        ${locator_firstname}               ธนิตตา
    Input Text                        ${locator_lastname}                ถง           
    ${passwordRegistration}           Set Variable                       12345678                    
    Input Text                        ${locator_email}                   testAutomate@email.com
    Input Password                    ${locator_password}                ${passwordRegistration}        
    Input Text                        ${locator_mobile}                  0801112233                              
    #Select Radio Button              ${locator_radio_gender}            female                #-----Radio-Gender Missing
    Select Checkbox                   ${locator_checkboxSQL}
    Select List Nationality
    Select List Role
    Select List Plan
    Click Element                     ${locator_btn-signup}

Verify error-msg for Gender
    ${errGender}=    Get Text         ${locator_error-radioGender}
    Should Be Equal As Strings        ${errGender}                       This field is required


Input Data for Missing-Courses_FAIL                                         
    Input Text                        ${locator_firstname}               ธนิตตา
    Input Text                        ${locator_lastname}                ถง           
    ${passwordRegistration}           Set Variable                       12345678                    
    Input Text                        ${locator_email}                   testAutomate@email.com
    Input Password                    ${locator_password}                ${passwordRegistration}        
    Input Text                        ${locator_mobile}                  0801112233                             
#Select Radio Button               ${locator_radio_gender}           female        Note: codePBeam รันไม่ผ่านที่เครื่องหมุย
# Select Radio Button    name=xxxxxxxx    value=xxx        ไม่ได้ทำตามพี่บีมเพราะของหมุยขึ้น Error-message: Element 'name=validation-basic-radio' not visible after 5 seconds.
#Clip เรียนเพิ่มเติม = https://www.youtube.com/watch?v=AH8SimEiFSc
    Select Radio Button               validation-basic-radio             female  
               
    #Select Checkbox                   ${locator_checkboxSQL}            #-----checkbox Course-selection Missing
    Select List Nationality
    Select List Role
    Select List Plan
    Click Element                     ${locator_btn-signup}

Verify error-msg for Courses
    ${errCourse}=    Get Text         ${locator_error-checkboxCourse}
    Should Be Equal As Strings        ${errCourse}                      This field is required


Input Data for Missing-ListNation_FAIL                                         
    Input Text                        ${locator_firstname}               ธนิตตา
    Input Text                        ${locator_lastname}                ถง           
    ${passwordRegistration}           Set Variable                       12345678                    
    Input Text                        ${locator_email}                   testAutomate@email.com
    Input Password                    ${locator_password}                ${passwordRegistration}        
    Input Text                        ${locator_mobile}                  0801112233                             
#Select Radio Button               ${locator_radio_gender}           female        Note: codePBeam รันไม่ผ่านที่เครื่องหมุย
# Select Radio Button    name=xxxxxxxx    value=xxx        ไม่ได้ทำตามพี่บีมเพราะของหมุยขึ้น Error-message: Element 'name=validation-basic-radio' not visible after 5 seconds.
#Clip เรียนเพิ่มเติม = https://www.youtube.com/watch?v=AH8SimEiFSc
    Select Radio Button               validation-basic-radio             female  
              
    Select Checkbox                   ${locator_checkboxSQL}                            
    #Select List Nationality          #-----Nationality-DropDownList Missing
    Select List Role
    Select List Plan
    Click Element                     ${locator_btn-signup}

Verify error-msg for ListNation
    ${errNation}=                     Get Text                            ${locator_error-listNation}
    Should Be Equal As Strings        ${errNation}                        This field is required


Input Data for Missing-ListRole_FAIL                                         
    Input Text                        ${locator_firstname}                ธนิตตา
    Input Text                        ${locator_lastname}                 ถง           
    ${passwordRegistration}           Set Variable                        12345678                    
    Input Text                        ${locator_email}                    testAutomate@email.com
    Input Password                    ${locator_password}                 ${passwordRegistration}        
    Input Text                        ${locator_mobile}                   0801112233                              
#Select Radio Button               ${locator_radio_gender}           female        Note: codePBeam รันไม่ผ่านที่เครื่องหมุย
# Select Radio Button    name=xxxxxxxx    value=xxx        ไม่ได้ทำตามพี่บีมเพราะของหมุยขึ้น Error-message: Element 'name=validation-basic-radio' not visible after 5 seconds.
#Clip เรียนเพิ่มเติม = https://www.youtube.com/watch?v=AH8SimEiFSc
    Select Radio Button               validation-basic-radio              female  
               
    Select Checkbox                   ${locator_checkboxSQL}                            
    Select List Nationality                                            
    #Select List Role                 #-----Role-DropDownList Missing
    Select List Plan
    Click Element                     ${locator_btn-signup}

Verify error-msg for ListRole
    ${errRole}=    Get Text           ${locator_error-listRole}
    Should Be Equal As Strings        ${errRole}                           This field is required


Input Data for Missing-ListPlan_FAIL                                         
    Input Text                        ${locator_firstname}                 ธนิตตา
    Input Text                        ${locator_lastname}                  ถง           
    ${passwordRegistration}           Set Variable                         12345678                    
    Input Text                        ${locator_email}                     testAutomate@email.com
    Input Password                    ${locator_password}                  ${passwordRegistration}        
    Input Text                        ${locator_mobile}                    0801112233                           
#Select Radio Button               ${locator_radio_gender}           female        Note: codePBeam รันไม่ผ่านที่เครื่องหมุย
# Select Radio Button    name=xxxxxxxx    value=xxx        ไม่ได้ทำตามพี่บีมเพราะของหมุยขึ้น Error-message: Element 'name=validation-basic-radio' not visible after 5 seconds.
#Clip เรียนเพิ่มเติม = https://www.youtube.com/watch?v=AH8SimEiFSc
    Select Radio Button               validation-basic-radio               female  
               
    Select Checkbox                   ${locator_checkboxSQL}                            
    Select List Nationality                                            
    Select List Role                                                   
    #Select List Plan                 #-----Plan-DropDownList Missing
    Click Element                     ${locator_btn-signup}

Verify error-msg for ListPlan
    ${errPlan}=                       Get Text                              ${locator_error-listPlan}
    Should Be Equal As Strings        ${errPlan}                            This field is required

Verify Fields in default navigate RegisterPage
    Wait Until Element Is Visible     ${locator_firstname}           
    Wait Until Element Is Visible     ${locator_lastname}             
    Wait Until Element Is Visible     ${locator_email}           
    Wait Until Element Is Visible     ${locator_password}
    Wait Until Element Is Visible     ${locator_mobile}           
    Wait Until Element Is Visible     ${locator_radio_genderFieldappear}
    Wait Until Element Is Visible     ${locator_checkboxSQLFieldappear}          
    Wait Until Element Is Visible     ${locator_checkboxTestManualFieldappear} 
    Wait Until Element Is Visible     ${locator_checkboxAutomate1Fieldappear}           
    Wait Until Element Is Visible     ${locator_checkboxAutomate2Fieldappear}
    Wait Until Element Is Visible     ${locator_listShowNationality}    
    Wait Until Element Is Visible     ${locator_listShowRole}     
    Wait Until Element Is Visible     ${locator_listShowPlan}              
    Wait Until Element Is Visible     ${locator_btn-signup}    
    Wait Until Element Is Visible     ${locator_btn-reset}         
    Wait Until Element Is Visible     ${locator_hyperlinkSignin} 


*** Test Cases ***
TC001-Open RegisterPage (default)
    [Documentation]    Locator-Fields ทั้งหมดของหน้าจอ Registerpage
    Open WebBrowser for Register
    Verify Fields in default navigate RegisterPage 
    Close Browser


TC002-Register_PASS
    Open WebBrowser for Register
    Input Data for Register-PASS
    Close Browser

TC003-Register and Reset fields_PASS
    Open WebBrowser for Register
    Input Data for Reset_Button-PASS
    Close Browser

TC004-Register Missing Field_Firstname
    Open WebBrowser for Register
    Input Data for Missing-firstname_FAIL
    Verify error-msg for firstname
    Close Browser

TC005-Register Missing Field_Lastname
    Open WebBrowser for Register
    Input Data for Missing-lastname_FAIL 
    Verify error-msg for lastname
    Close Browser

TC006-Register Missing Field_Email
    Open WebBrowser for Register
    Input Data for Missing-Email_FAIL
    Verify error-msg for Email
    Close Browser

TC007-Register Missing Field_Password
    Open WebBrowser for Register
    Input Data for Missing-Password_FAIL
    Verify error-msg for Password
    Close Browser

TC008-Register Missing Field_Mobile
    Open WebBrowser for Register
    Input Data for Missing-Mobile_FAIL
    Verify error-msg for Mobile
    Close Browser

TC009-Register Missing Field_Gender
    Open WebBrowser for Register
    Input Data for Missing-Gender_FAIL
    Verify error-msg for Gender
    Close Browser

TC010-Register Missing Field_Courses 
    Open WebBrowser for Register
    Input Data for Missing-Courses_FAIL
    Verify error-msg for Courses
    Close Browser

TC011-Register Missing Field_Nationality
    Open WebBrowser for Register
    Input Data for Missing-ListNation_FAIL
    Verify error-msg for ListNation
    Close Browser

TC012-Register Missing Field_Role
    Open WebBrowser for Register
    Input Data for Missing-ListRole_FAIL
    Verify error-msg for ListRole
    Close Browser

TC013-Register Missing Field_Plan
    Open WebBrowser for Register
    Input Data for Missing-ListPlan_FAIL
    Verify error-msg for ListPlan
    Close Browser



