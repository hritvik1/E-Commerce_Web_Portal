function add_to_cart(pid, pname, price) {
    let cart = localStorage.getItem("cart");
    if(cart==null) {
        let products = [];
        let product = {productId:pid, productName:pname, productQuantity:1, productPrice:price};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        //console.log("Product is added for the first time");
        showToast("Item Is Added To Cart");
    }
    else {
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item)=>item.productId==pid);
        if(oldProduct) {
            oldProduct.productQuantity = oldProduct.productQuantity+1;
            pcart.map((item)=>{
                if(item.productId==oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }
            })
            localStorage.setItem("cart", JSON.stringify(pcart));
            //console.log("Product quantity is increased");
            showToast(oldProduct.productName+" Quantity Increased, Quantity: "+oldProduct.productQuantity);
        }
        else {
            let product = {productId:pid, productName:pname, productQuantity:1, productPrice:price};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            //console.log("Product is Added");
            showToaast(oldProduct.productName+" Is Added To Cart");
        }     
    }
    update_cart();
}

function update_cart() {
    let cart_str = localStorage.getItem("cart");
    let cart = JSON.parse(cart_str);
    if(cart==null || cart.length==0) {
        console.log("Cart is empty!");
        $(".cart_items").html("(0)");
        $(".card_body").html("<h3>Cart doesn't have any items</h3>");
        $(".checkout_btn").attr('disabled', true);
    }
    else {
        console.log(cart);
        $(".cart_items").html(`(${cart.length})`);
        let table=`
                <table class='table'>
                <thead class='thread-light'>
                    <tr style='text-align: center;'>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
            `;
        let totalPrice = 0;
        cart.map((item)=>{
            table +=`
                <tr style='text-align: center;'>
                    <td>${item.productName}</td>
                    <td>${item.productPrice}</td>
                    <td>${item.productQuantity}</td>
                    <td>${item.productQuantity*item.productPrice}</td>
                    <td><button class='btn btn-danger btn-sm' onclick='deleteItemFromCart(${item.productId})'>Remove</button></td>
                </tr>
            `
            totalPrice+=item.productPrice*item.productQuantity;
        })
        table = table+`
            <tr>
                <td colspan='5' class='text-right font-weight-bold m-5'>Total Price: ${totalPrice}</td>
            </tr>
        </table>`
        
        $(".card_body").html(table);
         $(".checkout_btn").attr('disabled', false);
    }
}

function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    let new_cart = cart.filter((item) =>item.productId!=pid);
    localStorage.setItem('cart', JSON.stringify(new_cart));
    update_cart();
    showToast("Item Is Removed From Cart");
}

$(document).ready(function (){
    update_cart()
})

function showToast(content) {
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 2000);
}

function to_Checkout() {
    window.location = "checkout.jsp";
}