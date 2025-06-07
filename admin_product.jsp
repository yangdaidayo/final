<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String id = request.getParameter("id");
    if (id != null && !id.trim().isEmpty()) {
        response.sendRedirect("product_delete.jsp?id=" + id);
    } else {
        response.sendRedirect("product_manage.jsp"); // 沒有 ID 就回商品管理
    }
%>
