let contextPath = "";

// 무한 스크롤 데이터 로드 여부
let isVisible = false;
let page = 1; // 첫 페이지는 이미 로드되었으므로 2부터 시작

//10개만 먼저 찍어주기
function init10() {
    // 첫 페이지 데이터를 AJAX로 가져오고 리스트에 추가
    let subject = document.getElementById('hospitalList_subject').value;
    let order = document.getElementById('hospitalList_orderBy').value;
    $.ajax({
        url: contextPath + `/hospital/list/api`,
        type: "GET",
        data: { 
                subject: subject, 
                order: order, 
                page: page, 
                limit: 10}, // 첫 페이지와 제한 개수 // 첫 페이지와 제한 개수
        dataType: "json",
        success: function(response) {
            if (response && response.length > 0) {
                addHospitalList(response); // 데이터를 병원 리스트에 추가
            } else {
                console.log("초기 데이터가 없습니다.");
            }
        },
        error: function(xhr, status, error) {
            console.error("초기 데이터를 가져오는데 실패했습니다:", error);
        }
    });
}

//검색한 내용이 있는지 조회
let isSearch = false; // 검색 상태 여부
let searchKeyword = ""; // 현재 검색 키워드

// 초기 설정 및 이벤트 등록
function hospitalListInit(path){

    contextPath = path;
    // 스크롤 이벤트 등록 (무한 스크롤)
    $(window).on('scroll', func);

    // 첫 페이지는 이미 로드되어 있으므로 func 호출하지 않음
    // "keyword" 파라미터 값 가져오기
    const keyword = params.get("keyword");

    if (keyword) {
        isSearch = true
        console.log(keyword)
    }

    console.log("isSearch: "+isSearch)

    if(isSearch){
        $('#loadingLine').hide();
    }
};

// 현재 URL에서 쿼리 파라미터 읽기
const params = new URLSearchParams(window.location.search);

// 특정 요소가 화면에 보이는지 확인하는 함수
function checkVisible(element, check = 'above') {
    const viewportHeight = $(window).height(); // Viewport Height
    const scrolltop = $(window).scrollTop(); // Scroll Top
    const y = $(element).offset().top; // Element Top
    const elementHeight = $(element).height(); // Element Height

    if (check === "visible") 
        return ((y < (viewportHeight + scrolltop)) && (y > (scrolltop - elementHeight)));
        
    if (check === "above") 
        return ((y < (viewportHeight + scrolltop)));
}

// 병원 목록을 추가하는 함수
function addHospitalList(hospitals) {
    hospitals.forEach(hospital => {
        $('.hospitalList_wrapper').append(`
            <div class="hospitalList_list_wrapper2">
                <div class="hospitalList_list">
                    <div class="hospitalList_listTitle">
                        <a href="${contextPath}/hospital/detail?hosNo=${hospital.hosNo}">
                            <p>${hospital.hosName}</p>
                        </a>
                    </div>
                    <div class="hospitalList_listOpenTime">
                        <span>평일 ${hospital.hosStartTime1} ~ ${hospital.hosEndTime1}</span>
                        <span>${hospital.department}</span>
                    </div>
                    <div class="hospitalList_listAddress">
                        <p>${hospital.hosAddress}</p>
                    </div>
                    <div class="hospitalList_listTag">
                        <button>어린이 국가예방접종</button>
                        <button>영유아 검진</button>
                        <button>주차장</button>
                    </div>
                </div>
            </div>
        `);
    });
}

// AJAX 요청으로 데이터 로드
const func = function () {
    if (!isVisible && checkVisible('#loadingLine')) {
        isVisible = true;

        console.log(page);
        let subject = document.getElementById('hospitalList_subject').value;
        let order = document.getElementById('hospitalList_orderBy').value;

        $.ajax({
            url: contextPath + (isSearch ? '/hospital/list/search' : '/hospital/list/api'),
            type: "GET",
            data: { 
                    subject: subject, 
                    order: order, 
                    page: page, 
                    limit: 10 
                }, // 현재 페이지와 제한 개수
            dataType: "json",
            success: function(response) {
                if (response && response.length > 0) {
                    addHospitalList(response); // 데이터를 병원 리스트에 추가
                    page++; // 페이지 증가
                    isVisible = false; // 추가 요청 가능
                } else {
                    console.log("더 이상 데이터가 없습니다.");
                    //$('#loadingLine').hide(); // 더 이상 데이터가 없으면 `loadingLine` 숨김
                }
            },
            error: function(xhr, status, error) {
                console.log(url);
                console.log("데이터를 가져오는데 실패했습니다:", error);
            }
        });
    }
};

function hospitalListInit(path){
    contextPath = path;
    // 스크롤 이벤트 등록 (무한 스크롤)
    $(window).on('scroll', func);

    // 첫 페이지는 이미 로드되어 있으므로 func 호출하지 않음
};

function replaceHospitalList(hospitals) {
    $(".hospitalList_list_wrapper2").remove();

    isVisible = false;
    page = 1;

    init10();

}