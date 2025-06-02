<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" session="true" %>
<%@ page pageEncoding="UTF-8"%>
<%
    String userId = (String) session.getAttribute("userId");
    Boolean isLoggedIn = (Boolean) session.getAttribute("login");
    if (isLoggedIn == null) isLoggedIn = false;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>茶道</title>
    <link rel="stylesheet" href="CSS/index_style.css">
</head>
<body>
    <header>
        <a href="index.jsp"><img class="logo" src="image/index/logo.png" width="150px" height="50px" name="top"></a>
        <p class="search">搜尋欄</p>
        <input type="text" name="search" size="15px" class="search">
        <p class="index"><a href="product_page.jsp" class="link">商品頁面</a></p>
        <p class="index"><a href="about_us.jsp" class="link">關於我們</a></p>
        <% if (isLoggedIn) { %>
            <p class="index"><a href="user.jsp" class="link"><%= userId %> 會員中心</a></p>
            <p class="index"><a href="logout.jsp" class="link">登出</a></p>
        <% } else { %>
            <p class="index"><a href="login.html" class="link">登入/註冊</a></p> 
        <% } %>
        <p class="cart"><a href="shopping.html" class="Link">購物車</a></p>
    </header>

    <nav>
        <div class="image-container">
            <a href="product_page_part/goods_9/drink_9.jsp"><img src="image/index/introduction_1.png" class="control"></a>
            <a href="product_page_part/goods_2/drink_2.jsp"><img src="image/index/introduction_2.png" class="control"></a>
            <a href="product_page_part/goods_4/drink_4.jsp"><img src="image/index/introduction_3.png" class="control"></a>
        </div>
        <script src="JS/index_script.js"></script>
    </nav>

    <%
        // 檢查 Session 中是否已有標記，避免重整頁面時再次計數
        if (session.getAttribute("counted") == null) {
            session.setAttribute("counted", true); // 設定 Session 記錄

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/counter?serverTimezone=UTC";
                Connection con = DriverManager.getConnection(url, "root", "1234");

                if (con.isClosed()) {
                    out.println("連線建立失敗");
                } else {
                    // 讀取目前訪客數
                    String selectSQL = "SELECT NO FROM count";
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery(selectSQL);

                    int visitorCount = 0;
                    if (rs.next()) {
                        visitorCount = rs.getInt("NO");
                    }

                    visitorCount++; // 加 1

                    // 更新訪客數
                    String updateSQL = "UPDATE count SET NO = ?";
                    PreparedStatement pstmt = con.prepareStatement(updateSQL);
                    pstmt.setInt(1, visitorCount);
                    pstmt.executeUpdate();

                    out.println("<h2>您好！您是第 " + visitorCount + " 位貴客！</h2>");

                    rs.close();
                    stmt.close();
                    pstmt.close();
                    con.close();
                }
            } catch (ClassNotFoundException e) {
                out.println("Class 錯誤：" + e.toString());
            } catch (SQLException e) {
                out.println("SQL 錯誤：" + e.toString());
            }
        } else {
            out.println("<h2>歡迎回來！想再購買什麼呢?</h2>");
        }
    %>


    <main>
        <h3>限時特賣</h3>
        <div class="item">
            <a href="product_page_part/goods_1/drink_1.jsp">
                <img src="image/index/goods_1.png" class="goods">
                <div class="text">
                    <h4>楊奇樂無比水果茶</h4>
                    楊桃、奇異果與芭樂的完美碰撞，
                    結合茶香與水果的天然甜味，
                    創造出一款既健康又充滿活力的飲品。
                    這種獨特的混合帶來了多層次的口感和豐富的營養，
                    令人一喝便愛不釋口
                </div>
            </a>
        </div>    
        <div class="item">
            <a href="product_page_part/goods_2/drink_2.jsp">
                <img src="image/index/goods_2.png" class="goods">
                <div class="text">
                    <h4>橙風破浪</h4>
                    融合了新鮮柳橙的清爽酸甜與奶昔的絲滑香濃，
                    將兩種截然不同的風味巧妙地結合在一起，
                    充滿活力和動感的氛圍，
                    為你帶來一種<br>
                    前所未有的口感享受
                </div>
            </a>
        </div>
        <div class="item">
            <a href="product_page_part/goods_3/drink_3.jsp">
                <img src="image/index/goods_3.png" class="goods">
                <div class="text">
                    <h4>莓果沁檸</h4>
                    覆盆子的酸甜與檸檬的清新交織在一起，<br>
                    每一口都充滿了大自然狂歡的味道，<br>
                    帶你體驗一場清涼透心的夏日探險吧<br>
                </div>
            </a>
        </div>

        <h3>熱門商品</h3>
        <div class="item">
            <a href="product_page_part/goods_7/drink_7.jsp">
                <img src="image/index/goods_4.png" class="goods">
                <div class="text">
                    <h4>琥珀之輝</h4>
                    選用斯里蘭卡錫蘭紅茶茶葉，
                    其色澤為清澈明亮的琥珀色，
                    帶有一種清香與淡淡的煙燻味，
                    滑順清爽的口感中略帶一些微微的酸味，
                    其獨特的氣味十分受歡迎。
                </div>
            </a>
        </div>
        <div class="item">            
            <a href="product_page_part/goods_8/drink_8.jsp">
                <img src="image/index/goods_5.png" class="goods">
                <div class="text">
                    <h4>午後時光</h4>
                    一個寧靜的午後，
                    何不坐下來，手裡拿著一杯由新鮮牛奶
                    與錫蘭紅茶沖泡而成的鮮奶茶，
                    與三五好友一起，享受這悠閒的午後時光呢?
                </div>
            </a>
        </div>
        <div class="item">
            <a href="product_page_part/goods_9/drink_9.jsp">
                <img src="image/index/goods_6.png" class="goods">
                <div class="text">
                    <h4>1984</h4>
                    靈感源於英國作家喬治·歐威爾筆下的反烏托邦小說——1984。
                    咖啡豆採用羅布斯塔咖啡豆，其口感較為苦澀，
                    其顏色與口感反映了書中黑暗且充滿苦難的環境，
                    且咖啡裡加入了些許書中主角常喝的琴酒，增添了些許不同的風味。 <br>
                    “We shall meet in the place where there is no darkness.”
                </div>
            </a>
        </div>  
    </main>
    <%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        try {
            String url="jdbc:mysql://localhost/?serverTimezone=UTC";
            Connection con=DriverManager.getConnection(url,"root","1234");
            if(con.isClosed())
            out.println("連線建立失敗");
            else
            {        
            String sql="USE `ad`";
            ResultSet rs;
            con.createStatement().execute(sql);
            Random ran=new Random();
            int current_adid=ran.nextInt(5)+1;

            sql="SELECT * FROM `ads` WHERE `adid`= " + current_adid;
            rs=con.createStatement().executeQuery(sql);

            while (rs.next())
            {
             out.println("<a href='https://"+rs.getString(4)+"' target = '_blank'>");
             out.println("<img src='"+rs.getString(2)+"/"+rs.getString(3)+"'");
             out.println(" alt='"+rs.getString(5)+"' width = '20%' height = '20%'></a><br>");
           }
        }

            con.close();
        }
        catch (SQLException sExec) {
            out.println("SQL錯誤"+sExec.toString());
        }
    }
    catch (ClassNotFoundException err) {
    out.println("class錯誤"+err.toString());
    }
    %>
    
    <footer>
        <h4>聯絡資訊:</h4>
        <p>電話:0912-345-678 電子信箱:<a href="mailto:Chadao@gmail.com" target="_blank">Chadao@gmail.com</a></p>
        <h4>追蹤我們:</h4>
        <p>
            <a href="https://www.facebook.com/CYCU.PR/?locale=zh_TW" target="_blank"><img src="image/index/fb.png" class="media"></a>
            <a href="https://twitter.com/X" target="_blank"><img src="image/index/x.jpg" class="media"></a>
            <a href="https://www.instagram.com/cycu_tw/" target="_blank"><img src="image/index/ig.png" class="media"></a>
        </p>
        © 2025 茶道 版權所有
    </footer>

    <div class="top"><a href="#top"><img src="image/index/top.png" width="130px" height="130px"></a></div>
</body>
</html>