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

    String url = "jdbc:mysql://localhost:3306/members?useSSL=false&serverTimezone=Asia/Taipei";
    String dbUser = "root";
    String dbPassword = "1234";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);

    String name = "", phone = "", birth = "", email = "", address = "";

    if (request.getMethod().equalsIgnoreCase("POST")) {
        name = request.getParameter("name");
        phone = request.getParameter("phone");
        birth = request.getParameter("birth");
        email = request.getParameter("email");
        address = request.getParameter("address");

        String updateSql = "UPDATE users SET name=?, phone=?, birth=?, email=?, address=? WHERE id=?";
        PreparedStatement updateStmt = conn.prepareStatement(updateSql);
        updateStmt.setString(1, name);
        updateStmt.setString(2, phone);
        updateStmt.setString(3, birth);
        updateStmt.setString(4, email);
        updateStmt.setString(5, address);
        updateStmt.setString(6, userId);
        updateStmt.executeUpdate();
        updateStmt.close();

        session.setAttribute("updateSuccess", true);
        response.sendRedirect("user.jsp");
        return;
    } else {
        String querySql = "SELECT * FROM users WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(querySql);
        stmt.setString(1, userId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            name = rs.getString("name");
            phone = rs.getString("phone");
            birth = rs.getString("birth");
            email = rs.getString("email");
            address = rs.getString("address");
        }
        rs.close();
        stmt.close();
    }
    conn.close();
%>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>修改會員資料</title>
    <link rel="stylesheet" href="CSS/index_style.css">
</head>
<body>
    <div class="container">
        <h2>修改會員資料</h2>
        <form method="post" action="update.jsp">
            <label>姓名：<input type="text" name="name" value="<%= name %>" required></label><br>
            <label>電話：<input type="text" name="phone" value="<%= phone %>" required></label><br>
            <label>生日：<input type="date" name="birth" value="<%= birth %>"></label><br>
            <label>Email：<input type="email" name="email" value="<%= email %>" required></label><br>
            <label>地址：<input type="text" name="address" value="<%= address %>"></label><br><br>
            <button type="submit">儲存修改</button>
            <button type="button" onclick="location.href='user.jsp'">取消</button>
        </form>
    </div>
</body>
</html>
