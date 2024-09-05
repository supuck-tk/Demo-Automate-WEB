*** Settings ***
Resource    ${CURDIR}/../import.robot

*** Keywords ***
Verify book name on cart
    [Arguments]    ${bookName}    ${quantityBook}
    common.Element visible when ready    ${bookNameCart.txt}
    SeleniumLibrary.Scroll Element Into View    ${bookNameCart.txt}
    FOR    ${index}    IN RANGE    1    ${quantityBook}+1
        ${book_name_list_cart}    SeleniumLibrary.Get Text    (${bookNameCart.txt})[${index}]
        BuiltIn.Should Be Equal    ${book_name_list_cart}    ${bookName[${index}-1]}
    END

Click delete book on cart
    [Arguments]    ${quantityBook}
    FOR    ${index}    IN RANGE    1    ${quantityBook}+1
        common.Click element when ready   ${deleteBook.btn}
        common.Click element when ready    ${confirmDelete.btn}
        BuiltIn.Sleep    1s
    END

Verify Empty Cart
    ${on_cart_now}    common.Get text when ready    ${cartBadge.txt}
    BuiltIn.Should Be Equal    0    ${on_cart_now}

Calculate book price
    [Arguments]    ${quantityBook}
    ${price_list}    BuiltIn.Create List
    FOR    ${index}    IN RANGE    1    ${quantityBook}+1
        ${book_price_list}    common.Get text when ready    (${book_priceQuantity.txt})[${index}]
        ${price_list_number}    BuiltIn.Convert To Number    ${book_price_list}
        Collections.Append To List   ${price_list}    ${price_list_number}
    END
    ${total_price.num}    BuiltIn.Set Variable    0
    FOR     ${index}    IN RANGE    1    ${quantityBook}+1
        ${total_price.num}    Evaluate    ${total_price.num}+${price_list[${index}-1]}
    END
    [RETURN]    ${total_price.num}

Verify total price
    [Arguments]    ${calculate}
    ${total_sum}    common.Get text when ready    ${book_priceTotal.txt}
    ${total_sum.txt}    String.Replace String    ${total_sum}    ,    replace_with=
    ${total_sum.num}    BuiltIn.Convert To Number    ${total_sum.txt}
    BuiltIn.Should Be Equal    ${total_sum.num}    ${calculate}