<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    // 驗證是否為管理者
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("index.jsp");
        return;
    }

    String id = request.getParameter("id");

    // 驗證 id 是否為數字
    if (id == null || id.trim().isEmpty()) {
%>
    <script>
        alert("❗ 無效的商品編號");
        window.location.href = "product_manage.jsp";
    </script>
<%
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/teashop?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC", 
            "root", "1234");

        String sql = "DELETE FROM products WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(id));

        int rowsAffected = pstmt.executeUpdate();
        pstmt.close();
        con.close();

        if (rowsAffected > 0) {
%>
    <script>
        alert("✅ 商品刪除成功！");
        window.location.href = "product_manage.jsp";
    </script>
<%
        } else {
%>
    <script>
        alert("❌ 找不到指定的商品！");
        window.location.href = "product_manage.jsp";
    </script>
<%
        }
    } catch (Exception e) {
%>
    <script>
        alert("❌ 錯誤發生：<%= e.getMessage() %>");
        window.location.href = "product_manage.jsp";
    </script>
<%
    }
%>
