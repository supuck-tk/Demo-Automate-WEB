*** Settings ***
Resource    ${CURDIR}/../Keyword/import.robot
Test Teardown    Close Browser

*** Test Cases ***
TC_1.1 Test Search Input and Verify Results Not Found
    common.Open web-demo
    index_page.Close pop-up
    index_page.Click accecpt cookie
    navbar_page.Input book name    ${TC_1.data1.bookName}
    navbar_page.Enter search book name
    searchResults_page.Verify search results not found    ${TC_1.data1.msg_notFound}

TC_1.2 Test Search Input and Verify Results
    common.Open web-demo
    index_page.Close pop-up
    index_page.Click accecpt cookie
    navbar_page.Input book name    ${TC_1.data2.bookName}
    navbar_page.Click dropdown search    ${TC_1.data2.bookName}
    searchResults_page.Verify search results    ${TC_1.data2.bookName}

TC_1.3 Test Add Book to Cart and Verify Quantity on Icon Cart
    common.Open web-demo
    index_page.Close pop-up
    index_page.Click accecpt cookie
    index_page.Scroll to book
    index_page.Add book to cart    ${TC_1.data3.quantityBook}
    navbar_page.Verify quantity on cart    ${TC_1.data3.quantityBook}

TC_1.4 Test Add Book to Cart and Verify Book Name on Cart Detail
    common.Open web-demo
    index_page.Close pop-up
    index_page.Click accecpt cookie
    index_page.Scroll to book
    ${booksName}    index_page.Get book name    ${TC_1.data4.quantityBook}
    index_page.Add book to cart    ${TC_1.data4.quantityBook}
    navbar_page.Verify quantity on cart    ${TC_1.data4.quantityBook}
    navbar_page.Click cart
    cartDetail_page.Verify book name on cart    ${booksName}    ${TC_1.data4.quantityBook}

TC_1.5 Test Add Book to Cart and Verify Total Price on Cart
    common.Open web-demo
    index_page.Close pop-up
    index_page.Click accecpt cookie
    index_page.Scroll to book
    index_page.Add book to cart    ${TC_1.data5.quantityBook}
    navbar_page.Verify quantity on cart    ${TC_1.data5.quantityBook}
    navbar_page.Click cart
    ${total_cal}    cartDetail_page.Calculate book price    ${TC_1.data5.quantityBook}
    cartDetail_page.Verify total price    ${total_cal}

TC_1.6 Test Delete Book on Cart and Verify Empty Cart
    common.Open web-demo
    index_page.Close pop-up
    index_page.Click accecpt cookie
    index_page.Scroll to book
    ${booksName}    index_page.Get book name    ${TC_1.data6.quantityBook}
    index_page.Add book to cart    ${TC_1.data6.quantityBook}
    navbar_page.Verify quantity on cart    ${TC_1.data6.quantityBook}
    navbar_page.Click cart
    cartDetail_page.Verify book name on cart    ${booksName}    ${TC_1.data6.quantityBook}
    cartDetail_page.Click delete book on cart    ${TC_1.data6.quantityBook}
    cartDetail_page.Verify Empty Cart