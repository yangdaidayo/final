<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>商品清單｜茶道</title>
    <link rel="stylesheet" href="CSS/index_style.css">
</head>
<body>
    <h2>📋 商品清單</h2>
    <table border="1">
        <tr>
            <th>ID</th><th>名稱</th><th>價格</th><th>操作</th>
        </tr>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/teashop?useSSL=false&serverTimezone=UTC", 
            "root", "1234"
        );

        String sql = "SELECT * FROM products";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            int pid = rs.getInt("id");
            String pname = rs.getString("name");
            double pprice = rs.getDouble("price");
%>
        <tr>
            <td><%= pid %></td>
            <td><%= pname %></td>
            <td><%= pprice %></td>
            <td>
                <a href="product_edit_form.jsp?id=<%= pid %>">✏ 編輯</a>
                <a href="product_delete.jsp?id=<%= pid %>" onclick="return confirm('確定刪除？')">❌ 刪除</a>
            </td>
        </tr>
<%
        }
        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("錯誤：" + e.getMessage());
    }
%>
    </table>
</body>
</html>
