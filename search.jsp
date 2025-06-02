<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>茶道-商品搜尋</title>
    <link rel="stylesheet" href="CSS/goods.css">
</head>
<body>
<header>
    <a href="index.jsp"><img class="logo" src="image/index/logo.png" width="150px" height="50px" name="top"></a>
    <form action="search.jsp" method="get" class="search" autocomplete="off">
        <input type="text" name="keyword" size="15" placeholder="請輸入關鍵字" />
        <button type="submit">搜尋</button>
    </form>
    <p class="index"><a href="product_page.jsp" class="link">商品頁面</a></p>
    <p class="index"><a href="about_us.html" class="link">關於我們</a></p>
    <p class="index"><a href="login.html" class="link">登入/註冊</a></p>
    <p class="cart"><a href="shopping.jsp" class="Link">購物車</a></p>
</header>

<%
    String url = "jdbc:mysql://localhost:3306/teashop?useSSL=false&serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "1234";

    String keyword = request.getParameter("keyword");
    if (keyword == null || keyword.trim().isEmpty()) {
        out.println("<p>請輸入搜尋關鍵字</p>");
        return;
    }

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        // 搜尋商品（名稱、描述、分類名稱）
        String searchSql = "SELECT p.* FROM products p LEFT JOIN category c ON p.category_id = c.id " +
                           "WHERE p.name LIKE ? OR p.description LIKE ? OR c.category_name LIKE ?";
        ps = conn.prepareStatement(searchSql);
        ps.setString(1, "%" + keyword + "%");
        ps.setString(2, "%" + keyword + "%");
        ps.setString(3, "%" + keyword + "%");
        rs = ps.executeQuery();
%>

<h1>搜尋結果：「<%= keyword %>」</h1>
<div class="products">
<%
        boolean found = false;
        while (rs.next()) {
            found = true;
            String name = rs.getString("name");
            String image = rs.getString("image_path");
            double price = rs.getDouble("price");
            String description = rs.getString("description");
            String productPage = rs.getString("product_page");
%>
    <div class="product-card">
        <a href="<%= productPage %>">
            <img src="<%= request.getContextPath() + image %>" alt="<%= name %>">
        </a>
        <div class="product-info">
            <h3><%= name %></h3>
            <p>NT$<%= (int)price %></p>
            <p><%= description %></p>
        </div>
    </div>
<%
        }
        if (!found) {
            out.println("<p>找不到符合的商品。</p>");
        }

        rs.close();
        ps.close();
        conn.close();

    } catch (Exception e) {
        out.println("<p style='color:red;'>發生錯誤：" + e.getMessage() + "</p>");
    }
%>
</div>
</body>
</html>
