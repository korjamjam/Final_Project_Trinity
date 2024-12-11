//현재시간 가져오기
let curDate = new Date();
let currentTime = curDate.getHours() + ':' + curDate.getMinutes();
let currentDoctorNo;

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

const getDoctorReviews = function (doctorNo) {
    currentDoctorNo = doctorNo;
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

const getTodayWaitingList = function () {
    let hosNo = document.getElementById('hosNo').value;

    $.ajax({
        url: contextPath + ('/hospital/detail/todayWaitingList'),
        type: "GET",
        data: { 
                hosNo: hosNo
            },
        dataType: "json",
        success: function(response) {
            if (response && response.length > 0) {
                addTodayWaitingList(response); // 데이터를 리뷰창에 추가
            } else {
                console.log("대기가 없습니다.");
            }
        },
        error: function(xhr, status, error) {
            // console.log(url);
            console.log("데이터를 가져오는데 실패했습니다:", error);
        }
    });
};

function addTodayWaitingList(waitings) {
    $('.waitingContainer').remove();
    waitings.forEach(waiting => {
        if(waiting == null){
            $('.waitingNavi').append(`현재 대기중인 고객이 존재하지 않습니다.`);
        }
        else{
            $('.waitingNavi').append(`
                <div class="waitingContainer">
                    <div class="waitingItem">
                        <div class="waitingItemWrapper">
                            <div class="waitingIcon">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div class="waitingInfo">
                                <span class="waitingLabel">시간</span>
                                <strong class="waitingValue">${waiting.startTime} ~ ${waiting.endTime}</strong>
                            </div>
                        </div>
                    </div>
                    <div class="waitingItem">
                        <div class="waitingItemWrapper">
                            <div class="waitingIcon">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="waitingInfo">
                                <span class="waitingLabel">&nbsp;대기자 수</span>
                                <strong class="waitingValue">${waiting.count}명</strong>
                            </div>
                        </div>
                    </div>
                </div>
            `);
        }
    });
}

const getDoctorBiography = function (doctorNo) {
    $.ajax({
        url: contextPath + ('/hospital/detail/doctorBiography'),
        type: "GET",
        data: { 
                doctorNo: doctorNo
            },
        dataType: "text",
        success: function(response) {
            if (response && response.length > 0) {
                addDoctorBiography(response); // 데이터를 리뷰창에 추가
            } else {
                console.log("약력이 없습니다.");
            }
        },
        error: function(xhr, status, error) {
            // console.log(url);
            console.log("데이터를 가져오는데 실패했습니다:", error);
        }
    });
};
function addDoctorBiography(biography) {
    $('.biographyContainer').remove();
    if(biography == null){
        $('.biographyNavi').append(`
            <div class="biographyContainer">
                약력이 존재하지 않습니다.
            </div>
        `);
    }
    else{
        $('.biographyNavi').append(`
            <div class="biographyContainer">
                ${biography}
            </div>
        `);
    };
}

function changeHiddenTitle(){
    const titleValue = document.getElementById('reviewTitle').value;
    document.getElementById('hiddenReviewTitle').value = titleValue;
}

function changeHiddenContent(){
    const titleValue = document.getElementById('reviewContent').value;
    document.getElementById('hiddenReviewContent').value = titleValue;
}

function writeReview() {
    const writerNo = document.getElementById('writerNo').value;
    
    if(writerNo == ""){
        alert("로그인 후 사용할 수 있습니다.");
        return null;
    }

    const button = document.getElementById('listReview');
    button.disabled = true;

    const writerName = document.getElementById('writerName').value;
    const writerProfile = document.getElementById('writerProfile').value;
    console.log(writerProfile);
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

    let curTime = year + '-' +
    month + '-' +
    date;

    const star = contextPath + '/resources/img/star.png';

    $('.reviewNavi').append(`
        <div class="reviewContainer">
            <div class="reviewHeader">
                <img src="/trinity${writerProfile}" alt="writer Profile" class="userAvatar">
                <div class="userInfo">
                    <h3 class="userName">${writerName}</h3>
                    <span class="reviewDate">${curTime}</span>
                </div>
                <div class="reviewRating">
                    <img id="star" src="${star}" alt="star" class="star-icon">
                    &nbsp;
                    <span class="ratingScore"><input type="number" id="reviewRating" style="width: 30px; height: 18px; color: #4CAF50;"></span>
                    <span class="ratingLabel">/ 5</span>
                </div>
            </div>
            <div class="reviewBody">
                <h4 class="reviewTitle"><input type="text" id="reviewTitle" placeholder="제목을 입력해 주세요." style="width: 362px;" onchange="changeHiddenTitle()"></h4>
                <input type="hidden" id="hiddenReviewTitle">
                <p class="reviewContent"><input type="text" id="reviewContent" placeholder="내용을 입력해 주세요." style="width: 362px; height: 44px;" onchange="changeHiddenContent()"></p>
                <input type="hidden" id="hiddenReviewContent">
            </div>
            <div class="reviewBtn">
                <button type="button" class="btn btn-default" id="uploadReview" onclick="uploadReview()">댓글 올리기</button>
            <div>
        </div>
    `);
}

function uploadReview(){
    let writerNo = document.getElementById('writerNo').value;
    let doctorNo = currentDoctorNo;
    let reviewTitle = document.getElementById('reviewTitle').value;
    let reviewContent = document.getElementById('reviewContent').value;
    let reviewRating = document.getElementById('reviewRating').value;

    $.ajax({
        url: contextPath + ('/hospital/detail/uploadReview'),
        type: "GET",
        data: { 
                writerNo: writerNo,
                doctorNo: doctorNo,
                reviewTitle: reviewTitle,
                reviewContent: reviewContent,
                reviewRating: reviewRating
            },
        dataType: "json",
        success: function(response) {
            if (response && response.length > 0) {
                addReviewList(response); // 데이터를 리뷰창에 올린것 까지 다시 써주기
            } else {
                console.log("데이터가 없습니다.");
            }
        },
        error: function(xhr, status, error) {
            // console.log(url);
            console.log("데이터를 가져오는데 실패했습니다:", error);
        }
    });
}