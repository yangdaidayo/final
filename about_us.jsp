<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String userId = (String) session.getAttribute("userId");
    Boolean isLoggedIn = (Boolean) session.getAttribute("login");
    if (isLoggedIn == null) isLoggedIn = false;
%>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>茶道 - 關於我們</title>
    <link rel="stylesheet" href="CSS/aboutus_style.css">
</head>
<body>
    <header>
        <a href="index.jsp"><img class="logo" src="image/index/logo.png" width="150" height="50" alt="茶道 Logo"></a>
        <p class="search">搜尋欄</p>
        <input type="text" name="search" size="15" class="search">
        <p class="index"><a href="index.jsp" class="link">Home</a></p>
        <p class="index"><a href="product_page.jsp" class="link">商品頁面</a></p>
        <% if (isLoggedIn) { %>
            <p class="index"><a href="user.jsp" class="link"><%= userId %> 會員中心</a></p>
            <p class="index"><a href="logout.jsp" class="link">登出</a></p>
        <% } else { %>
            <p class="index"><a href="login.html" class="link">登入/註冊</a></p>
        <% } %>
        <p class="cart"><a href="shopping.html" class="Link">購物車</a></p>
    </header>

     <main>
        <section>
            <img src="image/Tea.jpg" class="pic">
            <p class="text">
                "茶道"的品牌理念是透過精心挑選和推廣優質的飲品，
                讓現代人享受傳統與創新交織的茶飲文化。
                我們致力於傳播茶道精神，不僅是提供一杯飲品，
                更是提供一種生活方式，讓每位顧客在繁忙的日常中找到寧靜與平衡。
            </p>
        </section>
        <section>
            <img src="image/about_us/member_1.png" class="pic">
            <p class="text">
                大家好，我是就讀會計系2年級的陳玟錚，
                在這次多媒體期末專案中負責商品頁面及商品評論留言版的部分，
                在製作網頁過程中雖然覺得很困難，也花了很多時間不斷修改，
                但透過不斷查資料和參考別人如何製作網頁，讓我對網頁製作開始有一些熟悉度和概念，
                深刻體會到要製作一個網頁出來是蠻不容易的，但也很開心能修到這門課，
                讓我有了一個小小的程式技能。
            </p>
        </section>
        <section>
            <img src="image/about_us/member_2.png" class="pic">
            <p class="text">
                我是心理二乙的楊宇程，本次期末專案負責的部分是主頁和關於我們的部分。
                這是我第一次與他人一同製作程式專案，其製作的複雜程度比起其中專案難上不少。 <br>
                不過也因為此次的製作讓我學到許多期中專案與課堂中沒學到的東西，
                像是一些程式碼的語法，因為期末專案要求的東西與我們想要製作的效果比較複雜，
                所以需要大量的查找資料，學習新的事物，也是一次挺新鮮的經驗。 <br>
                這次也學到了一些排版的技巧，跟其他組員討論之後，
                才發現原來有辦法利用一些技巧來讓網頁看起來更簡潔。 <br>
                我也學到了一些溝通與討論的方法，專案中有許多的東西需要進行討論，
                如版面配置與網頁的細節等，如何有效率地去討論出來，也是本次學到的東西。
            </p>
        </section>
        <section>
            <img src="image/about_us/member_3.png" class="pic">
            <p class="text">
                大家好我是資管系 大四的林優子 
                在這次的期末專案是設計購物車和登入/註冊，
                我們花了很多時間溝通，也問了許多的同學，他們給了許多不同的意見。
                另外我也想在用額外的時間多學一些更多的軟體相關知識
            </p>
        </section>
    </main>
</body>
</html>
