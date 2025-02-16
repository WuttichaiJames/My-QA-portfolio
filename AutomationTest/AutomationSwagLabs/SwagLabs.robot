*** Setting ***
Library    SeleniumLibrary
*** Variables ***
${website}    https://www.saucedemo.com/
&{UserPass}    Username=standard_user   Password=secret_sauce
&{CheckOutDetail}    Firstname=James    Lastname=Bond    Postal=12345


*** Keywords ***

Login
    Input Text    css=#user-name    ${UserPass}[Username]
    Input Text    css=#password     ${UserPass}[Password]
    Click Button    css=#login-button
Select Item
    Click Element      css=#add-to-cart-sauce-labs-backpack
    Click Element      css=#shopping_cart_container > a
    Click Element      css=#checkout
Checkout
    Input Text    css=#first-name    ${CheckOutDetail}[Firstname]
    Input Text    css=#last-name     ${CheckOutDetail}[Lastname]
    Input Text    css=#postal-code   ${CheckOutDetail}[Postal]
    Click Button    css=#continue
    Click Button    css= #finish
    Page Should Contain    Thank you for your order!

Logout
    Click Element    css=#react-burger-menu-btn
    Click Element    css=#logout_sidebar_link   
    Page Should Contain    Swag Labs

Sort
    Select From List By Label    css=.product_sort_container    Price (low to high)



*** Test Cases ***
TC-001
    Open Browser    ${website}     browser=chrome  options=add_experimental_option("detach",True) 
    Login
    Select Item
    Checkout

TC-002
    Open Browser    ${website}     browser=chrome  options=add_experimental_option("detach",True) 
    Login
    Sort
    Select Item
    Checkout
    Logout