function checkLogin(){
    location.href = "${pageContext.request.contextPath}/reservation/form"
}
document.addEventListener("DOMContentLoaded", function() {

    if (alertMsg) { 
        alert(alertMsg);
    }
});