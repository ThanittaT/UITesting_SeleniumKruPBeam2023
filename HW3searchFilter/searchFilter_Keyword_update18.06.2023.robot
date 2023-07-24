*** Settings ***
Library  SeleniumLibrary
Resource  //Users//ASUS//Desktop//Automate-PBeamHW//HW3_SearchFilter_Muiupdate18.03.2023//searchFilter_Variable_update18.06.2023.robot

*** Keywords ***
Open SearchPage
    Open Browser                                 ${urlSearch}              ${browser}
    Maximize Browser Window
    Wait Until Page Contains                     Welcome to Kru P' Beam
    Wait Until Element Is Visible                ${Login_emailField}
    Wait Until Element Is Visible                ${Login_passwordField}  
    Wait Until Element Is Visible                ${Login_button} 
    ${LoginPassword}                             Set Variable               123456789
    Input Text                                   ${Login_emailField}        user.test@krupbeam.com
    Input Password                               ${Login_passwordField}     ${LoginPassword}
    Click Element                                ${Login_button}
    Wait Until Page Contains                     Search Filters
    
#------เพิ่มตาม Feedback การบ้านรอบแรก
Verify Searchpage Fields Appear                                                            
    Wait Until Element Is Visible                ${locator_Search-Notifyicon} 
    Wait Until Element Is Visible                ${locator_Search-Userprofileicon}
    Wait Until Element Is Visible                ${locator_SearchRole}
    Wait Until Element Is Visible                ${locator_SearchPlan} 
    Wait Until Element Is Visible                ${locator_SearchStatus}
    Wait Until Element Is Visible                ${locator_Search-CLEARbuton}
    Wait Until Element Is Visible                ${locator_Search-SEARCHbutton} 
    Wait Until Element Is Visible                ${locator_Search-ADDUSERbutton}
    Wait Until Element Is Visible                ${search_Table-SettingRowperPage}   

Clear button for condition1: (defualt) SEARCH without Filter defined
    Wait Until Element Is Visible                ${locator_Search-SEARCHbutton}             
    Click Element                                ${locator_Search-SEARCHbutton} 
    Log    ตรวจสอบ Table ผลลัพธ์หลังกดปุ่ม SEARCH โดยให้ดูที่ SettingRowperPage: 10 ซึ่งเป็นค่า default
    Wait Until Element Is Visible                ${locator_resultRow1to10}                          
    Scroll Element Into View                     ${search_Table-SettingRowperPage}                      
    Log    Press CLEAR
    Scroll Element Into View                     ${locator_Search-CLEARbuton}                             
    Click Element                                ${locator_Search-CLEARbuton}
    Log    ตรวจสอบ Table ผลลัพธ์หลังกดปุ่ม CLEAR โดยให้ดูที่ SettingRowperPage: 10(default), 25, 50 ต้องแสดงคำว่า ----> No Rows
    Scroll Element Into View                     ${search_Table-SettingRowperPage}
                       
Clear button for condition2: Table Record exists by press SEARCH
    Wait Until Element Is Visible                ${locator_Search-Notifyicon} 
    Wait Until Element Is Visible                ${locator_Search-Userprofileicon}
    Log    Select Role
    Wait Until Element Is Visible                ${locator_SearchRole}
    Click Element                                ${locator_SearchRole}
    Wait Until Element Is Visible                ${locator_SearchRole-selectSubscriber}         
    Click Element                                ${locator_SearchRole-selectSubscriber}
    Log    Select Plan
    Wait Until Element Is Visible                ${locator_SearchPlan}
    Click Element                                ${locator_SearchPlan}
    Wait Until Element Is Visible                ${locator_SearchPlan-selectBasic}              
    Click Element                                ${locator_SearchPlan-selectBasic}
    Log    Select Status 
    Wait Until Element Is Visible                ${locator_SearchStatus}
    Click Element                                ${locator_SearchStatus}
    Wait Until Element Is Visible                ${locator_SearchStatus-selectInactive}         
    Click Element                                ${locator_SearchStatus-selectInactive} 
    Log    Press SEARCH หลังระบุเงื่อนไขการค้นหา Filter-Condition: Role, Plan, Status
    Wait Until Element Is Visible                ${locator_Search-SEARCHbutton} 
    Click Element                                ${locator_Search-SEARCHbutton}
    Log    ตรวจสอบ Table ผลลัพธ์หลังกดปุ่ม SEARCH โดยให้ดูที่ SettingRowperPage: 10(default), 25, 50 ----> มีรายการ Record เกิดขึ้น 
    Wait Until Element Is Visible                ${locator_columnDynamicRole}                                          
    Scroll Element Into View                     ${search_Table-SettingRowperPage}                      
    Log     Press CLEAR
    Scroll Element Into View                     ${locator_Search-CLEARbuton}    
    Click Element                                ${locator_Search-CLEARbuton} 
    Log    ตรวจสอบ Table ผลลัพธ์หลังกดปุ่ม CLEAR โดยให้ดูที่ SettingRowperPage: 10(default), 25, 50 ต้องแสดงคำว่า ----> No Rows
    Scroll Element Into View                     ${search_Table-SettingRowperPage}                      

