<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" session="true" %>
<%
    String userId = (String) session.getAttribute("userId");
    Boolean isLoggedIn = (Boolean) session.getAttribute("login");
    if (isLoggedIn == null) isLoggedIn = false;
%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>茶道</title>
    <link rel="stylesheet" href="CSS/goods.css">
    <script>
        function showAlertIfNotLoggedIn() {
            alert("請先登入才能加入購物車。");
        }
    </script>
</head>
<body>
    <header>
        <a href="index.jsp"><img class="logo" src="image/index/logo.png" width="150" height="50" alt="茶道 Logo"></a>
        <p class="search">搜尋欄</p>
        <input type="text" name="search" size="15" class="search">
        <p class="index"><a href="product_page.jsp" class="link">商品頁面</a></p>
        <p class="index"><a href="about_us.jsp" class="link">關於我們</a></p>
        <% if (isLoggedIn) { %>
            <p class="index"><a href="user.jsp" class="link"><%= userId %> 會員中心</a></p>
            <p class="index"><a href="logout.jsp" class="link">登出</a></p>
        <% } else { %>
            <p class="index"><a href="login.html" class="link">登入/註冊</a></p>
        <% } %>
        <p class="cart"><a href="shopping.jsp" class="Link">購物車</a></p>
    </header>


    <main>
        <section class="product-category">
            <h2 id="type1">夏日水果清涼系列</h2>
            <div class="product-filters">
                <a href="#type2"><button>小清新系列</button></a>
                <a href="#type3"><button>經典系列</button></a>
            </div>
            <div class="products">
                <div class="product-card">
                    <a href="product_page_part/goods_1/drink_1.jsp"><img src="image/product_image/drink_1.png" alt="楊奇樂無比水果茶"></a>
                    <div class="product-info">
                        <h3>楊奇樂無比水果茶</h3>
                        <p>NT$55</p>
                        <p>楊桃、奇異果與芭樂的完美碰撞，結合茶香與水果的天然甜味，創造出一款既健康又充滿活力的飲品。這種獨特的混合帶來了多層次的口感和豐富的營養，令人一喝便愛不釋口</p>
                    </div>
                </div>
                <div class="product-card">
                    <a href="product_page_part/goods_2/drink_2.jsp"><img src="image/product_image/drink_2.png" alt="橙風破浪"></a>
                    <div class="product-info">
                        <h3>橙風破浪</h3>
                        <p>NT$50</p>
                        <p>融合了新鮮柳橙的清爽酸甜與奶昔的絲滑香濃，將兩種截然不同的風味巧妙地結合在一起，充滿活力和動感的氛圍，為你帶來一種前所未有的口感享受</p>
                    </div>
                </div>
                <div class="product-card">
                    <a href="product_page_part/goods_3/drink_3.jsp"><img src="image/product_image/drink_3.png" alt="覆果好檸"></a>
                    <div class="product-info">
                        <h3>覆果好檸</h3>
                        <p>NT$65</p>
                        <p>覆盆子的酸甜與檸檬的清新交織在一起，每一口都充滿了大自然狂歡的味道，帶你體驗一場清涼透心的夏日探險吧</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="product-category">
            <h2 id="type2">小清新系列</h2>
            <div class="product-filters">
                <a href="#type1"><button>夏日水果清涼系列</button></a>
                <a href="#type3"><button>經典系列</button></a>
            </div>
            <div class="products">
                <div class="product-card">
                    <a href="product_page_part/goods_4/drink_4.jsp"><img src="image/product_image/drink_4.png" alt="柚香綠茶"></a>
                    <div class="product-info">
                        <h3>柚香綠茶</h3>
                        <p>NT$30</p>
                        <p>柚香綠茶是一款專為清新自然愛好者設計的飲品。每一杯柚香綠茶都仿佛是自然的禮物，讓你在忙碌的都市生活中，找到一個安靜的角落，享受大自然的美好</p>
                    </div>
                </div>
                <div class="product-card">
                    <a href="product_page_part/goods_5/drink_5.jsp"><img src="image/product_image/drink_5.png" alt="蜜桃烏龍茶"></a>
                    <div class="product-info">
                        <h3>蜜桃烏龍茶</h3>
                        <p>NT$35</p>
                        <p>蜜桃烏龍茶是夏日午後的甜美驚喜。每一口蜜桃烏龍茶都像是走進了一片蜜桃果園，微風中彌漫著果香和茶韻，讓你不禁心生愉悅，感受大自然的甜美</p>
                    </div>
                </div>
                <div class="product-card">
                    <a href="product_page_part/goods_6/drink_6.jsp"><img src="image/product_image/drink_6.png" alt="薄荷檸檬冰茶"></a>
                    <div class="product-info">
                        <h3>薄荷檸檬冰茶</h3>
                        <p>NT$45</p>
                        <p>薄荷檸檬冰茶是夏日最清涼的救星。每一杯薄荷檸檬冰茶都像是一段夏日的冒險旅程，帶你從炎熱的都市穿越到清涼的綠洲，享受那片刻的清新和愉悅</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="product-category">
            <h2 id="type3">經典系列</h2>
            <div class="product-filters">
                <a href="#type1"><button>夏日水果清涼系列</button></a>
                <a href="#type2"><button>小清新系列</button></a>
            </div>
            <div class="products">
                <div class="product-card">
                    <a href="product_page_part/goods_7/drink_7.jsp"><img src="image/product_image/drink_7.png" alt="琥珀之輝"></a>
                    <div class="product-info">
                        <h3>琥珀之輝</h3>
                        <p>$NT$40</p>
                        <p>選用斯里蘭卡錫蘭紅茶茶葉，其色澤為清澈明亮的琥珀色，帶有一種清香與淡淡的煙燻味，滑順清爽的口感中略帶一些微微的酸味，其獨特的氣味十分受歡迎</p>
                    </div>
                </div>
                <div class="product-card">
                    <a href="product_page_part/goods_8/drink_8.jsp"><img src="image/product_image/drink_8.png" alt="午後時光"></a>
                    <div class="product-info">
                        <h3>午後時光</h3>
                        <p>NT$45</p>
                        <p>一個寧靜的午後，何不坐下來，手裡拿著一杯由新鮮牛奶與錫蘭紅茶沖泡而成的鮮奶茶，與三五好友一起，享受這悠閒的午後時光呢?</p>
                    </div>
                </div>
                <div class="product-card">
                    <a href="product_page_part/goods_9/drink_9.jsp"><img src="image/product_image/drink_9.png" alt="1984"></a>
                    <div class="product-info">
                        <h3>1984</h3>
                        <p>NT$55</p>
                        <p>靈感源於英國作家喬治·歐威爾筆下的反烏托邦小說——1984。咖啡豆採用羅布斯塔咖啡豆，其口感較為苦澀，其顏色與口感反映了書中黑暗且充滿苦難的環境，且咖啡裡加入了些許書中主角常喝的琴酒，增添了些許不同的風味<br>
                            “We shall meet in the place where there is no darkness.”</p>
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>
</html>


