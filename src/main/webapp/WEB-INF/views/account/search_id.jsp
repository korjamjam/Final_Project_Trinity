<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/account/search_id.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<!-- Header -->
<%@ include file="../common/main_header.jsp"%>

<div class="container">
    <h1>아이디 찾기</h1>
    <p>아이디 찾는 방법을 선택해 주세요.</p>

    <div class="accordion">
        <!-- 이메일 인증 방식 -->
        <div class="accordion-item">
            <div class="accordion-header">본인 확인 이메일로 인증</div>
            <div class="accordion-content">
                <form id="emailForm" action="${pageContext.servletContext.contextPath}/member/find_id_email" method="post">
                    <div class="input-group">
                        <label for="name">이름</label>
                        <input type="text" id="name" name="name" placeholder="이름" required>
                    </div>
                    <div class="input-group email-group">
                        <label for="email">이메일 주소</label>
                        <div class="email-inputs">
                            <input type="text" id="email" name="email" placeholder="이메일 입력" required>
                            <span>@</span>
                            <input type="text" name="domain" placeholder="도메인 입력" required>
                            <select class="domain-select" name="domainSelect">
                                <option value="">직접입력</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="naver.com">naver.com</option>
                                <option value="daum.net">daum.net</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="submit-button">다음</button>
                </form>
            </div>
        </div>

        <!-- 휴대전화 인증 방식 -->
        <div class="accordion-item">
            <div class="accordion-header">본인 휴대전화로 인증</div>
            <div class="accordion-content">
                <form id="phoneForm" action="${pageContext.servletContext.contextPath}/member/find_id_phone" method="post">
                    <div class="input-group">
                        <label for="phone-name">이름</label>
                        <input type="text" id="phone-name" name="phoneName" placeholder="이름" required>
                    </div>
                    <div class="input-group">
                        <label for="phone">휴대전화</label>
                        <input type="text" id="phone" name="phone" placeholder="휴대전화" required>
                    </div>
                    <button type="submit" class="submit-button">다음</button>
                </form>
            </div>
        </div>
    </div>

    <!-- 도움 링크 -->
    <p class="footer-text">아이디 찾기 시 문제가 있나요? <a href="#">바로가기</a></p>
</div>

<!-- Footer -->
<%@ include file="../common/main_footer.jsp"%>

<script>
$(document).ready(function() {
    // 아코디언 메뉴 기능
    $(".accordion-header").click(function() {
        $(this).next(".accordion-content").slideToggle();
        $(".accordion-content").not($(this).next()).slideUp();
        $(this).toggleClass("active");
        $(".accordion-header").not($(this)).removeClass("active");
    });

    // 이메일 도메인 선택 기능
    $('.domain-select').change(function() {
        const selectedDomain = $(this).val();
        const domainInput = $(this).siblings("input[name='domain']");
        if (selectedDomain) {
            domainInput.val(selectedDomain).prop("readonly", true);
        } else {
            domainInput.val('').prop("readonly", false);
        }
    });

    // Ajax 요청 처리
    $("form").submit(function(event) {
        event.preventDefault(); // 기본 폼 제출 방지
        const form = $(this);
        const actionUrl = form.attr("action");

        $.ajax({
            url: actionUrl,
            method: "POST",
            data: form.serialize(),
            success: function(response) {
                if (response.status === "success") {
                    alert("사용자의 아이디는: " + response.userId + "입니다.");
                    window.location.href = "${pageContext.servletContext.contextPath}/member/login"; // 로그인 페이지로 이동
                } else if (response.status === "fail") {
                    alert(response.message);
                } else {
                    alert("알 수 없는 오류가 발생했습니다. 다시 시도해주세요.");
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX Error: ", xhr.status, xhr.statusText);
                console.error("Error details: ", error);
                alert("서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
            }
        });
    });
});
</script>
</body>
</html>
