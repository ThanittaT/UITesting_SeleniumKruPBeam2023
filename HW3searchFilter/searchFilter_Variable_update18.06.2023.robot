*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${urlSearch}                                          https://automate-test.stpb-digital.com/user/list/
${browser}                                            chrome
${Login_emailField}                                   xpath=//div//input[@id='email']
${Login_passwordField}                                xpath=//div//input[@name='password']
${Login_button}                                       xpath=//div//button[@id='btn-login']
#-----iconNotofication Header: SearchPage
${locator_Search-Notifyicon}                          xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/button         #Icon-Notification
${search_iconNotification_message}                    xpath=/html/body/div[3]/div[3]/ul/li[1]/div/p                              #Modal: Message-Notify
${search_iconNotification_list}                       xpath=/html/body/div[3]/div[3]/ul/li[2]                                    #Modal: ส่วนแสดงช่องลิสต์ html ก่อนเข้าถึงปุ่ม Read All
${search_iconNotification_listMessageOverview}        xpath=/html/body/div[3]/div[3]/ul/div
${search_iconNotification_ReadAllbtn}                 css=body > div.MuiModal-root.MuiPopover-root.css-bdbmf5 > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li.MuiMenuItem-root.MuiMenuItem-gutters.MuiButtonBase-root.css-1p3ebxb > button
#-----iconUserProfile Header: SearchPage
${locator_Search-Userprofileicon}                     xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/span/div/img    #Icon-UserProfile
${search_iconUserprofile-Name}                        xpath=/html/body/div[3]/div[3]/ul/div/div/div/p[1]                          #Modal:User profile's name หลังกดไอคอน
${search_iconUserprofile-userRole}                    xpath=/html/body/div[3]/div[3]/ul/div/div/div/p[2]                          #Modal:User profile's Role หลังกดไอคอน
${search_iconUserprofile-Logo}                        xpath=/html/body/div[3]/div[3]/ul/div/div/span/div/img                      #Modal: UserProfile-Logo
${search_iconUserprofile-Logoutmenu}                  css=body > div.MuiModal-root.MuiPopover-root.MuiMenu-root.css-hxcdyb > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li
${search_iconNotification_UserProfileOverview}        xpath=/html/body/div[3]/div[3]/ul

#----Default DropDownList
${locator_SearchRole}                                 id=select-role
${locator_SearchPlan}                                 id=select-plan
${locator_SearchStatus}                               id=select-status

#--Select by Role
${locator_search_defaultRole}                         id=option-select-role-0
${locator_SearchRole-selectAdmin}                     id=option-select-role-1
${locator_SearchRole-selectAuthor}                    id=option-select-role-2
${locator_SearchRole-selectEditor}                    id=option-select-role-3
${locator_SearchRole-selectMaintainer}                id=option-select-role-4
${locator_SearchRole-selectSubscriber}                id=option-select-role-5
@{List_SearchRole}   ${locator_SearchRole-selectAdmin}    ${locator_SearchRole-selectAuthor}    ${locator_SearchRole-selectEditor}    ${locator_SearchRole-selectMaintainer}    ${locator_SearchRole-selectSubscriber}

#--Select by Plan
${locator_search_defaultPlan}                         id=option-select-plan-0
${locator_SearchPlan-selectBasic}                     id=option-select-plan-1
${locator_SearchPlan-selectCompany}                   id=option-select-plan-2
${locator_SearchPlan-selectEnterprise}                id=option-select-plan-3
${locator_SearchPlan_selectTeam}                      id=option-select-plan-4
@{List_SearchPlan}    ${locator_SearchPlan-selectBasic}    ${locator_SearchPlan-selectCompany}    ${locator_SearchPlan-selectEnterprise}    ${locator_SearchPlan_selectTeam}       

#--Select by Status
${locator_search_defaultStatus}                       id=option-select-status-0        #Remark: UI ออกแบบผิด ที่ถูกต้องที่คำว่า "Select Status" สำหรับค่า value0 
${locator_SearchStatus-selectPending}                 id=option-select-status-1
${locator_SearchStatus-selectActive}                  id=option-select-status-2
${locator_SearchStatus-selectInactive}                id=option-select-status-3
@{List_SearchStatus}    ${locator_SearchStatus-selectPending}    ${locator_SearchStatus-selectActive}    ${locator_SearchStatus-selectInactive}             


${locator_Search-CLEARbuton}                          id=btn-clear               
${locator_Search-SEARCHbutton}                        id=btn-search    
${locator_Search-ADDUSERbutton}                       xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[1]/div/a

