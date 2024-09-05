*** Settings ***
Resource    ${CURDIR}/../import.robot

*** Keywords ***
Input book name
    [Arguments]    ${bookName}
    common.Input text when ready    ${search.input}   ${bookName}

Enter search book name
    SeleniumLibrary.Press Keys    ${search.input}    ENTER

Click dropdown search
    [Arguments]    ${searchBookName}
    common.Click element when ready    ${search_drowdown.btn}/span[.="${searchBookName}"]

Click cart
    common.Click element when ready    ${cart.btn}

Verify quantity on cart
    [Arguments]    ${quantityBook}
    ${cartNow}    common.Get text when ready    ${cartBadge.txt}
    ${cartNow_int}    BuiltIn.Convert To Integer    ${cartNow}
    BuiltIn.Should Be Equal    ${cartNow_int}    ${quantityBook}