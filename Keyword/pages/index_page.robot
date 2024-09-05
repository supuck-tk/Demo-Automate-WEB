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
    Sleep    1s

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

Click category book
    [Arguments]    ${categoryName}
    ${goto_category}    String.Replace String    ${category.btn}    +CATEGORY+    ${categoryName}
    common.Element visible when ready    ${goto_category}
    SeleniumLibrary.Scroll Element Into View    ${goto_category}
    common.Click element when ready    ${goto_category}
    Sleep    1s

Click view book detail
    common.Click element when ready    ${book_view.btn}

Verify category book
    [Arguments]    ${categoryName}
    ${current_category}    common.Get text when ready    ${category_name.txt}
    BuiltIn.Should Be Equal    ${current_category}    ${categoryName}

Close modal book detail
    common.Click element when ready    ${close_modal.btn}

Get category amount
    [Arguments]    ${categoryName}
    ${current_categoryAmount}    String.Replace String    ${category_amount.txt}    +CATEGORY+    ${categoryName}
    ${categoryAmount}    common.Get text when ready    ${current_categoryAmount}
    # ${categoryAmount.num}    BuiltIn.Convert To Number    ${categoryAmount}
    [RETURN]    ${categoryAmount}

Verify category total book
    [Arguments]    ${amount}
    common.Element visible when ready    ${pagination.txt}
    SeleniumLibrary.Scroll Element Into View    ${pagination.txt}
    ${current_pagination}    common.Get text when ready    ${pagination.txt}
    ${current_paginationNow}    String.Get Regexp Matches    ${current_pagination}    \\d+
    ${categoryBook_amount}    BuiltIn.Set Variable    ${current_paginationNow[2]}
    BuiltIn.Should Be Equal    ${categoryBook_amount}    ${amount}