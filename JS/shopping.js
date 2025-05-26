function incrementQuantity(item) {
    var quantityElement = document.getElementById(item + '-quantity');
    var quantity = parseInt(quantityElement.value);
    quantity++;
    quantityElement.value = quantity;
    updateTotalPrice();
}


function decrementQuantity(item) {
    var quantityElement = document.getElementById(item + '-quantity');
    var quantity = parseInt(quantityElement.value);
    if (quantity > 0) {
        quantity--;
        quantityElement.value = quantity;
        updateTotalPrice();
    }
}


function updateTotalPrice() {
    var greenTeaPrice = 45; // 柚香綠茶單價
    var peachOolongPrice = 70; // 蜜桃烏龍茶單價
    var mintLemonPrice = 60; // 薄荷檸檬冰茶單價
    var greenTeaQuantity = parseInt(document.getElementById('greenTea-quantity').value);
    var peachOolongQuantity = parseInt(document.getElementById('peachOolong-quantity').value);
    var mintLemonQuantity = parseInt(document.getElementById('mintLemon-quantity').value);
    var subtotal = (greenTeaPrice * greenTeaQuantity) + (peachOolongPrice * peachOolongQuantity) + (mintLemonPrice * mintLemonQuantity);
    var shippingFee = 60; // 運費
    var total = subtotal + shippingFee;

    document.getElementById('subtotal').innerText = '小計: NTD ' + subtotal;
    document.getElementById('shippingFee').innerText = '運費: NTD ' + shippingFee;
    document.getElementById('total').innerText = '總計: NTD ' + total;
}