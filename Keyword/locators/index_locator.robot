*** Variables ***
# option
${closeModal_banner.btn}    //a[@onclick="CloseModal()"]
${acceptCookie.btn}    //a[@onclick="AcceptCookie()"]
# normal page
${book_name.txt}    //div[contains(@class , "card-detail")]//following-sibling::h5[@class="detail-title"]    #First order
${book_price.txt}    //div[@class="nev-price"]//following-sibling::h5[contains (@class , "pr") ]    #First order
${book_view.btn}    //button[contains (@onclick , "CallDataQuickView")]    #First order
${book_addCart.btn}    //button[@id="quick-cart-button"]    #First order
${alert_addCart.txt}    //div[@id="toast-container"]
# modal detail page
${header_bookName.txt}    //div[@class="modal-content"]//following-sibling::h4/strong
${publisher_name.txt}    //div[@class="modal-content"]//following-sibling::p/a[contains (@href , "publisher")]
${category_name.txt}    //div[@class="modal-content"]//following-sibling::p/a[contains (@href , "categories")]
${detail_addCart.btn}    id=add-to-cart-quickview-button
${close_modal.btn}    //div[@class="modal active"]//following-sibling::a[@class="close-modal"]