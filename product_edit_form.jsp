<%@ page contentType="text/html; charset=UTF-8" language="java" session="true" %>
<%@ page import="java.sql.*" %>
<%
    // 管理者檢查
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("index.jsp");
        return;
    }

    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");

    if (id == null || id.trim().isEmpty()) {
        response.sendRedirect("product_list.jsp");
        return;
    }

    String name = "";
    String description = "";
    double price = 0.0;
    int quantity = 0;
    String image = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/teashop?useSSL=false&serverTimezone=UTC",
            "root", "1234"
        );

        String sql = "SELECT * FROM products WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(id));
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            description = rs.getString("description");
            price = rs.getDouble("price");
            quantity = rs.getInt("quantity");
            image = rs.getString("image_path");
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("<p>錯誤：" + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>編輯商品</title>
    <link rel="stylesheet" href="CSS/index_style.css">
    <link rel="stylesheet" href="CSS/login_up.css">
</head>
<body>
    <header>
        <a href="index.jsp"><img class="logo" src="image/index/logo.png" width="150px" height="50px"></a>
        <p><a href="product_list.jsp">← 返回商品列表</a></p>
    </header>

    <main>
        <div class="loginup">
            <h2>✏ 編輯商品</h2>
            <form action="product_update.jsp" method="post">
                <input type="hidden" name="id" value="<%= id %>">
                商品名稱：<input type="text" name="name" value="<%= name %>" required><br>
                商品說明：<textarea name="description" rows="4" cols="30" required><%= description %></textarea><br>
                價格（元）：<input type="number" name="price" step="0.01" value="<%= price %>" required><br>
                庫存數量：<input type="number" name="stock" value="<%= quantity %>" required><br>
                圖片路徑：<input type="text" name="image" value="<%= image %>"><br>
                <div class="sb">
                    <input type="submit" value="確定修改">
                </div>
            </form>
        </div>
    </main>

    <footer>
        <h4>聯絡資訊:</h4>
        <p>電話:0912-345-678 電子信箱:<a href="mailto:Chadao@gmail.com">Chadao@gmail.com</a></p>
        <h4>追蹤我們:</h4>
        <p>
            <a href="https://www.facebook.com/CYCU.PR/" target="_blank"><img src="image/index/fb.png" class="media"></a>
            <a href="https://twitter.com/X" target="_blank"><img src="image/index/x.jpg" class="media"></a>
            <a href="https://www.instagram.com/cycu_tw/" target="_blank"><img src="image/index/ig.png" class="media"></a>
        </p>
        © 2025 茶道 版權所有
    </footer>
</body>
</html>