Clear button for condition3: No Table record appear
    Wait Until Element Is Visible                ${locator_SearchRole}
    Click Element                                ${locator_SearchRole}
    Wait Until Element Is Visible                ${locator_SearchRole-selectSubscriber}         
    Click Element                                ${locator_SearchRole-selectSubscriber}
    Wait Until Element Is Visible                ${locator_SearchPlan}
    Click Element                                ${locator_SearchPlan}
    Wait Until Element Is Visible                ${locator_SearchPlan-selectBasic}             
    Click Element                                ${locator_SearchPlan-selectBasic} 
    Wait Until Element Is Visible                ${locator_SearchStatus}
    Click Element                                ${locator_SearchStatus}
    Wait Until Element Is Visible                ${locator_SearchStatus-selectInactive}         
    Click Element                                ${locator_SearchStatus-selectInactive}
    Log    Press CLEAR หลังใส่ Filter โดยไม่ต้องกดปุ่ม SEARCH
    Wait Until Element Is Visible                ${locator_Search-CLEARbuton}	
    Scroll Element Into View                     ${locator_Search-CLEARbuton}    
    Click Element                                ${locator_Search-CLEARbuton}
    Wait Until Element Is Visible                ${locator_SearchRole} 
    Wait Until Element Is Visible                ${locator_SearchPlan} 
    Wait Until Element Is Visible                ${locator_SearchStatus} 
    Scroll Element Into View                     ${search_Table-SettingRowperPage}                  

Get Random Item
    [Arguments]        ${items}
    ${random_item}=    Evaluate                   random.choice($items)
    [Return]           ${random_item}

Search multiple value with Roles and Plans and Status filter
    [Arguments]   ${role}    ${plan}    ${status}    
    IF    ${role} == ${1}
        ${role_selector}=    Get Random Item      ${List_SearchRole}
        Wait Until Element Is Visible             ${locator_SearchRole}
        Click Element                             ${locator_SearchRole}
        Wait Until Element Is Visible             ${role_selector}        
        Click Element                             ${role_selector}   

    END
    IF    ${plan} == ${1}
        ${plan_selector}=    Get Random Item      ${List_SearchPlan} 
        Wait Until Element Is Visible             ${locator_SearchPlan}
        Click Element                             ${locator_SearchPlan}
        Wait Until Element Is Visible             ${plan_selector}             
        Click Element                             ${plan_selector} 
    END
    IF    ${status} == ${1}
        ${status_selector}=    Get Random Item    ${List_SearchStatus}
        Wait Until Element Is Visible             ${locator_SearchStatus}
        Click Element                             ${locator_SearchStatus}
        Wait Until Element Is Visible             ${status_selector}          
        Click Element                             ${status_selector}
    END

    Wait Until Element Is Visible                 ${locator_Search-SEARCHbutton}
    Click Element                                 ${locator_Search-SEARCHbutton}
#------------Erorr-Handling: เอาไว้ตรวจสอบผลลัพธ์ใน Table Record ไม่ใช่ตรวจสอบ Data Test ที่ใส่เข้าไป เพราะมีบางเงื่อนไข ระบุครบกด SEARCH แล้วผลลัพธ์ในเท่ากับ No Rows แล้ว Script=Fail เช่น Author, Company, Inactive 
    ${element_visible}=         Run Keyword And Return Status    Element Should Be Visible  ${locator_resultRow1to10}        #--Default Table display=10Rows
    Run Keyword If              not ${element_visible}           Verify Table Result with For-Loop 3-Conditons               #(FOR-Loop Keyword ที่สร้างแยกกัน)                    
    Scroll Element Into View    ${search_Table-SettingRowperPage}    

    Wait Until Element Is Visible                 ${locator_Search-CLEARbuton} 
    Click Element                                 ${locator_Search-CLEARbuton}    

