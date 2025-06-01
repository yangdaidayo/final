<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>茶道 - 忘記密碼</title>
    <link rel="stylesheet" href="CSS/index_style.css">
    <link rel="stylesheet" href="CSS/login.css">
</head>
<body>
    <header>
        <a href="index.jsp"><img class="logo" src="image/index/logo.png" width="150" height="50" alt="茶道 Logo"></a>
        <p class="search">搜尋欄</p>
        <input type="text" name="search" size="15" class="search">
        <p class="index"><a href="product_page.jsp" class="link">商品頁面</a></p>
        <p class="index"><a href="about_us.jsp" class="link">關於我們</a></p> 
        <p class="index"><a href="login.html" class="link">登入/註冊</a></p> 
        <p class="cart"><a href="shopping.html" class="link">購物車</a></p>
    </header>

    <main>
        <div class="login">
            <h2>忘記密碼</h2>
            <form method="post" action="reset_password.jsp">
                <label for="identifier">請輸入註冊帳號或 Email：</label>
                <input type="text" id="identifier" name="identifier" placeholder="帳號或 Email" required><br>

                <input type="submit" value="送出" class="login-btn">
                <div class="su"><a href="login.html"><h5>返回登入頁</h5></a></div>
            </form>
        </div>
    </main>

    <footer>
        <h4>聯絡資訊:</h4>
        <p>電話: 0912-345-678　電子信箱: <a href="mailto:Chadao@gmail.com" target="_blank">Chadao@gmail.com</a></p>
        <h4>追蹤我們:</h4>
        <p>
            <a href="https://www.facebook.com/CYCU.PR/?locale=zh_TW" target="_blank"><img src="image/index/fb.png" class="media" alt="FB"></a>
            <a href="https://twitter.com/X" target="_blank"><img src="image/index/x.jpg" class="media" alt="X"></a>
            <a href="https://www.instagram.com/cycu_tw/" target="_blank"><img src="image/index/ig.png" class="media" alt="IG"></a>
        </p>
        <p>© 2025 茶道 版權所有</p>
    </footer>
</body>
</html>