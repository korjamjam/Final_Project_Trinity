<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
        href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
    <link rel="stylesheet"
        href="${ pageContext.servletContext.contextPath }/resources/css/inquiry/inquiry_qna_write.css">

    <title>Customer Center</title>
</head>

<body>

    <div class="main-page">
        <!-- Header Section -->
        <header>
            <%@ include file="/WEB-INF/views/common/main_header.jsp"%>
        </header>

        <div class="container">
            <!-- Sidebar Menu -->
            <aside class="sidebar">
                <%@ include file="/WEB-INF/views/inquiry/inquiry_sidemenu.jsp"%>
            </aside>

            <!-- Main Content Section -->
            <main class="main-content">
                <!-- Inquiry Form Section -->
                <section class="inquiry-form">
                    <h2 class="form-title">1:1 문의</h2>
                    <form action="submitInquiry" method="post" enctype="multipart/form-data">
                        <!-- Inquiry Type -->
                        <div class="form-group">
                            <label for="inquiryType">문의 유형</label> 
                            <select id="inquiryType" name="inquiryType">
                                <option value="회원/정보관리">회원/정보관리</option>
                                <option value="사이트이용">사이트이용</option>
                                <option value="커뮤니티">커뮤니티</option>
                                <option value="이벤트">이벤트</option>
                                <option value="예약">예약</option>
                            </select>
                        </div>

                        <!-- Title -->
                        <div class="form-group">
                            <label for="title">제목</label> 
                            <input type="text" id="title" name="title" maxlength="50" placeholder="제목을 입력하세요" required />
                            <span class="char-count" id="title-count">0/50</span>
                        </div>

                        <!-- Content -->
                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea id="content" name="content" rows="10" maxlength="1000" placeholder="내용을 입력하세요" required></textarea>
                            <span class="char-count" id="content-count">0/1000</span>
                        </div>

                        <!-- File Attachment -->
                        <div class="form-group">
                            <label for="attachment">첨부파일</label> 
                            <input type="file" id="attachment" name="attachment" />
                        </div>

                        <!-- Notification Option -->
                        <div class="form-group">
                            <label>답변 등록 알림</label>
                            <div class="checkbox-container">
                                <label for="emailNotification" class="checkbox-label">이메일 수신</label> 
                                <input type="checkbox" id="emailNotification" name="emailNotification" />
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="form-buttons">
                            <button type="button" class="cancel-button">취소</button>
                            <button type="submit" class="submit-button">저장</button>
                        </div>
                    </form>
                </section>
            </main>
        </div>
    </div>

    <footer>
        <%@ include file="/WEB-INF/views/common/main_footer.jsp"%>
    </footer>

    <script>
        window.onload = function(){
            const titleInput = document.getElementById("title");
            const titleCount = document.getElementById("title-count");
    
            const contentInput = document.getElementById("content");
            const contentCount = document.getElementById("content-count");
    
            titleInput.onkeyup = function(event){
                const currentLength = event.target.value.length;
                console.log("Current Length (title):", currentLength); // 콘솔에 글자 출력
                titleCount.innerHTML = currentLength  + `/50`; // 화면에 글자 출력
            }
            contentInput.onkeyup =function(event){
                const currentLength = event.target.value.length;
                console.log("Current Length (content):", currentLength); // 콘솔에 글자 출력
                contentCount.innerHTML = currentLength  + `/1000`; // 화면에 글자 출력
            }
        };
    </script>
    

</body>
</html>