Verify Table Result with For-Loop 3-Conditons
    ${input_role}=         Get Text               ${locator_SearchRole}
    ${input_plan}=         Get Text               ${locator_SearchPlan}
    ${input_status}=       Get Text               ${locator_SearchStatus}
    #----${0} ค่าเริ่มต้นใน FOR-LOOP
    ${row_count}=          set variable           0    
    #-- ${rows} คือตารางแสดงข้อมูล 10-record แรก ${locator_resultRow1to10}  หลังกดปุ่มค้นหา
    ${rows}=               Get WebElements        ${locator_resultRow1to10}
    FOR    ${row}    IN    @{rows}
        ${row_count}=      Evaluate               ${row_count} + 1
        ${role_elem}=      Get WebElement         //main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[${row_count}]/div[3]/div/p         # Dynamic result record= Role in Table
        ${plan_elem}=      Get WebElement         //main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[${row_count}]/div[4]/h6            # Dynamic result record= Plan in Table
        ${status_elem}=    Get WebElement         //main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[${row_count}]/div[5]/div/span      # Dynamic result record= Status in Table
        
        ${role}=           Get Text               ${role_elem}
        ${plan}=           Get Text               ${plan_elem}
        ${status}=         Get Text               ${status_elem}
        IF    "${input_role}" != ""
            Should Be Equal    ${role}            ${input_role}
        END
        IF     "${input_plan}" != ""
            Should Be Equal    ${plan}            ${input_plan}
        END
        IF    "${input_status}" != ""
            Should Be Equal    ${status}          ${input_status}
        END   
    END
#-------------Error Handling with FOR-LOOP ไม่ใช่สำหรับ DataTest-------------------------------------------------------------------

Verify Result Table with Go to the next page
    Wait Until Element Is Visible                 ${locator_Search-SEARCHbutton}
    Click Element                                 ${locator_Search-SEARCHbutton}
    Wait Until Element Is Visible                 ${locator_resultRow1to10} 
    Log     Scroll Into View ใช้สำหรับเลื่อนหน้าจอ Browser ลงด้านล่าง เพื่อตรวจสอบผลลัพธ์ครอบคลุมทั้งหมดในตารางจากส่วนบนถึงด้านล่างไปจนถึงส่วน Setting Rows Per page: xx              
    Wait Until Element Is Visible                 ${search_Table-txtDynÄamicresultSetting}    
    Scroll Element Into View                      ${search_Table-txtDynÄamicresultSetting}          
    Capture Page Screenshot
    Log     Press "GO to next page" >>
    Wait Until Element Is Visible                 ${search_Table-GotoNextpage} 
    Click Element                                 ${search_Table-GotoNextpage}                                            
    

Verify Result Table with Back to previous page
    Wait Until Element Is Visible                 ${search_Table-BacktoPreviouspage}
    Click Element                                 ${search_Table-BacktoPreviouspage}
    Log    รอจนกว่า Column Record แถวที่ 1-10 แสดง
    Wait Until Element Is Visible                 ${locator_resultRow1to10} 
    Log    Scroll Into View ใช้สำหรับเลื่อนหน้าจอ Browser ลงด้านล่าง เพื่อตรวจสอบผลลัพธ์ครอบคลุมทั้งหมดในตารางจากส่วนบนถึงด้านล่างไปจนถึงส่วน Setting Rows Per page: xx          
    Scroll Element Into View                      ${search_Table-txtDynÄamicresultSetting}           

Setting Rows Per page: with Argument
    [Arguments]   ${RowSetting}
    Wait Until Element Is Visible                 ${search_Table-SettingRowperPage} 
    Click Element                                 ${search_Table-SettingRowperPage}   
    Wait Until Element Is Visible                 ${RowSetting}        
    Click Element                                 ${RowSetting}   
    Wait Until Element Is Visible                 ${search_Table-txtDynÄamicresultSetting}    
    Scroll Element Into View                      ${search_Table-txtDynÄamicresultSetting}
    Scroll Element Into View                      ${locator_Search-SEARCHbutton}
    Wait Until Element Is Visible                 ${locator_Search-SEARCHbutton}
    Click Element                                 ${locator_Search-SEARCHbutton}
    Scroll Element Into View                      ${search_Table-SettingRowperPage} 

