window.addEventListener('DOMContentLoaded', () => {
    const input = document.getElementById('keywordInput');
    const listDiv = document.getElementById('recentKeywordsList');

    // 顯示下拉清單
    input.addEventListener('focus', () => {
        if (listDiv.querySelectorAll('li').length > 0) {
            listDiv.style.display = 'block';
        }
    });

    // 輸入框失焦後延遲隱藏（防止點擊不觸發）
    input.addEventListener('blur', () => {
        setTimeout(() => {
            listDiv.style.display = 'none';
        }, 200);
    });

    // 點擊下拉選項填入輸入框
    listDiv.querySelectorAll('li').forEach(item => {
        item.addEventListener('mousedown', e => {
            e.preventDefault();
            input.value = e.target.textContent;
            listDiv.style.display = 'none';
        });
    });
});
