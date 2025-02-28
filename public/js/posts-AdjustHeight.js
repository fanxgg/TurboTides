window.onload = function() {
    // 获取图片和内容容器
    var img = document.querySelector('.media-container img');
    var content = document.querySelector('.content-container');

    // 检查图片和内容容器是否存在
    if (img && content) {
        // 设置内容容器的最小高度为图片的高度
        content.style.minHeight = img.clientHeight + 'px';
    }
};