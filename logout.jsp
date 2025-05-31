<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
    // 清除登入狀態
    session.invalidate(); // 清除所有 session 資料

    // 導向登入頁或首頁
    response.sendRedirect("login.html"); // 或改成 index.jsp
%>
