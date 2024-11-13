<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>병원 정보 조회</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; }
        header { text-align: center; margin-bottom: 20px; }
        .search-form { background-color: #f5f5f5; padding: 20px; border-radius: 8px; margin-bottom: 20px; }
        .result-section { text-align: center; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px; border: 1px solid #ddd; }
        th { background-color: #6cc24a; color: white; }
    </style>
</head>
<body>
<header>
    <h1>병원 정보 조회</h1>
</header>

<section class="search-form">
    <form action="${pageContext.request.contextPath}/hospital" method="get">
        <label for="sido">시/도 선택:</label>
        <select id="sido" name="sido" required>
            <option value="">선택하세요</option>
            <option value="서울특별시">서울특별시</option>
            <!-- 늘릴수 있음 -->
        </select>
        
        <label for="sigungu">시/군/구 선택:</label>
        <select id="sigungu" name="sigungu">
            <option value="">선택하세요</option>
            <option value="강남구">강남구</option>
            <!-- 늘릴수 있음 -->
        </select>
        
        <label for="department">진료 과목:</label>
        <select id="department" name="department">
            <option value="">선택하세요</option>
            <option value="D011">소아과</option>
            <option value="D010">산부인과</option>
            <!-- 늘릴수 있음 -->
        </select>
        
        <label for="numOfRows">표시할 목록 수:</label>
        <select id="numOfRows" name="numOfRows">
            <option value="10">10개</option>
            <option value="20">20개</option>
            <option value="50">50개</option>
            <option value="100">100개</option>
            <option value="200">200개</option>
        </select>
        <button type="submit">검색</button>
    </form>
</section>

<section class="result-section">
    <h2>검색 결과</h2>
    <div id="resultContainer">
        <c:if test="${not empty hospitalData}">
            <script>
                var hospitalData = JSON.parse('${hospitalData}');
                var resultHtml = "<table><thead><tr><th>병원명</th><th>주소</th><th>구분</th><th>진료과목</th><th>운영시간</th><th>기관 ID</th><th>위도</th><th>경도</th></tr></thead><tbody>";

                if (hospitalData.response.body.items && hospitalData.response.body.items.item) {
                    var hospitals = Array.isArray(hospitalData.response.body.items.item) ? 
                                    hospitalData.response.body.items.item : [hospitalData.response.body.items.item];
                    
                    hospitals.forEach(function(hospital) {
                        resultHtml += "<tr><td>" + hospital.dutyName + "</td>";
                        resultHtml += "<td>" + hospital.dutyAddr + "</td>";
                        resultHtml += "<td>" + hospital.dutyDivNam + "</td>";
                        resultHtml += "<td>" + hospital.dutyEmclsName + "</td>";
                        resultHtml += "<td>" + (hospital.dutyTime1s || '') + " ~ " + (hospital.dutyTime1c || '') + "</td>";
                        resultHtml += "<td>" + hospital.hpid + "</td>";
                        resultHtml += "<td>" + hospital.wgs84Lat + "</td>";
                        resultHtml += "<td>" + hospital.wgs84Lon + "</td></tr>";
                    });
                } else {
                    resultHtml += "<tr><td colspan='8'>검색 결과가 없습니다.</td></tr>";
                }

                resultHtml += "</tbody></table>";
                document.getElementById("resultContainer").innerHTML = resultHtml;
            </script>
        </c:if>
    </div>
</section>
</body>
</html>
