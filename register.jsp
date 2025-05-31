<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.security.MessageDigest" %>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String birth = request.getParameter("birth");
    String address = request.getParameter("address");
    String email = id; // 直接使用 id 作為 email

    if (id == null || pwd == null || id.trim().isEmpty() || pwd.trim().isEmpty()) {
%>
    <script>
        alert("帳號或密碼不可為空");
        window.location.href = "login_up.html";
    </script>
<%
        return;
    }

    // 密碼加密 SHA-256
    MessageDigest md = MessageDigest.getInstance("SHA-256");
    byte[] hash = md.digest(pwd.getBytes("UTF-8"));
    StringBuilder hexString = new StringBuilder();
    for (byte b : hash) {
        String hex = Integer.toHexString(0xff & b);
        if (hex.length() == 1) hexString.append('0');
        hexString.append(hex);
    }
    String hashedPwd = hexString.toString();

    // 資料庫連線
    String url = "jdbc:mysql://localhost:3306/members?useSSL=false&serverTimezone=Asia/Taipei";
    String user = "root";
    String password = "1234";

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, user, password);

    // 判斷帳號是否已存在
    PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
    checkStmt.setString(1, id);
    ResultSet rs = checkStmt.executeQuery();

    if (rs.next()) {
%>
    <script>
        alert("此帳號已被註冊！");
        window.location.href = "login_up.html";
    </script>
<%
    } else {
        String sql = "INSERT INTO users (id, pwd, name, phone, birth, email, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        stmt.setString(2, hashedPwd);
        stmt.setString(3, name);
        stmt.setString(4, phone);
        stmt.setString(5, birth);
        stmt.setString(6, email);
        stmt.setString(7, address);
        stmt.executeUpdate();
        stmt.close();
%>
    <script>
        alert("註冊成功！請登入");
        window.location.href = "login.html";
    </script>
<%
    }
    rs.close();
    checkStmt.close();
    conn.close();
%>


