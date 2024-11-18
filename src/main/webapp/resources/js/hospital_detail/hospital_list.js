// function checkVisible( element, check = 'above' ) {
//     const viewportHeight = $(window).height(); // Viewport Height
//     const scrolltop = $(window).scrollTop(); // Scroll Top
//     const y = $(element).offset().top;
//     const elementHeight = $(element).height();   
    
//     // 반드시 요소가 화면에 보여야 할경우
//     if (check == "visible") 
//     	return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
        
//     // 화면에 안보여도 요소가 위에만 있으면 (페이지를 로드할때 스크롤이 밑으로 내려가 요소를 지나쳐 버릴경우)
//     if (check == "above") 
//     	return ((y < (viewportHeight + scrolltop)));
// }

// // 리소스가 로드 되면 함수 실행을 멈출지 말지 정하는 변수
// let isVisible = false;

// // 이벤트에 등록할 함수
// const func = function () {
//     if ( !isVisible && checkVisible('#loadingLine') ) {
//         alert("이곳에 ajax 적용");
//         console.log("이곳에 ajax 적용");
        
//         isVisible = true;
//     }
    
//     // 만일 리소스가 로드가 되면 더이상 이벤트 스크립트가 있을 필요가 없으니 삭제
//     isVisible && window.removeEventListener('scroll', func);
// }

// // 스크롤 이벤트 등록
// window.addEventListener('scroll', func);