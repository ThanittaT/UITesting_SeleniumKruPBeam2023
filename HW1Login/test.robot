*** Settings ***
Library  SeleniumLibrary

*** Test Cases **
TC01-test
    Open Browser    https://www.google.com/    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5s
