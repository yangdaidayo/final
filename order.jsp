<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>訂單明細</title>
    <link rel="stylesheet" href="CSS/shopping.css">
</head>
<body>
    <h1>訂單明細</h1>
    <%
        request.setCharacterEncoding("UTF-8");

        String jdbcURL = "jdbc:mysql://localhost:3306/teashop?useSSL=false&serverTimezone=UTC";
        String dbUser = "root";
        String dbPass = "1234";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int subtotal = 0;
        boolean hasOrder = false;

        String customerName = request.getParameter("customerName");
        String phone = request.getParameter("phone");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String payment = request.getParameter("payment");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

            String sql = "SELECT id, name, price, quantity FROM products";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int stock = rs.getInt("quantity");

                String qtyStr = request.getParameter(String.valueOf(id));
                if (qtyStr != null && !qtyStr.isEmpty()) {
                    int qty = Integer.parseInt(qtyStr);

                    if (qty > 0) {
                        hasOrder = true;
                        int totalPrice = price * qty;
                        subtotal += totalPrice;

                        out.println("<p>" + name + " × " + qty + " = NTD " + totalPrice + "</p>");

                        // 減少庫存
                        String updateSql = "UPDATE products SET quantity = quantity - ? WHERE id = ? AND quantity >= ?";
                        try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                            updateStmt.setInt(1, qty);
                            updateStmt.setInt(2, id);
                            updateStmt.setInt(3, qty);
                            int affected = updateStmt.executeUpdate();

                            if (affected == 0) {
                                out.println("<p style='color:red;'>❌ 商品 [" + name + "] 庫存不足，未成功下單！</p>");
                            }
                        }
                    }
                }
            }

            if (hasOrder) {
                int shippingFee = 60;
                int total = subtotal + shippingFee;

                out.println("<hr>");
                out.println("<p>小計: NTD " + subtotal + "</p>");
                out.println("<p>運費: NTD " + shippingFee + "</p>");
                out.println("<p><strong>總計: NTD " + total + "</strong></p>");
                out.println("<hr>");
                out.println("<p>訂購人姓名：" + customerName + "</p>");
                out.println("<p>電話：" + phone + "</p>");
                out.println("<p>取貨日期：" + date + "</p>");
                out.println("<p>取貨時間：" + time + "</p>");
                out.println("<p>付款方式：" + payment + "</p>");
            } else {
                out.println("<p style='color:red;'>您沒有選擇任何商品！</p>");
            }

        } catch (Exception e) {
            out.println("<p>系統錯誤：" + e.getMessage() + "</p>");
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    %>
    <br><a href="index.jsp">回首頁</a>
</body>
</html>
