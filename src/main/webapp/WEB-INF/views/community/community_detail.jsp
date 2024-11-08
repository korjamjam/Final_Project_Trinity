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

                    <div class="board-content">
                        예로부터 전통적으로 상처에 된장을 바르면 된다고 하는데 사실인가요?
                    </div>

                    <div class="board-footer">
                        <span>jjhim531님의 게시글 더보기 ></span>
                    </div>

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
                            <td>jjhim531</td>
                            <td>저도 참고할게요ㅎㅎ</td>
                            <td>2024-11-03</td>
                            <td>[11]</td>
                        </tr>
                        <!-- 추가 댓글 행들 -->
                    </table>

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