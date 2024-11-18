<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 수정</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/account/profile_edit.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>

    <!-- Header -->
    <%@ include file="../common/main_header.jsp" %>

    <div class="layout-container">
        <!-- Sidebar -->
        <aside class="profile-sidemenu">
            <%@ include file="../account/mysidebar.jsp" %>
        </aside>

        <!-- Main Content -->
        <main class="profile-container">
            <h2>개인정보</h2>
            <form id="profile-form" action="${pageContext.request.contextPath}/member/update_profile" method="post" enctype="multipart/form-data">
                <div class="profile-picture">
                    <img id="profile-preview" 
                         src="${pageContext.servletContext.contextPath}/resources/img/profile.png" 
                         alt="프로필 사진">
                    <label for="profile-upload" class="upload-button">사진 변경</label>
                    <input type="file" id="profile-upload" name="profileImage" accept="image/*" onchange="previewImage(event)" hidden>
                </div>

                <div class="input-group">
                    <label>이름</label> 
                    <input type="text" name="name" value="${loginUser.userName}" disabled>
                </div>
                <div class="input-group">
                    <label>생년월일</label> 
                    <input type="date" name="birthdate" value="${formattedBirthday}" disabled>
                </div>
                <div class="input-group">
                    <label>이메일</label> 
                    <input type="email" name="email" value="${loginUser.email}" disabled>
                </div>
                <div class="input-group">
                    <label>성별</label> 
                    <input type="text" name="gender" value="${loginUser.gender}" disabled>
                </div>
                <div class="input-group">
                    <label>주소</label> 
                    <input type="text" name="address" value="${loginUser.address}" disabled>
                </div>

                <!-- 수정 활성화/저장 버튼 -->
                <button type="button" id="edit-save-button" class="edit-button" onclick="toggleEditSave()">수정 활성화</button>
            </form>

            <!-- 비밀번호 변경 버튼 -->
            <button type="button" class="password-change" onclick="location.href='${pageContext.request.contextPath}/member/search_pwd'">비밀번호 변경하기</button>
        </main>
    </div>

    <!-- Footer -->
    <%@ include file="../common/main_footer.jsp" %>

    <script>
        // 이미지 미리보기
        function previewImage(event) {
            const reader = new FileReader();
            reader.onload = function () {
                const preview = document.getElementById('profile-preview');
                preview.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }

        let isEditing = false; // 수정 상태 변수

        // 수정 활성화 및 저장 동작
        function toggleEditSave() {
            const button = document.getElementById('edit-save-button');
            const form = document.getElementById('profile-form');
            const editableFields = document.querySelectorAll('input[name="name"], input[name="email"], input[name="address"]');

            if (!isEditing) {
                // 수정 활성화 상태
                editableFields.forEach(input => {
                    input.disabled = false; // 필드 활성화
                    input.style.backgroundColor = '#fff'; // 수정 가능 상태 표시
                });
                button.textContent = "저장하기"; // 버튼 텍스트 변경
            } else {
                // 저장 상태
                form.submit(); // 폼 제출
                disableAllFields(); // 필드 비활성화
            }

            isEditing = !isEditing; // 상태 전환
        }

        // 모든 필드 비활성화
        function disableAllFields() {
            const allFields = document.querySelectorAll('input, select');
            allFields.forEach(field => {
                field.disabled = true; // 필드 비활성화
                field.style.backgroundColor = '#f9f9f9'; // 비활성화된 상태 표시
            });

            // 버튼 초기화
            const button = document.getElementById('edit-save-button');
            button.textContent = "수정 활성화";
            isEditing = false;
        }
    </script>
</body>
</html>
