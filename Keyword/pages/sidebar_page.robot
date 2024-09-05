*** Settings ***
Resource    ${CURDIR}/../import.robot

*** Keywords ***
Click menu sidebar
    [Arguments]    ${menuName}
    ${goto_sideMenu}    String.Replace String    ${side_menu.btn}    +PAGE+    ${menuName}
    common.Click element when ready    ${goto_sideMenu}

Verify menu name
    [Arguments]    ${menuName}
    ${current_sideMenu}    String.Replace String    ${menu_current.txt}    +PAGE+    ${menuName}
    ${current_sideMenu.txt}    common.Get text when ready    ${current_sideMenu}
    BuiltIn.Should Be Equal    ${current_sideMenu.txt}    ${menuName}