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
        <form action="search.jsp" method="get" class="search" autocomplete="off">
            <input type="text" name="keyword" size="15" placeholder="請輸入關鍵字" />
            <button type="submit">搜尋</button>
        </form>
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
            <img src="image/about_us/member_1.jpg" class="pic">
            <p class="text">
                大家好 我是資管二乙 曾奕銘<br>
                在這次的網頁程式設計期末專案中，我主要負責的部分包括登入控制、會員加入功能與資料隱碼處理。<br>
                整個開發過程中我遇到了不少挑戰，例如登入功能異常、留言無法即時顯示、排版錯位等問題。不過我沒有因此放棄，而是持續透過上網查資料、參考教學 PPT、請教同學並反覆嘗試修改程式碼，最終逐步解決問題，並讓功能能夠順利運作。<br>
                這次的專案雖然過程繁瑣且需要投入大量時間與心力，但當系統成功完成、畫面如預期呈現時，我真的感到非常有成就感。<br>
                透過這段經歷，我對 HTML、JavaScript 以及 MySQL 等技能有了更深入的理解，也提升了實作能力與除錯技巧。<br>
                不僅如此，我也體會到團隊合作與溝通的重要性，這對我來說不只是一次課堂作業，更是一段難得的成長經驗。也因此更確定自己未來想持續往資訊技術領域發展，很高興有機會修習這門課，收穫滿滿！
            </p>
        </section>
        <section>
            <img src="image/about_us/member_2.png" class="pic">
            <p class="text">
                我是心理三乙的楊宇程，本次期末專案負責的部分是留言板、訪客計數器和隨機廣告的部分。<br>
                這次專案的製作對我來說難度頗大，我之前並沒有上過關於資料庫、Java的課程，我只有修過關於多媒體程式設計的課程，所以聽這門課的時候很吃力。<br>
                這些也反應到了專案上，我這次花了很多時間在翻閱老師的ppt和找一些資料，去學習如何去連結後端，撰寫資料庫等。<br>
                不過這也讓我學會如何把前端的部分補上後端，讓網頁能夠做更多的事情。而不是單純的將網頁的所有部份給寫死，能與網頁的訪客有更多的互動。<br>
                這次的報告也讓我學到一些資料命名的重要性，這會很大的影響後期維護程式或是修改的效率，這是我之前做專案時沒有遇過的。
            </p>
        </section>
        <section>
            <img src="image/about_us/member_3.jpg" class="pic">
            <p class="text">
            我是資管二乙簡瑞奇，在這次的專題小組報告中，我主要負責將商品頁面、首頁、商品單頁、購物車與搜尋功能連接後端的部分。<br>
            在一開始的開發過程中，遇到了一些前端相關的問題，例如在 Tomcat 上輸入網址時，若檔名中有空格會自動轉換為 %20，這常常導致檔案無法正確載入，因此我們後來統一更新了檔案名稱，以避免此問題。<br>
            另外，在小組整合的過程中也出現了檔案重複或衝突的情況，為了解決這些問題，我們嘗試了多次，進行了不少調整與測試。<br>
            儘管過程中遇到不少挑戰，但我認為這次專題讓我學到了很多關於後端開發的實作經驗，例如 JSP 與 MySQL 的整合、如何處理資料傳遞與頁面渲染等，讓我對後端的工作內容有了更深入的了解，也覺得非常有趣。<br>
            希望未來還能繼續深入學習相關技術，提升自己的實作能力。
            </p>
        </section>
    </main>
</body>
</html>
