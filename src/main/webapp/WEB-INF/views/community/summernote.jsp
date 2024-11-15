<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>

            <!-- include libraries(jQuery, bootstrap) -->
            <script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
            <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
            <script type="text/javascript"
                src="http://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

            <!-- include summernote css/js-->

            <link
                href="${ pageContext.servletContext.contextPath }/resources/css/community/summernote/summernote-bs5.min.css"
                rel="stylesheet">
            <script
                src="${ pageContext.servletContext.contextPath }/resources/css/community/summernote/summernote-bs5.min.js"></script>
            <link rel="stylesheet"
                href="${ pageContext.servletContext.contextPath }/resources/css/community/custom_summernote.css">
            <link href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css"
                rel="stylesheet">
        </head>

        <body>
            <!-- Header Section -->
            <header>
                <%@ include file="/WEB-INF/views/common/main_header.jsp" %>
            </header>
            <div class="content-container">
                <div class="top-bar">
                    <div class="post-title-section">
                        <h1>게시판 글쓰기</h1>
                    </div>
                    <div class="post-action-section">
                        <button class="white-button">임시등록 | 0</button>
                        <button type="button" class="round-button" onclick="goToPostDetail()">등록</button>
                    </div>
                </div>
                <hr>
                <div class="post-wrapper">
                   <form method="post" action="${pageContext.request.contextPath}/community/summernote" class="post-form">

                        <!-- Hidden input for USER_ID -->
                        <input type="hidden" name="userNo" value="${loginUser.userId}">
                        <!-- 카테고리, 제목, 내용 등 게시글 관련 정보 입력 -->
                        <div class="post-form-container">
                            <div class="post-form-header">
                                <select class="post-category-select">
                                    <option>자유게시판</option>
                                    <option>메디톡</option>
                                    <option>이벤트게시판</option>
                                </select>
                                <select class="post-tag-select">
                                    <option>말머리 선택</option>
                                    <option>말머리 선택</option>
                                    <option>말머리 선택</option>
                                    <option>말머리 선택</option>
                                </select>
                            </div>
                            <input type="text" name="title" placeholder="제목을 입력해 주세요." class="post-title-input">
                        </div>

                        <div class="spacer"></div> <!-- 여백을 추가하기 위한 요소 -->
                        <!-- 내용 입력(Summernote) -->
                        <textarea id="summernote" name="content" class="post-textarea"></textarea>
                        <div class="button-container">
                            <input type="submit" value="작성완료" class="round-button">
                        </div>
                    </form>
                </div>
            </div>
            <script>
                $(document).ready(function () {
                    function initializeSummernote() {
                        const isPc = !window.matchMedia("(max-width: 768px)").matches;

                        $('#summernote').summernote({
                            height: isPc ? 450 : 400, // 모바일 버전 높이
                            width: isPc ? 800 : '100%', // 모바일 버전 너비
                            placeholder: '글을 입력하세요.',
                            tabsize: 2,
                            toolbar: [
                                ['style', ['style']],
                                ['font', ['bold', 'underline', 'clear']],
                                ['color', ['color']],
                                ['para', ['ul', 'ol', 'paragraph']],
                                ['table', ['table']],
                                ['insert', ['link', 'picture', 'video']],
                                ['view', ['fullscreen', 'codeview', 'help']]
                            ],
                            callbacks: {
                                onImageUpload: fileUpload
                            }
                        });

                    }

                    initializeSummernote();
                    $(window).resize(initializeSummernote); // 창 크기 변경 시 다시 초기화
                });

                function changeCategory(category) {

                    let tagSelect = document.querySelector("#post-tag-select");
                    tagSelect.innerHTML = ""; //비움


                    switch (category) {
                        case "자유게시판":
                            tagSelect.innerHTML = `<option>친목</option>
										   <option>유머</option>
										   <option>꿀팁</option>`;
                            break;
                        case "메디톡":
                            tagSelect.innerHTML = `<option>질문</option>
										   <option>정보</option>`;
                            break;
                        case "이벤트게시판":
                            tagSelect.innerHTML = `<option>관리자</option>
										   <option>우리동네소식</option>
										   <option>꿀팁</option>`;
                            break;
                    }
                }

                // 이미지 업로드 처리 함수
                function fileUpload(files) {
                    const fd = new FormData();
                    for (let file of files) {
                        fd.append("fileList", file);
                    }

                    insertFile(fd, function (nameList) {
                        for (let name of nameList) {
                            $("#summernote").summernote("insertImage", "/etc/resources/img/" + name);
                        }
                    });
                }

                function insertFile(data, callback) {
                    $.ajax({
                        url: "upload",
                        type: "POST",
                        data: data,
                        processData: false,
                        contentType: false,
                        dataType: "json",
                        success: function (res) {
                            callback(res);
                        },
                        error: function () {
                            console.log("파일업로드 api요청 실패");
                        }
                    });
                }
                function goToPostDetail() {
                    // 등록 버튼 클릭 시 페이지 이동
                    window.location.href = "community_post_detail.jsp";
                }

            </script>


            <!-- Footer -->
            <%@ include file="/WEB-INF/views/common/main_footer.jsp" %>

        </body>

        </html>