#----Table record result
${locator_resultRow1to10}                             xpath=//div[@class="MuiDataGrid-row"]
${locator_role_col}                                   xpath=//div[@data-colindex="2"]
${locator_columnDynamicRole}                          xpath=//div//p[@class='MuiTypography-root MuiTypography-body1 MuiTypography-noWrap css-17mo4nj']
  
#---Setting Rows per page:xx Dropdownlist
${search_Table-SettingRowperPage}                     xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[2]
${search_Table-SettingRowperPage10}                   xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${search_Table-SettingRowperPage25}                   xpath=//*[@id="menu-"]/div[3]/ul/li[2]
${search_Table-SettingRowperPage50}                   xpath=//*[@id="menu-"]/div[3]/ul/li[3]


#---Go to next page & Back to previous
${search_Table-GotoNextpage}                          xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[3]/button[2]    #Go to next page >
${search_Table-BacktoPreviouspage}                    xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[3]/button[1]    #Back to previous page
${search_Table-txtDynÄamicresultSetting}              xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/p[2]                #เอาไว้สำหรับ Scroll Down Browser ก่อน capture-screen


#---User Form Page
${addUser_FormPage-BACKbutton}                        xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[1]/button
${addUser_FormPage-UserProfile_icon}                  xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/span/div
#${addUser_iconUserprofile-Logo}                      xpath=/html/body/div[3]/div[3]/ul/div/div/span/div/img
${addUser_iconUserprofile-Logo}                       css=body > div.MuiModal-root.MuiPopover-root.MuiMenu-root.css-hxcdyb > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > div > div > span > div > img
#${addUser_FormPage-UserProfile_Username}             xpath=/html/body/div[3]/div[3]/ul/div/div/div/p[1]
${addUser_FormPage-UserProfile_Username}              css=body > div.MuiModal-root.MuiPopover-root.MuiMenu-root.css-hxcdyb > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > div > div > div > p.MuiTypography-root.MuiTypography-body1.css-wisps
#${addUser_FormPage-UserProfile_UserRole}             xpath=/html/body/div[3]/div[3]/ul/div/div/div/p[2]
${addUser_FormPage-UserProfile_UserRole}              css=body > div.MuiModal-root.MuiPopover-root.MuiMenu-root.css-hxcdyb > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > div > div > div > p.MuiTypography-root.MuiTypography-body2.css-103cd7s
${addUser_FormPage-UserProfile_Logoutmenu}            css=body > div.MuiModal-root.MuiPopover-root.MuiMenu-root.css-hxcdyb > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li

${addUser_FormPage-Notification_icon}                 xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/button
${addUser_FormPage-Notification_NotifyHeader}         css=body > div.MuiModal-root.MuiPopover-root.css-bdbmf5 > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li.MuiMenuItem-root.MuiMenuItem-gutters.MuiButtonBase-root.css-8j3j8p > div > p
${addUser_FormPage-NotificationList}                  css=body > div.MuiModal-root.MuiPopover-root.css-bdbmf5 > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > div > li:nth-child(1) > div > div.MuiAvatar-root.MuiAvatar-circular.css-dqzrhh > img
${addUser_FormPage-Notification_READALLbutton}        css=body > div.MuiModal-root.MuiPopover-root.css-bdbmf5 > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li.MuiMenuItem-root.MuiMenuItem-gutters.MuiButtonBase-root.css-1p3ebxb > button

${addUser_FormPage-txtKruPbeam}                       xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/div[1]/h6
${addUser_FormPage-resetButton}                       xpath=//*[@id="reset"] 
${addUser_FormPage-fieldFirstname}                    id=firstname
${addUser_FormPage-fieldLastname}                     id=lastname
${addUser_FormPage-fieldEmail}                        id=email
${addUser_FormPage-fieldPassword}                     id=password
${addUser_FormPage-fieldMobile}                       id=mobile-phone
${addUser_FormPage-fieldGender_radioGenderButton}     xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/div[6]/div/label[1]/span[1]

${addUser_FormPage-fieldSQL_checkbox}                 xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/div[7]/div/label[1]/span[1]
${addUser_FormPage-fieldManual_checkbox}              xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/div[7]/div/label[2]/span[1]
${addUser_FormPage-fieldAutomateTest_checkbox}        xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/div[7]/div/label[3]/span[1]
${addUser_FormPage-fieldAutomateTest2_checkbox}       xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/div[7]/div/label[4]/span[1]
${addUser_FormPage-fieldNationality_dropdown}         xpath=//*[@id="nationality"]
${addUser_FormPage-fieldRole_dropdown}                xpath=//*[@id="select-role"]
${addUser_FormPage-fieldPlan_dropdown}                xpath=//*[@id="select-plan"]
${addUser_FormPage-SIGNUP_button}                     xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/button