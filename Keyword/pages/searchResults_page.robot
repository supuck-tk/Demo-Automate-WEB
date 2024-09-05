*** Settings ***
Resource    ${CURDIR}/../import.robot

*** Keywords ***
Verify search results not found
    [Arguments]    ${msg_notFound}
    ${searchResult}    common.Get text when ready    ${search_notFound.txt}
    BuiltIn.Should Be Equal    ${searchResult}    ${msg_notFound}

Verify search results
    [Arguments]    ${searchBookName}
    ${searchResult}    common.Get text when ready    ${search_results.txt}
    BuiltIn.Should Be Equal    ${searchResult}    ${searchBookName}