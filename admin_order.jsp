<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>訂單管理</title>
    <link rel="stylesheet" href="CSS/index_style.css">
</head>
<body>
<header>
    <a href="index.jsp"><img class="logo" src="image/index/logo.png" width="150px" height="50px" name="top"></a>
    <p class="index"><a href="admin.jsp" class="link">回管理頁</a></p>
    <p class="index"><a href="logout.jsp" class="link">登出</a></p>
</header>

<main>
    <h2 style="text-align:center;">訂單總覽</h2>
    <table border="1" cellpadding="8" align="center">
        <tr>
            <th>訂單編號</th>
            <th>會員帳號</th>
            <th>下單時間</th>
            <th>金額</th>
            <th>狀態</th>
        </tr>
    <%
        int count = 0;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/teashop?useSSL=false&serverTimezone=UTC",
                "root", "1234");

            String sql = "SELECT * FROM orders ORDER BY order_date DESC";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                count++;
    %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("user_id").equals("guest") ? "訪客" : rs.getString("user_id") %></td>
            <td><%= rs.getTimestamp("order_date") %></td>
            <td>$<%= rs.getDouble("total_amount") %></td>
            <td><%= rs.getString("status") %></td>
        </tr>
    <%
            }

            if (count == 0) {
                out.println("<tr><td colspan='5' style='text-align:center;'>⚠️ 目前資料庫連線正常，但尚無訂單資料</td></tr>");
            } else {
                out.println("<tr><td colspan='5' style='text-align:center; color:gray;'>📦 資料筆數：" + count + " 筆</td></tr>");
            }

            rs.close();
            stmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace(); // 印到 console
            out.println("<tr><td colspan='5' style='color:red;'>❌ 資料庫錯誤：" + e.getMessage() + "</td></tr>");
        }
    %>
    </table>
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
