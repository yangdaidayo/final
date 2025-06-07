<%@ page contentType="text/html; charset=UTF-8" language="java" session="true" %>
<%
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>茶道｜商品管理</title>
    <link rel="stylesheet" href="CSS/index_style.css">
    <link rel="stylesheet" href="CSS/login_up.css">
</head>
<body>
    <header>
        <a href="index.jsp"><img class="logo" src="image/index/logo.png" width="150px" height="50px"></a>
        <p class="index"><a href="admin.jsp" class="link">返回管理者選單</a></p>
        <p class="index"><a href="logout.jsp" class="link">登出</a></p>
    </header>

    <main>
        <div class="loginup">
            <h2>商品管理</h2>

            <div class="sb">
                <form action="add_product.jsp" method="get">
                    <input type="submit" value="➕ 新增商品">
                </form>
                <form action="product_list.jsp" method="get">
                    <input type="submit" value="📋 編輯／刪除商品">
                </form>

                <form action="index.jsp" method="get">
                    <input type="submit" value="🏠 回首頁">
                </form>
            </div>
        </div>
    </main>

    <footer>
        <h4>聯絡資訊:</h4>
        <p>電話:0912-345-678 電子郵箱:<a href="mailto:Chadao@gmail.com" target="_blank">Chadao@gmail.com</a></p>
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

