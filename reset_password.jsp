<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String identifier = request.getParameter("identifier");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    String dbURL = "jdbc:mysql://localhost:3306/members";
    String dbUser = "root";
    String dbPass = "1234";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        String sql = "SELECT * FROM users WHERE id = ? OR email = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, identifier);
        stmt.setString(2, identifier);
        rs = stmt.executeQuery();

        if (rs.next()) {
            String newPassword = "abc12345"; // 測試用新密碼
            String updateSql = "UPDATE users SET pwd = SHA2(?, 256) WHERE id = ?";
            PreparedStatement updateStmt = conn.prepareStatement(updateSql);
            updateStmt.setString(1, newPassword);
            updateStmt.setString(2, rs.getString("id"));
            updateStmt.executeUpdate();
            updateStmt.close();

            out.println("密碼已重設為：" + newPassword + "，請盡快登入後修改密碼。");
        } else {
            out.println("查無此帳號或 Email！");
        }

    } catch (Exception e) {
        out.println("錯誤：" + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>