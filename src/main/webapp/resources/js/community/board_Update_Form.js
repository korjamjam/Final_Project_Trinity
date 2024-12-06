
let attFile = {
    fileList: [] // 파일 리스트를 관리하는 배열
};
$(document).ready(function () {

    console.log("문서가 준비되었습니다.");  // 로그 추가

    // Initialize Summernote
    initializeSummernote();

    // 창 크기 변경 시 Summernote 크기 동기화
    $(window).on('resize', syncSummernoteWidth);

    // File upload event listener
    $("#upfiles").on("change", updateFileList);
    getFileList()
});


function initializeSummernote() {
    $('#summernote').summernote({
        minHeight: 400,
        maxHeight: null,
        placeholder: '글을 입력하세요.',
        tabsize: 2,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['height', 'ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ],
        height: ['1.0', '1.5', '1.75', '2.0'], // 줄간격 설정
        callbacks: {
            onImageUpload: function (imgs) {
                ImageUpload(imgs); // contextPath를 전달
            },
            onChange: adjustHeight
        }
    });
    syncSummernoteWidth(); // 초기 너비 동기화
}

function syncSummernoteWidth() {
    const wrapperWidth = $('.post-wrapper').width();
    $('.note-editor').css('width', wrapperWidth);
}

function adjustHeight(contents) {
    const editableArea = $('.note-editable');
    const scrollHeight = editableArea.prop('scrollHeight');
    editableArea.css('height', `${scrollHeight}px`); // 템플릿 리터럴로 수정
}
function getFileList() {
    console.log("boardNo:", boardNo); // 값 확인

    // 파일 목록을 가져오기 위한 AJAX 요청
    $.ajax({
        url: contextPath + "/community/getFileList", // 서버의 URL (서버에 맞게 수정)
        type: "GET",
        data: { bno: boardNo }, // 요청 파라미터로 게시글 번호 전송
        success: function (response) {
            // 서버에서 반환된 파일 목록
            if (response.length > 0) {
                let postForm = document.querySelector("#postForm")
                // 파일 목록을 저장
                attFile.fileList = response.map(f => {
                    postForm.innerHTML += (`<input type="hidden" name="existingFileNos" value="${f.fileNo}">`);

                    return {
                        "name": f.originName,
                        "size": f.fileSize,
                        "allowDownload": f.allowDownload, // 기본적으로 다운로드 허용
                        "new": false // 새로 추가된 파일 표시
                    }
                });
                console.log("get파일 목록 : ", response);

                // 파일 목록을 화면에 표시
                drawFileList(true);
            } else {
                console.log("파일 목록을 가져오는 데 실패했습니다.");
                console.log("서버 응답:", response);  // 응답 내용 출력 (디버깅용)
            }
        },
        error: function (error) {
            console.error("AJAX 요청 오류:", error);
        }
    });
}

// 파일 업로드 처리 함수
function updateFileList(event) {
    const files = event.target.files;
    
    // 파일 개수 제한 (최대 3개)
    if (files.length > 3) {
        alert("파일은 최대 3개까지 첨부할 수 있습니다.");
        return;
    }

    // 기존 파일을 초기화하고 새로 추가된 파일만 반영
    attFile.fileList = [];

    // 새로 추가된 파일만 attFile.fileList에 추가
    for (let i = 0; i < files.length; i++) {
        attFile.fileList.push({
            name: files[i].name,
            size: files[i].size,
            allowDownload: "Y",  // 기본적으로 다운로드 허용
            new: true             // 새로 추가된 파일 표시
        });
    }

    console.log("새로 첨부된 파일 리스트:", attFile.fileList);
    drawFileList();  // UI 업데이트
}

function drawFileList(noneDisplay) {
    const fileListDiv = document.getElementById("file-list");
    console.log("최종 첨부파일 목록:", attFile.fileList);
    fileListDiv.innerHTML = ""; // UI 초기화

    const fileListContainer = document.getElementById("file-list-container");
    fileListContainer.style.display = attFile.fileList.length === 0 ? "none" : "block";

    attFile.fileList.forEach((file, index) => {
        const fileSizeInKB = (file.size / 1024).toFixed(1);
        const allowDownloadValue = file.allowDownload || "Y";

        const fileRow = `
            <div class="file-item d-flex justify-content-between align-items-center"
                 data-index="${index}" data-file-name="${file.name}" data-file-size="${file.size}">
                <span>${file.name} (${fileSizeInKB} KB)</span>
               <div class="d-flex align-items-center">
                    <input type="hidden" name="allowDownload" id="allowDownload${index}" value="${allowDownloadValue}">
                    `+
                    ( noneDisplay ? 
                    `<button type="button" class="btn btn-sm allow-download-btn me-2">
                        <i class="bi ${allowDownloadValue === 'Y' ? 'bi-arrow-down-circle' : 'bi-lock'}"></i>
                    </button>` : 
                    `<button type="button" class="btn btn-sm btn-outline-primary allow-download-btn me-2"
                            data-allow="${allowDownloadValue === 'Y'}" data-index="${index}"
                            onclick="toggleDownload(this, ${index})">
                        <i class="bi ${allowDownloadValue === 'Y' ? 'bi-arrow-down-circle' : 'bi-lock'}"></i>
                    </button>`)
                    +`
                </div>
            </div>
        `;
        fileListDiv.innerHTML += fileRow;
        //TODO : x button
        // <button type="button" class="btn btn-sm btn-outline-danger"
        //         onclick="removeFile(${index}, '${file.name}')">
        //     <i class="bi bi-x-circle"></i>
        // </button>
    });
}



function changeCategory(categoryName) {
    console.log("함수 호출"); // 함수 호출 확인
    console.log("선택된 카테고리:", categoryName); // 선택된 값 확인

    let categoryId;

    // 선택한 categoryName에 맞는 categoryId 설정
    if (categoryName === '자유게시판') {
        categoryId = 'CAT01'; // 카테고리 ID에 맞게 값 설정
    } else if (categoryName === '메디톡') {
        categoryId = 'CAT02';
    } else if (categoryName === '이벤트게시판') {
        categoryId = 'CAT03';
    }

    // hidden input의 value를 업데이트
    const hiddenInput = document.getElementById('categoryId');
    if (hiddenInput) {
        hiddenInput.value = categoryId;
        console.log("hidden input 업데이트 완료:", hiddenInput.value);
    } else {
        console.error("hidden input을 찾을 수 없습니다.");
    }
}

//summernote에디터 이미지 업로드
function ImageUpload(imgs) {
    const fd = new FormData();
    for (let i = 0; i < imgs.length; i++) {
        fd.append("fileList", imgs[i]);
    }

    $.ajax({
        url: contextPath + "/community/upload", // 템플릿 리터럴로 수정
        type: "POST",
        data: fd,
        processData: false,
        contentType: false,
        dataType: "json",

        success: function (response) {
            console.log("파일 업로드 성공:", response);
            response.forEach(filePath => {
                $('#summernote').summernote('insertImage', filePath);
            });
        },
        error: function (xhr, status, error) {
            console.error("AJAX Error:", status, error);
            alert("이미지 업로드 실패! 다시 시도해주세요.");
        }
    });
}


// 파일 검증 및 목록 업데이트
function checkFileValidation(input) {
    const files = input.files;
    const maxFileSize = 5 * 1024 * 1024; // 최대 파일 크기 5MB
    const maxFileCount = 3; // 최대 파일 개수 3개
    console.log(attFile);

    if (files.length > maxFileCount) {
        alert(`파일은 최대 ${maxFileCount}개까지만 업로드할 수 있습니다.`);
        input.value = ""; // 선택 초기화
        return;
    }

    for (let file of files) {
        if (file.size > maxFileSize) {
            alert(`파일 "${file.name}"의 크기가 5MB를 초과합니다.`);
            input.value = ""; // 선택 초기화
            return;
        }
    }

    updateFileList(input); // 파일 목록 업데이트
}
// 새로운 파일을 추가할 때 기존 파일 목록을 무시하고 덮어씌우기
function updateFileList(input) {
    attFile.fileList = [];
    const selectedFiles = Array.from(input.files);

    // 선택한 파일만 attFile.fileList에 추가 (기존 파일은 무시)
    attFile.fileList = selectedFiles.map(file => ({
        name: file.name,
        size: file.size,
        allowDownload: "Y", // 기본적으로 다운로드 허용
        new: true // 새로 추가된 파일 표시
    }));

    // UI 업데이트
    drawFileList();
}




function toggleDownload(button, index) {
    const isAllowed = $(button).data("allow");
    const newStatus = !isAllowed;

    $(button).data("allow", newStatus);
    $(button).toggleClass("btn-outline-primary btn-outline-secondary");
    $(button).find("i").toggleClass("bi-arrow-down-circle bi-lock");

    attFile.fileList[index].allowDownload = newStatus ? "Y" : "N";
}



function removeFile(targetIndex, fileName) {
    attFile.fileList = attFile.fileList.filter((file, index) => index !== targetIndex);
    alert(`"${fileName}" 파일이 삭제되었습니다.`);
    drawFileList();
}
