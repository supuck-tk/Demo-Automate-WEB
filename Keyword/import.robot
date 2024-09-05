*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
#features
#locators
Resource    ${CURDIR}/locators/index_locator.robot
Resource    ${CURDIR}/locators/navbar_locator.robot
Resource    ${CURDIR}/locators/sidebar_locator.robot
Resource    ${CURDIR}/locators/cartDetail_locator.robot
Resource    ${CURDIR}/locators/searchResults_locator.robot
#pages
Resource    ${CURDIR}/common.robot
Resource    ${CURDIR}/pages/index_page.robot
Resource    ${CURDIR}/pages/navbar_page.robot
Resource    ${CURDIR}/pages/searchResults_page.robot
Resource    ${CURDIR}/pages/cartDetail_page.robot
#testdata
Variables    ${CURDIR}/../Resources/setting/setting.yaml
Variables    ${CURDIR}/../Resources/testdata/data.yaml