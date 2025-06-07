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

    String customerName = request.getParameter("customerName");
    String phone = request.getParameter("phone");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String payment = request.getParameter("payment");

    boolean isMember = (session.getAttribute("account") != null);
    String userId = isMember ? (String) session.getAttribute("account") : "guest";

    int subtotal = 0;
    boolean hasOrder = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

        // 讀取所有商品
        String sql = "SELECT id, name, price, quantity FROM products";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            int price = rs.getInt("price");

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
            int discountedSubtotal = isMember ? (int)(subtotal * 0.95) : subtotal;
            int total = discountedSubtotal + shippingFee;

            // ✅ 嘗試寫入 orders 資料表
            String insertOrder = "INSERT INTO orders (user_id, total_amount) VALUES (?, ?)";
            try (PreparedStatement insertStmt = conn.prepareStatement(insertOrder)) {
                insertStmt.setString(1, userId);
                insertStmt.setInt(2, total); // 可改 setDouble(2, total)
                int affectedRows = insertStmt.executeUpdate();

                if (affectedRows > 0) {
                    out.println("<p style='color:green;'>✅ 寫入訂單成功</p>");
                } else {
                    out.println("<p style='color:red;'>❌ 沒有寫入任何資料</p>");
                }
            } catch (Exception e) {
                out.println("<p style='color:red;'>❌ 寫入失敗：" + e.getMessage() + "</p>");
            }

            // 顯示訂單總結資訊
            out.println("<hr>");
            out.println("<p>小計: NTD " + subtotal + "</p>");
            if (isMember) {
                out.println("<p style='color:green;'>會員折扣 95 折後: NTD " + discountedSubtotal + "</p>");
            }
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
        out.println("<p style='color:red;'>系統錯誤：" + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
<br><a href="index.jsp">回首頁</a>
</body>
</html>
