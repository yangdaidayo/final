<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String description = request.getParameter("description");
    String priceStr = request.getParameter("price");
    String stockStr = request.getParameter("stock");
    String image = request.getParameter("image");

    // 檢查欄位是否填寫
    if (name == null || description == null || priceStr == null || stockStr == null ||
        name.trim().isEmpty() || description.trim().isEmpty() ||
        priceStr.trim().isEmpty() || stockStr.trim().isEmpty()) {
        return;
    }

    // 預設圖片處理
    if (image == null || image.trim().isEmpty()) {
        image = "image/product_image/default.png";
    }

    try {
        double price = Double.parseDouble(priceStr);
        int stock = Integer.parseInt(stockStr);

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/teashop?useSSL=false&serverTimezone=UTC",
            "root", "1234"
        );

        String sql = "INSERT INTO products (name, description, price, quantity, image_path, category_id, product_page) " +
                     "VALUES (?, ?, ?, ?, ?, 1, 'product_page_part/goods_9/drink_9.jsp')";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, name);
        pstmt.setString(2, description);
        pstmt.setDouble(3, price);
        pstmt.setInt(4, stock);
        pstmt.setString(5, image);

        pstmt.executeUpdate();
        pstmt.close();
        conn.close();
%>
    <script>
        alert("✅ 商品新增成功！");
        window.location.href = "product_manage.jsp";
    </script>
<%
    } catch (Exception e) {
%>
    <p>❌ 發生錯誤：<%= e.getMessage() %></p>
<%
    }
%>
