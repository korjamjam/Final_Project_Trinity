function checkLogin(){
    location.href = "${pageContext.request.contextPath}/reservation/form"
}
document.addEventListener("DOMContentLoaded", function() {

    if (alertMsg) { 
        alert(alertMsg);
    }
});

const mySwiper = new Swiper('.swiper-container', {
    direction: 'horizontal',
    loop: true,
    autoplay: {
        delay: 3000
    },
    speed: 500,
    pagination: {
        el: '.swiper-pagination',
        type: 'bullets'
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    effect: 'fade',
});