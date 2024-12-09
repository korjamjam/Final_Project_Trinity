//현재시간 가져오기
let curDate = new Date();
let currentTime = curDate.getHours() + ':' + curDate.getMinutes();

//DB에 저장되어있는 병원의 영업시간 가져오기
let startTime;
let endTime;

function initHospitalDetail(hosLatitude, hosLongitude) {
    startTime = document.getElementById('hosStartTime1').value;
    endTime = document.getElementById('hosEndTime1').value;

    if (startTime && endTime) {
        checkHospitalStatus();
    } else {
        console.error("영업 시간 정보가 없습니다.");
    }

    kakaoInit(hosLatitude, hosLongitude);
    setImg();
    getTime();
}
function getTime() {
    const curDate = new Date();
    let month = `${curDate.getMonth() + 1}`
    let date = `${curDate.getDate()}`;
    let year = `${curDate.getFullYear()}`;
    if(month < 10){
        month = '0' + month.toString();
    }
    if(date < 10){
        date = '0' + date.toString();
    }

    let curTime = month + '/' +
    date + '/' +
    year;
    console.log(curTime);
    return encodeURIComponent(month + '/' +
                              date + '/' +
                              year);
}
//시간 변환
function createDate(timeString) {
    if (!timeString) return null;
    const [hours, minutes] = timeString.split(':').map(Number);
    const date = new Date();
    date.setHours(hours, minutes, 0, 0);
    return date;
  }
  
//시간 비교
function isTimeBetween(time, start, end) {
    const timeDate = createDate(time);
    const startDate = createDate(start);
    const endDate = createDate(end);

    if (!timeDate || !startDate || !endDate) return false;

    if (startDate <= endDate) {
        return timeDate >= startDate && timeDate <= endDate;
    } else {
        // 00시를 넘어가는 경우
        return timeDate >= startDate || timeDate <= endDate;
    }
  }
  
//현재시간이 영업시간이면 진료중이라고 띄우고 아니면 진료 종료 띄우기
function checkHospitalStatus() {
    if (isTimeBetween(currentTime, startTime, endTime)) {
        // console.log("진료중");
        const open = document.querySelector('.hospital_detail_btn1');
        open.style.display = 'block';
    } else {
        // console.log("진료종료");
        const close = document.querySelector('.hospital_detail_btn3');
        close.style.display = 'block';
    }
}

function copyAddress() {
    // 복사문구값 가져오기
    let shareAddress = document.getElementById("shareAddress");
  
    // 복사
    navigator.clipboard.writeText(shareAddress.value);
  
    // 복사완료에 대해 Alert으로 띄우기
    alert("복사되었습니다.");
}

function copyTel() {
    // 복사문구값 가져오기
    let copyTel = document.getElementById("copyTel");

    // 복사
    navigator.clipboard.writeText(copyTel.value);

    // 복사완료에 대해 Alert으로 띄우기
    alert("복사되었습니다.");
}

const getDoctorReviews = function () {
    let doctorNo = document.getElementById('doctorNo').value;

    $.ajax({
        url: contextPath + ('/hospital/detail/doctorReview'),
        type: "GET",
        data: { 
                doctorNo: doctorNo
            },
        dataType: "json",
        success: function(response) {
            if (response && response.length > 0) {
                addReviewList(response); // 데이터를 리뷰창에 추가
            } else {
                console.log("리뷰가 없습니다.");
            }
        },
        error: function(xhr, status, error) {
            // console.log(url);
            console.log("데이터를 가져오는데 실패했습니다:", error);
        }
    });
};
function addReviewList(reviews) {
    $('.reviewContainer').remove();
    const star = contextPath + '/resources/img/star.png';
    reviews.forEach(review => {
        if(review == null){
            $('.reviewNavi').append(`리뷰가 존재하지 않습니다.`);
        }
        else{
            $('.reviewNavi').append(`
                <div class="reviewContainer">
                    <div class="reviewHeader">
                        <img src="/trinity${review.userProfile}" alt="User Profile" class="userAvatar">
                        <div class="userInfo">
                            <h3 class="userName">${review.userName}</h3>
                            <span class="reviewDate">${review.reviewCreatedAt}</span>
                        </div>
                        <div class="reviewRating">
                            <c:forEach begin="1" end="${review.reviewRating}">
                                <img id="star" src="${star}" alt="star" class="star-icon">
                            </c:forEach>
                            &nbsp;
                            <span class="ratingScore">${review.reviewRating}</span>
                            <span class="ratingLabel">/ 5</span>
                        </div>
                    </div>
                    <div class="reviewBody">
                        <h4 class="reviewTitle">${review.reviewTitle}</h4>
                        <p class="reviewContent">${review.reviewContent}</p>
                    </div>
                </div>
            `);
        }
    });
}


function hosNoToNum(hosNo) {
    let result = hosNo.substr(1);
    result = parseInt(result);
    result = result % 4;
    console.log(result);
    return result;
}

function setImg(){
    let num = Math.floor(Math.random() * 4);
    console.log(num);
    let imgEl = document.getElementById('commercial');
    switch(num){
        case 0: 
            imgEl.src = contextPath + '/resources/img/ad6.jpg'; 
            imgEl.id = 'ad1';
            break;
        case 1: 
            imgEl.src = contextPath + '/resources/img/ad3.jpg'; 
            imgEl.id = 'ad2';
            break;
        case 2: 
            imgEl.src = contextPath + '/resources/img/ad4.jpg'; 
            imgEl.id = 'ad3';
            break;
        case 3: 
            imgEl.src = contextPath + '/resources/img/ad5.jpg'; 
            imgEl.id = 'ad4';
            break;
    }
}

const getReservationInfoList = function () {
    let hosNo = document.getElementById('hosNo').value;

    $.ajax({
        url: contextPath + ('/hospital/detail/doctorReview'),
        type: "GET",
        data: { 
                hosNo: hosNo
            },
        dataType: "json",
        success: function(response) {
            if (response && response.length > 0) {
                addReviewList(response); // 데이터를 리뷰창에 추가
            } else {
                console.log("리뷰가 없습니다.");
            }
        },
        error: function(xhr, status, error) {
            // console.log(url);
            console.log("데이터를 가져오는데 실패했습니다:", error);
        }
    });
};