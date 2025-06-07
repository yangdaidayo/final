<%@ page contentType="text/html; charset=UTF-8" language="java" session="true" %>
<%@ page import="java.sql.*" %>
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
    <title>編輯／刪除商品｜茶道管理</title>
    <link rel="stylesheet" href="CSS/index_style.css">
    <link rel="stylesheet" href="CSS/login_up.css">
</head>
<body>
    <header>
        <a href="index.jsp"><img class="logo" src="image/index/logo.png" width="150px" height="50px"></a>
        <p class="index"><a href="product_manage.jsp" class="link">返回商品管理</a></p>
        <p class="index"><a href="logout.jsp" class="link">登出</a></p>
    </header>

    <main>
        <div class="loginup">
            <h2>📋 商品總覽（編輯／刪除）</h2>
            <table border="1" cellpadding="8" cellspacing="0" style="width:90%; margin:auto;">
                <tr>
                    <th>商品編號</th>
                    <th>名稱</th>
                    <th>價格</th>
                    <th>庫存</th>
                    <th>操作</th>
                </tr>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/teashop?useSSL=false&serverTimezone=UTC",
                            "root", "1234"
                        );
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM products");

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td>$<%= rs.getDouble("price") %></td>
                    <td><%= rs.getInt("quantity") %></td>
                    <td>
                        <a href="product_edit.jsp?id=<%= rs.getInt("id") %>">✏ 編輯</a>

                        <a href="product_delete.jsp?id=<%= rs.getInt("id") %>" onclick="return confirm('確定要刪除這項商品嗎？')">🗑 刪除</a>
                    </td>
                </tr>
                <%
                        }

                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        out.println("<tr><td colspan='5'>錯誤：" + e.getMessage() + "</td></tr>");
                    }
                %>
            </table>
        </div>
    </main>

    <footer>
        <h4>聯絡資訊:</h4>
        <p>電話:0912-345-678 電子信箱:<a href="mailto:Chadao@gmail.com" target="_blank">Chadao@gmail.com</a></p>
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

