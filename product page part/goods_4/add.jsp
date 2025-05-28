<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>add</title>
</head>
<body>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    try { 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
            out.println("連線建立失敗");
        else {
            sql="use board";
            con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");  
         String new_rating=request.getParameter("rating");
         String new_review=request.getParameter("review");
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());

           sql="INSERT goods_4 (`Score`, `Content`, `Putdate`) ";
           sql+="VALUES ('" + new_rating+ "', ";
           sql+="'"+new_review+"', ";   
           sql+="'"+new_date+"')";      

           con.createStatement().execute(sql);

           con.close();

           response.sendRedirect("drink 4.jsp?page=1"); 
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>
