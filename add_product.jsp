<%@ page contentType="text/html; charset=UTF-8" language="java" session="true" %>
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>新增商品</title>
    <link rel="stylesheet" href="CSS/index_style.css">
</head>
<body>
    <header>
        <a href="index.jsp"><img src="image/index/logo.png" width="150px" height="50px"></a>
        <p><a href="product_manage.jsp">回商品管理</a></p>
    </header>

    <main>
        <h2>➕ 新增商品</h2>
        <form action="add_product_action.jsp" method="post">
            商品名稱：<input type="text" name="name" required><br>
            商品說明：<textarea name="description" rows="3" cols="30" required></textarea><br>
            價格（元）：<input type="number" name="price" step="0.01" required><br>
            庫存數量：<input type="number" name="stock" required><br>
            圖片路徑：<input type="text" name="image" placeholder="例如：image/product_image/drink_1.png"><br>
            <input type="submit" value="新增商品">
        </form>
    </main>
</body>
</html>
