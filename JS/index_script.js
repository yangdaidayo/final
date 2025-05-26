let number = 0;
const images = document.querySelectorAll(".control");
const total = images.length;
const time = 3000;

function showImage(index) {
    images.forEach((img, i) => {
        img.classList.remove("active");
        if (i == index) {
            img.classList.add("active");
        }
    });
} 

function showNextImage() {
    number = (number < total - 1) ? number + 1 : 0;
    showImage(number);
}

function autoPlay() {
    showNextImage();
    setTimeout(autoPlay, time);
}

showImage(number);
setTimeout(autoPlay, time);