*** Settings ***
Resource    ${CURDIR}/../import.robot

*** Keywords ***
Close pop-up
    ${ButtonClose}    BuiltIn.Run Keyword And Return Status    SeleniumLibrary.Wait Until Element Is Visible    ${closeModal_banner.btn}
    IF  "${ButtonClose}"=="True"
        SeleniumLibrary.Click Element    ${closeModal_banner.btn}
    END

Click accecpt cookie
    common.Click element when ready    ${acceptCookie.btn}

Scroll to book
    common.Element visible when ready    ${book_name.txt}
    SeleniumLibrary.Scroll Element Into View    ${book_name.txt}

Get book name
    [Arguments]    ${quantityBook}
    ${name_list}    BuiltIn.Create List
    FOR    ${index}    IN RANGE    1    ${quantityBook}+1
        ${book_name_list}    common.Get text when ready    (${bookName.txt})[${index}]
        Collections.Append To List   ${name_list}    ${book_name_list}
    END
    [RETURN]    ${name_list}

Add book to cart
    [Arguments]    ${quantityBook}
    common.Element visible when ready    ${book_addCart.btn}
    SeleniumLibrary.Scroll Element Into View    ${book_addCart.btn}
    FOR  ${index}    IN RANGE    1    ${quantityBook}+1
        common.Click element when ready    (${book_addCart.btn})[${index}]
        common.Element visible when ready    ${alert_addCart.txt}
        common.Element not visible when ready    ${alert_addCart.txt}
    END