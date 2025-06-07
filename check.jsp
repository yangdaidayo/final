<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="java.sql.*, java.security.MessageDigest" %>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");

    // 驗證輸入
    if (id == null || pwd == null || id.trim().isEmpty() || pwd.trim().isEmpty()) {
%>
    <script>
        alert("請勿輸入空白帳號或密碼！");
        window.location.href = "login.html";
    </script>
<%
        return;
    }

    // 密碼 SHA-256 加密
    MessageDigest md = MessageDigest.getInstance("SHA-256");
    byte[] hash = md.digest(pwd.getBytes("UTF-8"));
    StringBuilder hexString = new StringBuilder();
    for (byte b : hash) {
        String hex = Integer.toHexString(0xff & b);
        if (hex.length() == 1) hexString.append('0');
        hexString.append(hex);
    }
    String hashedPwd = hexString.toString();

    // 資料庫連線設定
    String url = "jdbc:mysql://localhost:3306/members?useSSL=false&serverTimezone=Asia/Taipei";
    String dbUser = "root";
    String dbPwd = "1234";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, dbUser, dbPwd);

    // 查詢帳密
    String sql = "SELECT * FROM users WHERE id = ? AND pwd = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, id);
    stmt.setString(2, hashedPwd);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
        session.setAttribute("login", true);
        session.setAttribute("userId", id);

        if ("test".equalsIgnoreCase(id)) {
            session.setAttribute("isAdmin", true);
        } else {
            session.setAttribute("isAdmin", false);
        }

        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new java.util.ArrayList<String>());
        }
%>
    <script>
        <% if ("test".equalsIgnoreCase(id)) { %>
            alert("登入成功，歡迎 <%= id %>！（管理者模式）");
        <% } else { %>
            alert("登入成功，歡迎 <%= id %>！");
        <% } %>
        window.location.href = "index.jsp";
    </script>
<%
    } else {
%>
    <script>
        alert("帳號或密碼錯誤！");
        window.location.href = "login.html";
    </script>
<%
    }

    rs.close();
    stmt.close();
    conn.close();
%>

