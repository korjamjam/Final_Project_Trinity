<script>
	function sendSelectValue() {
	    const selectBox1 = document.getElementsByName("subject")[0];
	    const selectedValue1 = selectBox1.value;
	    const selectBox2 = document.getElementsByName("orderBy")[0];
	    const selectedValue2 = selectBox2.value;
	
	    $.ajax({
	        url: "${pageContext.request.contextPath}/hospital/list", // Controller 매핑된 URL
	        type: "POST",
	        data: { selectedValue1: selectedValue1, selectedValue2: selectedValue2 }, // 선택된 값 전달
	        success: function(response) {
	            console.log("서버 응답: ", response);
	        },
	        error: function(error) {
	            console.error("에러 발생:", error);
	        }
	    });
	}
	
	window.onload = sendSelectValue;
</script>
