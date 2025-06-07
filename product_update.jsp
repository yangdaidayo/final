<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    String priceStr = request.getParameter("price");
    String stockStr = request.getParameter("stock");
    String image = request.getParameter("image");

    if (id == null || name == null || description == null || priceStr == null || stockStr == null ||
        id.trim().isEmpty() || name.trim().isEmpty() || description.trim().isEmpty() ||
        priceStr.trim().isEmpty() || stockStr.trim().isEmpty()) {
%>
    <script>
        alert("請確認所有欄位均已填寫！");
        window.history.back();
    </script>
<%
        return;
    }

    try {
        double price = Double.parseDouble(priceStr);
        int stock = Integer.parseInt(stockStr);

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/teashop?useSSL=false&serverTimezone=UTC",
            "root", "1234");

        String sql = "UPDATE products SET name=?, description=?, price=?, quantity=?, image_path=? WHERE id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, description);
        pstmt.setDouble(3, price);
        pstmt.setInt(4, stock);
        pstmt.setString(5, image);
        pstmt.setInt(6, Integer.parseInt(id));

        pstmt.executeUpdate();
        pstmt.close();
        conn.close();
%>
    <script>
        alert("✅ 商品修改成功！");
        window.location.href = "product_list.jsp";

    </script>
<%
    } catch (Exception e) {
        out.println("❌ 錯誤：" + e.getMessage());
    }
%>
