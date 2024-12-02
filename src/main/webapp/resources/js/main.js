// var swiper = new Swiper(".swiper-container", {
//     loop: true,
//     cssMode: true,
//     autoplay: {
//         delay: 3000,                    // 자동재생
//         disableOnInteraction: false     // 사용자 상호 작용 후에도 자동 재생 유지
//     },
//     speed: 500,
//     navigation: {
//       nextEl: ".swiper-button-next",
//       prevEl: ".swiper-button-prev",
//     },
//     pagination: {
//       el: '.swiper-pagination',
//         type: 'bullets'
//     },
//     effect: 'fade',
//     keyboard: true,
//   });

window.onload = function(){
    var swiper = new Swiper(".mySwiper", {
        loop: true,
        cssMode: true,
        // autoplay: {
        //     delay: 6000,                    // 자동재생
        //     disableOnInteraction: false     // 사용자 상호 작용 후에도 자동 재생 유지
        // },
        speed: 500,
        centeredSlides: "true",
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        pagination: {
          el: ".swiper-pagination",
        },
        mousewheel: true,
        keyboard: true,
      });
}