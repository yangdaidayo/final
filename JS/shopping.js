// 用物件存每個商品的價錢
const prices = {}; // key: 商品id, value: 商品價格

// 初始化價格物件（可透過 JSP 產生）
function setPrice(id, price) {
    prices[id] = price;
}

function incrementQuantity(itemId) {
    const quantityElement = document.getElementById(itemId + '-quantity');
    let quantity = parseInt(quantityElement.value);
    quantity++;
    quantityElement.value = quantity;
    updateTotalPrice();
}

function decrementQuantity(itemId) {
    const quantityElement = document.getElementById(itemId + '-quantity');
    let quantity = parseInt(quantityElement.value);
    if (quantity > 0) {
        quantity--;
        quantityElement.value = quantity;
        updateTotalPrice();
    }
}

function updateTotalPrice() {
    let subtotal = 0;
    for (const id in prices) {
        const qty = parseInt(document.getElementById(id + '-quantity').value) || 0;
        subtotal += prices[id] * qty;
    }
    const shippingFee = subtotal > 0 ? 60 : 0;  // 有買才收運費
    const total = subtotal + shippingFee;

    document.getElementById('subtotal').innerText = '小計: NTD ' + subtotal;
    document.getElementById('shippingFee').innerText = '運費: NTD ' + shippingFee;
    document.getElementById('total').innerText = '總計: NTD ' + total;
}
