<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경 결과</title>
    <script>
        window.onload = function() {
            const successMessage = "<%= request.getAttribute("success") %>";
            const errorMessage = "<%= request.getAttribute("error") %>";
            const redirectUrl = "<%= request.getAttribute("redirectUrl") %>";

            if (successMessage) {
                alert(successMessage);
                if (redirectUrl) {
                    window.location.href = redirectUrl; // 마이페이지로 리다이렉트
                }
            } else if (errorMessage) {
                alert(errorMessage);
                window.history.back(); // 이전 페이지로 이동
            }
        };
    </script>
</head>
<body>
</body>
</html>
