*** Settings ***
Resource    ${CURDIR}/../Keyword/import.robot
Suite Teardown    Close Browser

*** Test Cases ***
TC_2.1 Test Click Menu Cartoon and Verify Menu Page
TC_2.2 Test Select Category Book and Verify Catedory Book
TC_2.3 Test Select Category Book and Verify Total Book by Category
TC_2.4 Test Select Publisher of Book and Verify Publisher
TC_2.5 Test Select Publisher of Book and Verify Total Book by Publisher
TC_2.6 Test Select Publisher of Book More then One and Verify Total Book by Publisher