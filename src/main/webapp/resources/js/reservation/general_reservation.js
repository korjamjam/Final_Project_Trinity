$(function() {
    // 페이지에 바로 달력이 보이도록 설정
    $("#datepicker").datepicker({
      closeText: "닫기",
      currentText: "오늘",
      prevText: '이전 달',
      nextText: '다음 달',
      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
      weekHeader: "주",
      yearSuffix: '년',
      inline: true
    });

  });

  function openContent(content){
      //this -> 클릭이벤트가 발생한 요소(div)
      // $(this).next(); -> 선택된 요소의 뒤에있는 요소

      const $p = $(content).next();
      if($p.css("display") === "none"){
          //$(".reservation_subject_select_content").slideUp(); // 클래스명을 일치시켜야 동작함
          $p.slideDown();
      } else{
          $p.slideUp();
      }
  }