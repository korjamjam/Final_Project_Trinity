<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/default.css">
            <link rel="stylesheet"
                href="${ pageContext.servletContext.contextPath }/resources/css/community/community_detail.css">
            <link href="${ pageContext.servletContext.contextPath }/resources/css/common/custom_public.css"
                rel="stylesheet">
            <title>Customer Center</title>
        </head>

        <body>
            <header>
                <%@ include file="/WEB-INF/views/common/main_header.jsp" %>
            </header>
            <div class="board-container-wrapper">
                <div class="board-container">
                    <table class="board-detail">
                        <tr>
                            <td class="board-category">자유게시판</td>
                        </tr>
                        <tr>
                            <td class="board-title">상처에 된장 바르면 치료가 되나요?</td>
                            <td class="board-user-info">jjhim531 일반회원</td>
                        </tr>
                        <tr>
                            <td class="board-meta">
                                <span>2024.11.06 16:18</span> | <span>조회 149</span>
                            </td>
                            <td class="board-meta-actions">
                                <span>1:1 채팅</span> | <span>댓글 3</span>
                            </td>
                        </tr>
                    </table>

                    <div class="board-content-wrapper">
                        <div class="board-content question-content">
                            까스활명수를 냉장보관했는데 실온보관이 낫다고 하더라구요. <br>
                            근데 이미 냉장고에 넣었는데 지금이라도 꺼내서 실온보관 할까요.? 냉장고에 넣은지 꽤 됐어요<br>
                            까스활명수를 냉장보관했는데 실온보관이 낫다고 하더라구요. 근데 이미 냉장고에 넣었는데 지금이라도 꺼내서 실온보관 할까요.? 냉장고에 넣은지 꽤 됐어요<br>
                            까스활명수를 냉장보관했는데 실온보관이 낫다고 하더라구요.<br>
                            근데 이미 냉장고에 넣었는데 지금이라도 꺼내서 실온보관 할까요.? 냉장고에 넣은지 꽤 됐어요<br>
                        </div>
                        <div class="board-content answer-content" id="answer-section">
                            <div class="expert-card">
                                <div class="expert-header">
                                    <div class="expert-photo">
                                        <img src="${pageContext.servletContext.contextPath}/resources/img/doctor.jpg"
                                            alt="의사아이콘">
                                    </div>
                                    <div class="expert-info-summary">
                                        <h2>김민한<span class="expert-role">[약사]</span></h2>
                                        <p>총답변: <span class="total-answers">2158</span> | <span class="score">별별별</span>
                                        </p>
                                    </div>
                                </div>
                                <div class="expert-details">
                                    <div class="expert-info">
                                        <p><strong>소속기관:</strong> <a href="#">사원약국</a></p>
                                    </div>
                                </div>
                            </div>
                            <div class="expert-response">
                                안녕하세요. 하이닥 상담약사 김민한입니다.
                                넵 지금부터 실온보관하면
                                괜찮습니다
                                원래 보관온도가 2~25도로
                                냉장보관을 해도됩니다
                                다만 소화제는 차가우면 복통이 있을 수 있습니다
                                건강하세요<br>
                            </div>
                            <div class="response-disclaimer">
                                * 본 답변은 참고용으로 의학적 판단이나 진료행위로 해석될 수 없습니다.
                            </div>
                            <div class="expert-actions">
                                <button class="white-button">상담</button>
                                <button class="white-button">추천</button>
                            </div>
                        </div>

                        <div class="board-footer">
                            <a href="${pageContext.servletContext.contextPath}/userPosts?username=jjhim531">jjhim531님의
                                게시글 더보기 ></a>
                        </div>

                        <div class="comment-header">
                            <h3>전체 댓글 (4)</h3>
                        </div>
                        <div class="comment-section-wrapper">
                            <table class="comment-section">
                                <tr>
                                    <th>작성자</th>
                                    <th>댓글 내용</th>
                                    <th>작성일</th>
                                    <th>추천</th>
                                </tr>
                                <tr>
                                    <td>자연인</td>
                                    <td>너무 흥미로워요!</td>
                                    <td>2024-10-21</td>
                                    <td>[5]</td>
                                </tr>
                                <tr>
                                    <td>jjhim531</td>
                                    <td>저도 참고할게요ㅎㅎ</td>
                                    <td>2024-11-03</td>
                                    <td>[11]</td>
                                </tr>
                                <tr>
                                    <td>paris3131</td>
                                    <td> 굳굳!!</td>
                                    <td>2024-11-03</td>
                                    <td>[11]</td>
                                </tr>
                                <!-- 추가 댓글 행들 -->
                            </table>
                        </div>
                        <div id="comment-form">
                            <div class="comment-header">
                                <div class="comment-user-info">
                                    <span>paris3131</span>
                                    <img src="${ pageContext.servletContext.contextPath }/resources/img/comment_camera.png"
                                        alt="camera">
                                </div>
                                <button class="round-button">댓글등록</button>
                            </div>
                            <textarea placeholder="댓글 작성"></textarea>
                        </div>

                    </div>
                    <div class="button-group">
                        <button class="white-button left-button">글쓰기</button>
                        <div class="right-buttons">
                            <button class="white-button">목록</button>
                            <button class="white-button">TOP</button>
                        </div>
                    </div>
                </div>

            </div><!-- Footer -->
            <%@ include file="/WEB-INF/views/common/main_footer.jsp" %>
        </body>

        </html>