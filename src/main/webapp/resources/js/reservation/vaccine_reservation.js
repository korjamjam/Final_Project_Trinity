$(function () {
    // 오늘 날짜 가져오기
    const today = new Date();

    // jQuery UI의 날짜 선택기 설정
    $("#datepicker").datepicker({
        dateFormat: "yy-mm-dd", // 날짜 포맷 설정
        minDate: today, // 오늘 이후 날짜만 선택 가능
        onSelect: function (dateText) {
            $('input[name="vresDate"]').val(dateText); // 선택한 날짜를 입력 필드에 설정
        }
    });

    // 오전/오후 선택 시 시간 옵션 동적 업데이트
    $('#timeOfDaySelect').on('change', function () {
        const timeOfDay = $(this).val();
        const specificTimeSelect = $('#specificTimeSelect');
        specificTimeSelect.empty(); // 기존 옵션 제거

        if (timeOfDay === 'morning') {
            specificTimeSelect.append(new Option('9:00', '09:00'));
            specificTimeSelect.append(new Option('9:30', '09:30'));
            specificTimeSelect.append(new Option('10:00', '10:00'));
            specificTimeSelect.append(new Option('10:30', '10:30'));
            specificTimeSelect.append(new Option('11:00', '11:00'));
            specificTimeSelect.append(new Option('11:30', '11:30'));
        } else if (timeOfDay === 'afternoon') {
            specificTimeSelect.append(new Option('1:00', '13:00'));
            specificTimeSelect.append(new Option('1:30', '13:30'));
            specificTimeSelect.append(new Option('2:00', '14:00'));
            specificTimeSelect.append(new Option('2:30', '14:30'));
            specificTimeSelect.append(new Option('3:00', '15:00'));
            specificTimeSelect.append(new Option('3:30', '15:30'));
            specificTimeSelect.append(new Option('4:00', '16:00'));
            specificTimeSelect.append(new Option('4:30', '16:30'));
            specificTimeSelect.append(new Option('5:00', '17:00'));
            specificTimeSelect.append(new Option('5:30', '17:30'));
        }

        // 시간 선택 필드 표시
        $('#specificTimeSelectContainer').show();
    });
});

// 폼 제출 시 데이터 검증 및 AJAX 요청 처리
$("#reservationForm").submit(function (event) {
    event.preventDefault(); // 기본 폼 제출 방지

    // 성별 값 검증
    const gender = $("input[name='gender']").val();
    if (!gender || !["1", "2", "3", "4"].includes(gender)) {
        alert("올바른 성별을 입력하세요.");
        return;
    }

    // 이메일 값 검증
    const emailLocal = $('#emailLocal').val();
    const emailDomain = $('#emailDomain').val();
    const email = emailLocal + "@" + emailDomain;

    if (!emailLocal || !emailDomain) {
        alert("이메일을 입력하세요.");
        return;
    }
    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        alert("올바른 이메일 형식을 입력하세요.");
        return;
    }

    // 전화번호 값 검증
    const phoneCode = $("#phoneCode").val();
    const phoneNumber = $("#phoneNumber").val();
    const fullPhoneNumber = phoneCode + phoneNumber;
    if (!/^\d{10,11}$/.test(fullPhoneNumber)) {
        alert("올바른 전화번호 형식을 입력하세요 (예: 01012345678).");
        return;
    }

    // 서버로 보낼 데이터 구성
    const formData = $(this).serializeArray();
    formData.push({ name: "fullPhoneNumber", value: fullPhoneNumber });
    formData.push({ name: "email", value: email });

    // AJAX 요청
    $.ajax({
        type: "POST",
        url: "/trinity/vaccineReservation/submitReservationAjax",
        data: formData,
        success: function (response) {
            if (response === "success") {
                alert("예약이 완료되었습니다.");
                window.location.href = "/trinity/main";
            } else {
                alert("잘못 된 입력값이 존재합니다.");
            }
        },
        error: function (xhr) {
            alert("서버와의 통신 중 오류가 발생했습니다.");
        }
    });
});
