*** Settings ***
Resource    ${CURDIR}/../Keyword/import.robot
Test Teardown    Close Browser

*** Test Cases ***
TC_2.1 Test Click Menu Cartoon and Verify Menu Page
    common.Open web-demo
    index_page.Close pop-up
    index_page.Click accecpt cookie
    sidebar_page.Click menu sidebar    ${TC_2.menuName}
    sidebar_page.Verify menu name    ${TC_2.menuName}

TC_2.2 Test Select Category Book and Verify Catedory Book
    common.Open web-demo
    index_page.Close pop-up
    index_page.Click accecpt cookie
    sidebar_page.Click menu sidebar    ${TC_2.menuName}
    index_page.Click category book    ${TC_2.data2.categoryName}
    index_page.Click view book detail
    index_page.Verify category book    ${TC_2.data2.categoryName}
    index_page.Close modal book detail

TC_2.3 Test Select Category Book and Verify Total Book by Category
    common.Open web-demo
    index_page.Close pop-up
    index_page.Click accecpt cookie
    sidebar_page.Click menu sidebar    ${TC_2.menuName}
    ${amount}    index_page.Get category amount    ${TC_2.data3.categoryName}
    index_page.Click category book    ${TC_2.data3.categoryName}
    index_page.Verify category total book    ${amount}