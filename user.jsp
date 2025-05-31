<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.sql.*" %>
<%
    Boolean isLoggedIn = (Boolean) session.getAttribute("login");
    String userId = (String) session.getAttribute("userId");

    if (isLoggedIn == null || !isLoggedIn || userId == null) {
%>
    <script>
        alert("請先登入！");
        window.location.href = "login.html";
    </script>
<%
        return;
    }

    Boolean updateSuccess = (Boolean) session.getAttribute("updateSuccess");
    if (updateSuccess != null && updateSuccess) {
        session.removeAttribute("updateSuccess");
    }

    String url = "jdbc:mysql://localhost:3306/members?useSSL=false&serverTimezone=Asia/Taipei";
    String dbUser = "root";
    String dbPassword = "1234";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);

    String sql = "SELECT * FROM users WHERE id = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, userId);
    ResultSet rs = stmt.executeQuery();

    String name = "", phone = "", birth = "", email = "", address = "";

    if (rs.next()) {
        name = rs.getString("name");
        phone = rs.getString("phone");
        birth = rs.getString("birth");
        email = rs.getString("email");
        address = rs.getString("address");
    }

    rs.close();
    stmt.close();
    conn.close();
%>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員中心</title>
    <link rel="stylesheet" href="CSS/index_style.css">
    <link rel="stylesheet" href="CSS/user.css">
    <script type="text/javascript" src="JS/index_script.js"></script>
    <script type="text/javascript" src="JS/user.js"></script>
</head>
<body>
    <header>
        <a href="index.jsp"><img class="logo" src="image/index/logo.png" width="150px" height="50px"></a>
        <p class="index"><a href="product_page.jsp">商品頁面</a></p>
        <p class="index"><a href="about_us.jsp">關於我們</a></p>    
        <p class="cart"><a href="shopping.html">購物車</a></p>
    </header>

    <div class="container">
        <div class="tabs">
            <button class="tab active" onclick="showTab('member-info')">會員中心</button>
            <button class="tab" onclick="showTab('order-status')">訂單狀況</button>
            <button class="tab" onclick="showTab('purchase-history')">購買紀錄</button>
        </div>

        <div id="member-info" class="tab-content active">
            <p><strong>帳號：</strong><%= userId %></p>
            <p><strong>姓名：</strong><%= name %></p>
            <p><strong>電話：</strong><%= phone %></p>
            <p><strong>生日：</strong><%= birth %></p>
            <p><strong>Email：</strong><%= email %></p>
            <p><strong>地址：</strong><%= address %></p>
            <button class="edit-button" onclick="location.href='update.jsp'">修改資料</button>
            <button class="edit-button" onclick="location.href='logout.jsp'">登出</button>
        </div>

        <div id="order-status" class="tab-content">
            <p>目前沒有訂單資料。</p>
        </div>

        <div id="purchase-history" class="tab-content">
            <p>尚無購買紀錄。</p>
        </div>
    </div>

    <script>
        function showTab(tabId) {
            document.querySelectorAll(".tab").forEach(btn => btn.classList.remove("active"));
            document.querySelectorAll(".tab-content").forEach(div => div.classList.remove("active"));
            document.getElementById(tabId).classList.add("active");
            event.target.classList.add("active");
        }
    </script>
</body>
</html>


