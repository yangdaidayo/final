<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8" />
    <title>茶道-購物車</title>
    <link rel="stylesheet" href="CSS/shopping.css" />
    <link rel="stylesheet" href="CSS/index_style.css" />
    <script type="text/javascript" src="JS/shopping.js"></script>
</head>
<body>
    <header>
        <a href="index.jsp"><img class="logo" src="image/index/logo.png" width="150" height="50" alt="logo" /></a>
        <!-- 其他導覽列... -->
        <p class="cart"><a href="shopping.jsp" class="Link">購物車</a></p>
    </header>

    <main>
        <h1>茶道</h1>

        <form method="post" action="order.jsp">
            <div class="shopping-cart">
                <%
                    String jdbcURL = "jdbc:mysql://localhost:3306/teashop?useSSL=false&serverTimezone=UTC";
                    String dbUser = "root";
                    String dbPass = "1234";

                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

                        String sql = "SELECT id, name, price, image_path, quantity FROM products ORDER BY id";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            String id = rs.getString("id");
                            String name = rs.getString("name");
                            int price = rs.getInt("price");
                            String imagePath = rs.getString("image_path");
                            int quantity = rs.getInt("quantity");
                %>
                <div class="cart-item">
                    <img src="<%= imagePath %>" alt="<%= name %>" class="item-image" />
                    <div class="item-details">
                        <h2><%= name %></h2>
                        <p>NTD <%= price %></p>
                        <p>庫存: <%= quantity %> 件</p>
                    </div>
                    <input type="button" value="-" onclick="decrementQuantity('<%= id %>')" />
                    <!-- 這裡要有 name，讓數量能送出 -->
                    <input type="text" id="<%= id %>-quantity" name="<%= id %>" value="0" readonly style="width: 30px; text-align:center;" />

                    <input type="button" value="+" onclick="incrementQuantity('<%= id %>')" />
                </div>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<p>商品載入錯誤: " + e.getMessage() + "</p>");
                    } finally {
                        if (rs != null) try { rs.close(); } catch (Exception e) {}
                        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
                        if (conn != null) try { conn.close(); } catch (Exception e) {}
                    }
                %>
            </div>

            <div class="order-summary">
                <h3>預訂資料填寫</h3>
                <p>姓名：<input type="text" name="customerName" required /></p>
                <p>電話：<input type="text" name="phone" required /></p>
                <p>拿取日期：<input type="date" name="date" required /></p>
                <p>拿取時間：<input type="time" name="time" required /></p>
                <p>付款方式：<input type="text" name="payment" required /></p>
            </div>

            <div class="payment-summary">
                <h3>付款金額</h3>
                <p id="subtotal">小計: NTD 0</p>
                <p id="shippingFee">運費: NTD 60</p>
                <p id="total">總計: NTD 0</p>
                <button type="button" onclick="location.href='index.html'">繼續購買</button>
                <input type="submit" value="確認訂單" />
            </div>
        </form>
    </main>

    <footer>
        <!-- footer 內容 -->
    </footer>

<script>
    // 你之前的增減數量 JS 範例
    function incrementQuantity(id) {
        const qtyInput = document.getElementById(id + '-quantity');
        let qty = parseInt(qtyInput.value);
        qtyInput.value = qty + 1;
        updateTotal();
    }
    function decrementQuantity(id) {
        const qtyInput = document.getElementById(id + '-quantity');
        let qty = parseInt(qtyInput.value);
        if (qty > 0) {
            qtyInput.value = qty - 1;
            updateTotal();
        }
    }

    function updateTotal() {
        const products = document.querySelectorAll('.cart-item');
        let subtotal = 0;

        products.forEach(item => {
            const priceText = item.querySelector('.item-details p').textContent;
            const price = parseInt(priceText.replace('NTD ', ''));
            const id = item.querySelector('input[type=text]').id.replace('-quantity', '');
            const qty = parseInt(document.getElementById(id + '-quantity').value);
            subtotal += price * qty;
        });

        document.getElementById('subtotal').textContent = '小計: NTD ' + subtotal;
        const shippingFee = subtotal > 0 ? 60 : 0;
        document.getElementById('shippingFee').textContent = '運費: NTD ' + shippingFee;
        document.getElementById('total').textContent = '總計: NTD ' + (subtotal + shippingFee);
    }

    // 初始化總計
    updateTotal();
</script>
</body>
</html>