Searchpage ADDUSER-button Click
    Wait Until Element Is Visible                 ${locator_Search-ADDUSERbutton}
    Click Element                                 ${locator_Search-ADDUSERbutton}
    Wait Until Page Contains                      Form User
    Wait Until Element Is Visible                 ${addUser_FormPage-BACKbutton}
    Wait Until Element Is Visible                 ${addUser_FormPage-UserProfile_icon} 
    Wait Until Element Is Visible                 ${addUser_FormPage-Notification_icon} 
    Log      User Form Page-field: Section = Header  
    Wait Until Element Is Visible                 ${addUser_FormPage-txtKruPbeam}
    Wait Until Element Is Visible                 ${addUser_FormPage-resetButton}
    Wait Until Element Is Visible                 ${addUser_FormPage-fieldFirstname} 
    Wait Until Element Is Visible                 ${addUser_FormPage-fieldLastname} 
    Wait Until Element Is Visible                 ${addUser_FormPage-fieldEmail}         
    Wait Until Element Is Visible                 ${addUser_FormPage-fieldPassword} 
    Wait Until Element Is Visible                 ${addUser_FormPage-fieldMobile} 
    Wait Until Element Is Visible                 ${addUser_FormPage-fieldGender_radioGenderButton}      
    Wait Until Element Is Visible                 ${addUser_FormPage-fieldSQL_checkbox}
    Wait Until Element Is Visible                 ${addUser_FormPage-fieldManual_checkbox}
    Wait Until Element Is Visible                 ${addUser_FormPage-fieldAutomateTest_checkbox}
    Wait Until Element Is Visible                 ${addUser_FormPage-fieldAutomateTest2_checkbox} 
    Wait Until Element Is Visible                 ${addUser_FormPage-fieldNationality_dropdown}  
    Wait Until Element Is Visible                 ${addUser_FormPage-fieldRole_dropdown}
    Wait Until Element Is Visible                 ${addUser_FormPage-fieldPlan_dropdown} 
    Log     หน้าจอ User Form Page-field: Section = Body and Footer แสดงครบทุก Field จนถึงปุ่ม SIGNUP  
    Wait Until Element Is Visible                 ${addUser_FormPage-SIGNUP_button}                                         
    Scroll Element Into View                      ${addUser_FormPage-SIGNUP_button} 
    

UserForm Page-Press BACK button to navigate "Search Filter"
    Scroll Element Into View                      ${addUser_FormPage-BACKbutton}     
    Log    Capture: User Form page before press BACK button      
    Wait Until Element Is Visible                 ${addUser_FormPage-BACKbutton}
    Click Element                                 ${addUser_FormPage-BACKbutton}
    Wait Until Page Contains                      Search Filters
    Wait Until Element Is Visible                 ${locator_SearchRole}
    Wait Until Element Is Visible                 ${locator_SearchPlan}
    Wait Until Element Is Visible                 ${locator_SearchPlan}
    Wait Until Element Is Visible                 ${locator_Search-CLEARbuton} 
    Wait Until Element Is Visible                 ${locator_Search-SEARCHbutton}
    Wait Until Element Is Visible                 ${locator_Search-ADDUSERbutton}

Search Page Notification-icon
    Scroll Element Into View                      ${locator_Search-Notifyicon} 
    Wait Until Element Is Visible                 ${locator_Search-Notifyicon} 
    Click Element                                 ${locator_Search-Notifyicon} 
    Log     Clicked Bell-NotifyIcon Succeed
    Wait Until Element Is Visible                 ${search_iconNotification_message} 
    Wait Until Element Is Visible                 ${search_iconNotification_list} 
    Wait Until Element Is Visible                 ${search_iconNotification_ReadAllbtn} 

Search Page UserProfile-icon  
    Wait Until Element Is Visible                 ${locator_Search-Userprofileicon} 
    Click Element                                 ${locator_Search-Userprofileicon} 

Search Page UserProfile-icon_Logout menu
    Wait Until Element Is Visible                 ${search_iconUserprofile-Logo}
    Wait Until Element Is Visible                 ${search_iconUserprofile-Name}                             
    Wait Until Element Is Visible                 ${search_iconUserprofile-userRole}
    Set Focus To Element                          ${search_iconUserprofile-Logoutmenu}          
    Wait Until Element Is Visible                 ${search_iconUserprofile-Logoutmenu}          
    Click Element                                 ${search_iconUserprofile-Logoutmenu}
    Log     Succeed navigate to Login Page after Logout  
    Wait Until Page Contains                      Welcome to Kru P' Beam!
    Wait Until Element Is Visible                 ${Login_emailField}
    Wait Until Element Is Visible                 ${Login_passwordField} 
    Wait Until Element Is Visible                 ${Login_button} 

Test Keyword
    Open SearchPage
    