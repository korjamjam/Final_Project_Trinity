// 파일 목록을 관리하는 객체
let attFile = {
    fileList: [] // 파일 리스트
};

// 문서가 준비되었을 때 실행되는 함수
$(document).ready(function () {
    console.log("문서가 준비되었습니다.");
    // Summernote 초기화
    initializeSummernote();
    // 창 크기 변경 시 Summernote 크기 동기화
    $(window).on('resize', syncSummernoteWidth);
    
    // 파일 업로드 이벤트 리스너
    $("#upfiles").on("change", checkFileValidation);
    
    // 게시글의 기존 파일 목록 가져오기
    getFileList();
});

// Summernote 초기화 함수
function initializeSummernote() {
    console.log("Summernote 초기화 시작.");
    $('#summernote').val(boardContent);
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
        callbacks: {
            onImageUpload: function (imgs) {
                console.log("이미지 업로드 호출");
                ImageUpload(imgs); // 이미지 업로드 처리
            },
            onChange: adjustHeight // 높이 조정
        }
    });
    syncSummernoteWidth(); // 초기 너비 동기화
}

// Summernote 너비 동기화 함수
function syncSummernoteWidth() {
    const wrapperWidth = $('.post-wrapper').width();
    $('.note-editor').css('width', wrapperWidth);
}

// Summernote의 내용이 변경될 때 높이 조정
function adjustHeight(contents) {
    console.log("내용 변경, 높이 조정 필요");
    const editableArea = $('.note-editable');
    const scrollHeight = editableArea.prop('scrollHeight');
    editableArea.css('height', `${scrollHeight}px`);
}

// 파일 목록을 서버에서 가져오는 함수
function getFileList() {
    console.log("게시글 번호:", boardNo); // 값 확인

    // 파일 목록을 가져오기 위한 AJAX 요청
    $.ajax({
        url: contextPath + "/community/getFileList", // 서버의 URL (서버에 맞게 수정)
        type: "GET",
        data: { bno: boardNo }, // 요청 파라미터로 게시글 번호 전송
        success: function (response) {
            console.log("서버 응답:", response);
            if (response.length > 0) {
                let postForm = document.querySelector("#postForm");

                // 파일 목록을 저장
                attFile.fileList = response.map(f => {
                    console.log(`파일 추가: ${f.originName}`);
                    postForm.innerHTML += (`<input type="hidden" name="existingFileNos" value="${f.fileNo}">`);

                    return {
                        "name": f.originName,
                        "size": f.fileSize,
                        "allowDownload": f.allowDownload, // 기본적으로 다운로드 허용
                        "new": false // 새로 추가된 파일 표시
                    };
                });
                console.log("서버에서 받은 파일 목록 : ", response);

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

// 파일 업로드 처리 함수 (파일 개수, 크기 제한)
function checkFileValidation(input) {
    console.log("파일 업로드 이벤트 발생");
    const files = input.files;
    const maxFileSize = 5 * 1024 * 1024; // 최대 파일 크기 5MB
    const maxFileCount = 3; // 최대 파일 개수 3개

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

// 파일 목록 업데이트 (새로 첨부된 파일만 반영)
function updateFileList(input) {
    console.log("새 파일 목록 업데이트 시작");
    attFile.fileList = []; // 기존 파일 목록 초기화
    const selectedFiles = Array.from(input.files);

    // 선택한 파일만 attFile.fileList에 추가 (기존 파일은 무시)
    attFile.fileList = selectedFiles.map(file => {
        console.log(`새 파일 추가: ${file.name}`);
        return {
            name: file.name,
            size: file.size,
            allowDownload: "Y", // 기본적으로 다운로드 허용
            new: true // 새로 추가된 파일 표시
        };
    });

    // UI 업데이트
    drawFileList();
}

// 파일 목록을 화면에 표시
function drawFileList(noneDisplay) {
    console.log("파일 목록 그리기 시작");
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
            (noneDisplay ?
                `<button type="button" class="btn btn-sm allow-download-btn me-2">
                        <i class="bi ${allowDownloadValue === 'Y' ? 'bi-arrow-down-circle' : 'bi-lock'}"></i>
                    </button>` :
                `<button type="button" class="btn btn-sm btn-outline-primary allow-download-btn me-2"
                            data-allow="${allowDownloadValue === 'Y'}" data-index="${index}"
                            onclick="toggleDownload(this, ${index})">
                        <i class="bi ${allowDownloadValue === 'Y' ? 'bi-arrow-down-circle' : 'bi-lock'}"></i>
                    </button>`)
            + `
                </div>
            </div>
        `;
        fileListDiv.innerHTML += fileRow;
    });
}

// 다운로드 허용 여부 변경
function toggleDownload(button, index) {
    console.log(`다운로드 허용 여부 변경: ${index}`);
    const isAllowed = $(button).data("allow");
    const newStatus = !isAllowed;

    $(button).data("allow", newStatus);
    $(button).toggleClass("btn-outline-primary btn-outline-secondary");
    $(button).find("i").toggleClass("bi-arrow-down-circle bi-lock");

    // 파일 목록의 allowDownload 값을 변경
    attFile.fileList[index].allowDownload = newStatus ? "Y" : "N";
    console.log(`파일 목록의 allowDownload 값 변경: ${attFile.fileList[index].allowDownload}`);

    // hidden input 값 업데이트
    const hiddenInput = document.getElementById(`allowDownload${index}`);
    if (hiddenInput) {
        hiddenInput.value = attFile.fileList[index].allowDownload;  // 변경된 값으로 업데이트
        console.log(`hidden input 업데이트: ${hiddenInput.value}`);
    } else {
        console.error("hidden input을 찾을 수 없습니다.");
    }
}


// 파일 삭제 처리
function removeFile(targetIndex, fileName) {
    console.log(`파일 삭제: ${fileName} (index: ${targetIndex})`);
    attFile.fileList = attFile.fileList.filter((file, index) => index !== targetIndex);
    alert(`"${fileName}" 파일이 삭제되었습니다.`);
    drawFileList();
}

// 게시글 수정 시 카테고리 변경
function changeCategory(categoryName) {
    console.log("선택된 카테고리:", categoryName);

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

// 이미지 업로드 처리 (Summernote 에디터)
function ImageUpload(imgs) {
    console.log("이미지 업로드 호출됨:", imgs);
    const fd = new FormData();
    for (let i = 0; i < imgs.length; i++) {
        fd.append("imgList", imgs[i]);
    }

    $.ajax({
        url: contextPath + "/community/imgUpload",
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
