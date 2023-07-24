*** Settings ***
Library   SeleniumLibrary
Resource    ${CURDIR}//searchFilter_Variable_update18.06.2023.robot
#Resource    //Users//ASUS//Desktop//Automate-PBeamHW//HW3_SearchFilter_Muiupdate18.03.2023//searchFilter_Variable_update18.06.2023.robot
Resource    ${CURDIR}/searchFilter_Keyword_update18.06.2023.robot
#Resource    //Users//ASUS//Desktop//Automate-PBeamHW//HW3_SearchFilter_Muiupdate18.03.2023//searchFilter_Keyword_update18.06.2023.robot



Suite Setup       Set Selenium Speed    0.5s
Test Setup        Open SearchPage
Test Teardown     Close Browser
Suite Teardown    Close All Browsers
Default Tags      pass

*** Test Cases ***
TC01-(default) SearchFilter
    [Documentation]    TCSno.01, TCSno.03 Prequisite#1: Force login with Username and Password then navigate to "Search Filter"
    [Tags]     pass
    Verify Searchpage Fields Appear

TC02-CLEAR Button Conditoin#1
    [Documentation]    TCSno.04, TCSno.05 CLEAR Button กดปุ่ม SEARCH โดยไม่ใส่เงื่อนไขค้นหา แล้วกดปุ่ม CLEAR ข้อมูลในตารางจะต้องหายไป
    [Tags]    pass
    Clear button for condition1: (defualt) SEARCH without Filter defined

TC03-CLEAR Button Conditoin#2
    [Documentation]    TCSno.06 Condition#2 ระบุเงื่อนไข Search Filter กดปุ่ม Search(มีผลรายการ-การค้นหาเกิดขึ้น) แล้วกดปุ่ม CLEAR
    [Tags]    pass
    Clear button for condition2: Table Record exists by press SEARCH

TC04-CLEAR Button Conditoin#3
    [Documentation]    TCSno.07 Condition#3 ระบุเงื่อนไข Search Filter ไม่กดปุ่ม Search แล้วกดปุ่ม CLEAR
    [Tags]    pass
    Clear button for condition3: No Table record appear

TC05-Search Total 3Condition Filter 
    [Documentation]    TCSno.08,TCSno.09,TCSno.10,TCSno.11, TCSno.12,TCSno.13,TCSno.14 แบบสุ่มเลือก Role + Select Plan + Select Status ตั้งแต่ 1-Filter, 2-Filter, 3-Filter
    [Tags]    pass
    [Template]    Search multiple value with Roles and Plans and Status filter
    1    1    1   
    1    1    0
    1    0    0
    0    0    1
    0    1    1
    1    0    0

TC06-Search Record by Go to next page and Back to previous page
    [Documentation]    TCSno.15, TCSno.16 Search Filter ตรวจสอบปุ่ม " > Go to next page" หลังแสดงข้อมูลรายการค้นหา และปุ่ม "< Back to previous page"
    [Tags]    pass
    Verify Result Table with Go to the next page
    Verify Result Table with Back to previous page


TC07-Setting Table view with Rows per page
    [Documentation]    TCSno.17: ส่วนแสดง Search Filter Record - ตรวจสอบการตั้งค่า การแสดงข้อมูล " Rows Per page:xx " หลังแสดงข้อมูลรายการค้นหา
    [Tags]    pass
    [Template]    Setting Rows Per page: with Argument
    ${search_Table-SettingRowperPage50}
    ${search_Table-SettingRowperPage25}
    ${search_Table-SettingRowperPage10}

TC08-Search Page navigate to ADD USER
    [Documentation]    TCSno.18-ตรวจปุ่ม ADD USER ไปยังหน้าจอ User Form 
    [Tags]    pass
    Searchpage ADDUSER-button Click

TC09-User Form Page navigate to Searchpage by BACK
    [Documentation]    TCSno.19- Page: Form User ตรวจปุ่ม BACK เพื่อกลับไปยังหน้าจอ Search Filter!
    [Tags]    pass
    Searchpage ADDUSER-button Click
    UserForm Page-Press BACK button to navigate "Search Filter"

TC10-Search Page_Notification icon
    [Documentation]    TCSno.20-ตรวจสอบ icon notification รูปกระดิ่ง หน้าจอ Search Filter
    [Tags]    pass
    Search Page Notification-icon


TC11-Search Page_Userprofile icon and Logout menu
    [Documentation]    TCSno.21, TCSno.22 ตรวจสอบ icon USER Profile มุมขวาหน้าจอ และเมนู Logout
    [Tags]    pass
    Search Page UserProfile-icon 
    Search Page UserProfile-icon_Logout menu

TCxx-xxxx
    Test Keyword