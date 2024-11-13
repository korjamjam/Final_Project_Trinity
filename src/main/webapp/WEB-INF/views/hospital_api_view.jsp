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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<header>
    <h1>병원 정보 조회</h1>
</header>

<section class="search-form">
    <form id="hospitalSearchForm">
        <label for="sido">시/도 선택:</label>
        <select id="sido" name="sido" required>
            <option value="">선택하세요</option>
            <option value="서울특별시">서울특별시</option>
            <!-- 시도 옵션 추가 가능 -->
        </select>

        <label for="sigungu">시/군/구 선택:</label>
        <select id="sigungu" name="sigungu">
            <option value="">선택하세요</option>
            <option value="강남구">강남구</option>
            <!-- 시군구 옵션 추가 가능 -->
        </select>

        <label for="department">진료 과목:</label>
        <select id="department" name="department">
            <option value="">선택하세요</option>
            <option value="D011">소아과</option>
            <option value="D010">산부인과</option>
        </select>

        <label for="numOfRows">표시할 목록 수:</label>
        <select id="numOfRows" name="numOfRows">
            <option value="10">10개</option>
            <option value="20">20개</option>
            <option value="50">50개</option>
            <option value="100">100개</option>
            <option value="200">200개</option>
        </select>
        <button type="button" onclick="searchHospital()">검색</button>
    </form>
</section>

<section class="result-section">
    <h2>검색 결과</h2>
    <div id="resultContainer"></div>
</section>

<script>
function searchHospital() {
    const sido = $("#sido").val();
    const sigungu = $("#sigungu").val();
    const department = $("#department").val();
    const numOfRows = $("#numOfRows").val();

    $.ajax({
        url: "${pageContext.request.contextPath}/hospital",
        type: "GET",
        data: { 
            sido: sido, 
            sigungu: sigungu,   
            department: department, 
            numOfRows: numOfRows 
        },
        success: function(data) {
            // JSON 문자열로 반환된 경우 JSON 객체로 변환
            const jsonData = typeof data === "string" ? JSON.parse(data) : data;
            
            console.log(jsonData); // 데이터 구조 확인용
            let resultHtml = "<table><thead><tr><th>병원명</th><th>주소</th><th>구분</th><th>진료과목</th><th>운영시간</th><th>기관 ID</th><th>위도</th><th>경도</th></tr></thead><tbody>";

            // 응답 데이터 구조에 접근
            if (jsonData && jsonData.response && jsonData.response.body && jsonData.response.body.items && jsonData.response.body.items.item) {
                const hospitals = Array.isArray(jsonData.response.body.items.item) ? jsonData.response.body.items.item : [jsonData.response.body.items.item];
                
                hospitals.forEach(function(hospital) {
                    resultHtml += "<tr><td>" + (hospital.dutyName || '') + "</td>";
                    resultHtml += "<td>" + (hospital.dutyAddr || '') + "</td>";
                    resultHtml += "<td>" + (hospital.dutyDivNam || '') + "</td>";
                    resultHtml += "<td>" + (hospital.dutyEmclsName || '') + "</td>";
                    resultHtml += "<td>" + ((hospital.dutyTime1s || '') + " ~ " + (hospital.dutyTime1c || '')) + "</td>";
                    resultHtml += "<td>" + (hospital.hpid || '') + "</td>";
                    resultHtml += "<td>" + (hospital.wgs84Lat || '') + "</td>";
                    resultHtml += "<td>" + (hospital.wgs84Lon || '') + "</td></tr>";
                });
            } else {
                resultHtml += "<tr><td colspan='8'>검색 결과가 없습니다.</td></tr>";
            }

            resultHtml += "</tbody></table>";
            $('#resultContainer').html(resultHtml);
        },


        error: function() {
            $('#resultContainer').html("<p>데이터를 불러오는 중 오류가 발생했습니다.</p>");
        }
    });
}
</script>
</body>
</html>
