<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>楊奇樂無比水果茶</title>
    <link rel="stylesheet" href="../../CSS/each_goods.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <nav>
                <a href="../../index.jsp"><img class="logo" src="../../image/index/logo.png" width="150px" height="50px" name="top"></a>
                <p class="search">搜尋欄</p>
                <input type="text" name="search" size="15px" class="search">
                <p class="index"><a href="../../index.jsp" class="link">Home</a></p>
                <p class="index"><a href="../../about_us.jsp" class="link">關於我們</a></p>
                <p class="index"><a href="../../login.html" class="link">登入/註冊</a></p>
                <p class="cart"><a href="../../shopping.jsp" class="Link">購物車</a></p>
            </nav>
        </div>
        <div class="product-details">
            <img src="../../image/product_image/drink_1.png" alt="楊奇樂無比水果茶">
            <div class="product-info">
                <h2>楊奇樂無比水果茶</h2>
                <p>NT$55</p>
                <p class="spe">楊桃、奇異果與芭樂的完美碰撞，結合茶香與水果的天然甜味，創造出一款既健康又充滿活力的飲品。這種獨特的混合帶來了多層次的口感和豐富的營養，令人一喝便愛不釋口</p>
            </div>
            <a href="../../product_page.jsp"><button class="back-button">返回商品頁面</button></a>
            
            <div class="quantity-selector">
                <h4>購買數量：</h4>
                <input type="number" value="1" min="1">
            </div>
            <button class="add-to-cart">加入購物車</button>
        </div>

        <div class="reviews">
            <h2>商品評論</h2>
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
                    sql="USE `board`";
                    con.createStatement().execute(sql);
            %>
            <form name="form1" method="get" action="add.jsp">
                <label for="rating">評分（1~5分）：</label><br>
                <input type="number" id="rating" name="rating" min="1" max="5" required>
                <br>
                <label for="review">評論：</label><br>
                <textarea id="review" name="review" rows="4" cols="50" required></textarea>
                <br>
                <input type="submit" name="submit" value="提交評論">
                <input type="Reset" name="reset" value="重新填寫">
            </form>
            
            
            <div id="reviews-list">
                <h3>現有評論：</h3>
                <%
                    sql="SELECT COUNT(*) FROM `goods_1`";
                    ResultSet rs=con.createStatement().executeQuery(sql);

                    rs.next();
                    int total_content=Integer.parseInt(rs.getString(1));
                    
                    out.println("共"+total_content+"筆留言<p>");
                    
                    String page_string = request.getParameter("page");
                    if (page_string == null) 
                        page_string = "0";          
                    int current_page=Integer.valueOf(page_string);
                    if(current_page==0)
                        current_page=1;

                    int start_record=(current_page-1)*5;

                    sql="SELECT * FROM `goods_1` ORDER BY `GBNO` DESC LIMIT ";
                    sql+=start_record+",5";

                    rs=con.createStatement().executeQuery(sql);
                    while(rs.next())
                            {
                            out.println("<li><br>");
                            out.println(""+rs.getString(4)+"<strong>");
                            out.println("顧客"+rs.getString(1)+"");
                            out.println("評分:"+rs.getString(2)+"-</strong>");
                            out.println(""+rs.getString(3)+"</li>");
                    }

                    int page_num=(int)Math.ceil((double)total_content/5.0);
                    out.println("請選擇頁數");
                    for(int i=1;i<=page_num;i++)
                        out.print("<a href='drink_1.jsp?page="+i+"'>"+i+"</a>&nbsp;");
                    out.println("<p>");
                    con.close();
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
            </div>
        </div>
    </div>
</body>
</html>