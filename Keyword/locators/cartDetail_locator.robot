*** Variables ***
${cart_deatil.txt}    //div[@id="cart"]//strong[.="ตะกร้าของฉัน"]
${bookNameCart.txt}    //p[@class="text-date"]/preceding-sibling::p[1]
${deleteBook.btn}    //a[@class="delete-item"]
${confirmDelete.btn}    //button[.="ใช่ ลบรายการ"]
${increase_bookAmount.btn}    id=add
${decrease_bookAmount.btn}    id=sub
${book_priceQuantity.txt}    //p[@class="item-price"]
${book_priceTotal.txt}    id=total_price