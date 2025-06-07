<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>茶道｜管理者後台</title>
    <link rel="stylesheet" href="CSS/index_style.css">
    <link rel="stylesheet" href="CSS/login_up.css">
</head>
<style>
    .loginup {
        width: 400px;
        margin: 100px auto;
        padding: 30px;
        border: 1px solid #aaa;
        background-color: #f0f0f0;
        text-align: center;
    }

    .sb form {
        margin: 10px 0;
    }

    input[type="submit"] {
        width: 90%;
        padding: 10px;
        font-size: 16px;
        border-radius: 8px;
        cursor: pointer;
    }
</style>
<body>
    <header>
        <a href="index.jsp"><img class="logo" src="image/index/logo.png" width="150px" height="50px" name="top"></a>
        <p class="index"><a href="product_page.jsp" class="link">商品頁面</a></p>
        <p class="index"><a href="about_us.jsp" class="link">關於我們</a></p>
        <p class="index"><a href="logout.jsp" class="link">登出</a></p>
        <p class="cart"><a href="shopping.jsp" class="Link">購物車</a></p>
    </header>

    <main>
        <div class="loginup">
            <h2>管理者功能選單</h2>

            <div class="sb">
                <form action="product_manage.jsp" method="get">
                <input type="submit" value="📦 商品管理">
                </form>

                </form>
                <form action="admin_order.jsp" method="get">
                    <input type="submit" value="📦 訂單總覽">
                </form>
                <form action="index.jsp" method="get">
                    <input type="submit" value="🏠 回首頁">
                </form>
            </div>
        </div>
    </main>

    <footer>
        <h4>聯絡資訊:</h4>
        <p>電話:0912-345-678 電子信箱:<a href="mailto:Chadao@gmail.com" target="_blank">Chadao@gmail.com</a></p>
        <h4>追蹤我們:</h4>
        <p>
            <a href="https://www.facebook.com/CYCU.PR/?locale=zh_TW" target="_blank"><img src="image/index/fb.png" class="media"></a>
            <a href="https://twitter.com/X" target="_blank"><img src="image/index/x.jpg" class="media"></a>
            <a href="https://www.instagram.com/cycu_tw/" target="_blank"><img src="image/index/ig.png" class="media"></a>
        </p>
        © 2025 茶道 版權所有
    </footer>
</body>
</html>
