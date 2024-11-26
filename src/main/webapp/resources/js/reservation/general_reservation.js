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
      inline: true,
      onSelect: function(gReservation_date) {
        $("input[name='gReservation_date']").val(gReservation_date);
        var hiddenValue = document.getElementById("gReservation_date").value;
        console.log(hiddenValue);
        }
    });

    const timeList = document.querySelectorAll(".reservation_time li");
    for(timeLi of timeList) {
        timeLi.onclick = timeSelectFunk;
    }
  });

  function timeSelectFunk(ev){
    const timeLi = ev.target;
    console.log(timeLi.dataset.time);
    const timeValue = timeLi.dataset.time
    $("input[name='resTime']").val(timeValue);
    $("li").css("border", "none");
    $(timeLi).css({
        border: "2px solid #007BFF", // 원하는 색상으로 변경 가능
        borderRadius: "4px", // 선택적으로 둥글게
    });
  }

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

function isYouCheckChange(checked){
  
    const userNameInput = document.getElementById("userName");
    const birthdayInput = document.getElementById("birthday");
    const userNoInput = document.getElementById("userNo");
    const phoneInput = document.getElementById("phone");
    const emailInput = document.getElementById("email");

    if (checked) {
        // 체크되면 세션의 loginUser 정보로 입력 필드를 채움
        userNameInput.value = userNameInput.dataset.checkvalue;
        birthdayInput.value = birthdayInput.dataset.checkvalue.substr(0,10);
        userNoInput.value = userNoInput.dataset.checkvalue;
        phoneInput.value = phoneInput.dataset.checkvalue;
        emailInput.value = emailInput.dataset.checkvalue;
        const genderValue = $("#gender").data("checkvalue"); // data-checkvalue에서 가져옴
        if (genderValue) {
            $("#gender").val(genderValue); // <select>에서 해당 값 선택
        }
        console.log(userNoInput.dataset.checkvalue);
    } else {
        // 체크 해제 시 입력 필드를 비움
        userNameInput.value = "";
        birthdayInput.value = "";
        phoneInput.value = "";
        emailInput.value = "";
        $("#gender").val("select");
    }

}