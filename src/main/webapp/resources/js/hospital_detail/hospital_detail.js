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

function copy() {
    // 복사문구값 가져오기
    let shareAddress = document.getElementById("shareAddress");
  
    // 복사
    navigator.clipboard.writeText(shareAddress.value);
  
    // 복사완료에 대해 Alert으로 띄우기
    alert("복사되었습니다.");
  }