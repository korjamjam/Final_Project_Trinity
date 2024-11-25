let data = {
    contextPath : "",
    fileList : [],
};

$(document).ready(function () {
    data.contextPath = document.getElementById('context-path').dataset.baseUrl;
    console.log("Context Path:", data.contextPath); // 디버깅용
    initializeSummernote();

    // 창 크기 변경 시 Summernote 크기 동기화
    $(window).on('resize', syncSummernoteWidth);
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
                fileUpload(imgs, data.contextPath); // contextPath를 전달
            },
            onChange: adjustHeight
        }
    });
    syncSummernoteWidth(); // 초기 너비 동기화
}



// Summernote 너비 동기화
function syncSummernoteWidth() {
    const wrapperWidth = $('.post-wrapper').width();
    $('.note-editor').css('width', wrapperWidth);
}
// 글 내용에 따라 Summernote 높이 조정
function adjustHeight(contents) {
    const editableArea = $('.note-editable');
    const scrollHeight = editableArea.prop('scrollHeight');
    editableArea.css('height', `${scrollHeight}px`);
}
// 이미지 업로드 처리 (Summernote 연동)
function fileUpload(imgs) {
    
    const fd = new FormData();
    for (let i = 0; i < imgs.length; i++) {
        fd.append("fileList", imgs[i]);
    }

    $.ajax({
        url: `${data.contextPath}/community/upload`, // contextPath를 기반으로 URL 설정
        type: "POST",
        data: fd,
        processData: false,
        contentType: false,
        dataType: "json",
        beforeSend: function () {
            console.log("AJAX URL:", `${data.contextPath}/community/upload`); // 디버깅용
        },
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

    // 파일 개수 체크
    if (data.fileList.length + files.length > maxFileCount)  {
        alert(`파일은 최대 ${maxFileCount}개까지만 업로드할 수 있습니다.`);
        input.value = ""; // 선택 초기화
        return;
    }

    // 파일 크기 체크
    for (let file of files) {
        if (file.size > maxFileSize) {
            alert(`파일 "${file.name}"의 크기가 5MB를 초과합니다.`);
            input.value = ""; // 선택 초기화
            return;
        }
    }

    updateFileList(input); // 파일 목록 업데이트
}

// 파일 목록 업데이트
function updateFileList(input) {
    // 새로 선택된 파일 가져오기
    const selectedFiles = Array.from(input.files);

    // 기존 파일과 새로 선택된 파일 병합
    data.fileList = [...data.fileList, ...selectedFiles];
  
 
    // 중복 제거
    data.fileList = data.fileList.filter(
        (file, index, self) =>
            index === self.findIndex((f) => f.name === file.name && f.size === file.size)
    );

    drawFileList()
}

function drawFileList(){
    const fileListDiv = document.getElementById("file-list"); // 파일 목록 DOM
    fileListDiv.innerHTML = "";// UI 초기화

    const fileListContainer = document.getElementById("file-list-container"); // 파일 목록 컨테이너
    fileListContainer.style.display = data.fileList.length === 0 ? "none" : "block";// 파일이 있으면 컨테이너 표시

    // 파일 목록 표시
    data.fileList.forEach((file, index) => {
        const fileSizeInKB = (file.size / 1024).toFixed(1); // KB 단위 파일 크기
        const fileRow = `
            <div class="file-item d-flex justify-content-between align-items-center data-index="${index}" data-file-name="${file.name}" data-file-size="${file.size}"border-bottom py-2" 
                 >
                <span>${file.name} (${fileSizeInKB} KB)</span>
                <div class="d-flex align-items-center">
                    <input type="hidden" name="allowDownload[${index}]" value="Y"> <!-- 기본값: Y -->
                    <button type="button" class="btn btn-sm btn-outline-primary allow-download-btn me-2" 
                            data-allow="true" data-index="${index}" onclick="toggleDownload(this, ${index})">
                        <i class="bi bi-arrow-down-circle"></i>
                    </button>
                    <button type="button" class="btn btn-sm btn-outline-danger" 
                            onclick="removeFile(${index}, '${file.name}')">
                        <i class="bi bi-x-circle"></i>
                    </button>
                </div>
            </div>
        `;
        fileListDiv.innerHTML += fileRow;
    });


    // 파일 개수 업데이트
    const fileCountLabel = document.querySelector(".file-count-label");
    if (fileCountLabel) {
        fileCountLabel.textContent = `파일 ${data.fileList}개`;
    }
}

// 다운로드 허용 토글
function toggleDownload(button, index) {
    const hiddenInput = document.querySelector(`input[name="allowDownload[${index}]"]`);
    const isAllowed = button.getAttribute("data-allow") === "true";

    if (isAllowed) {
        button.setAttribute("data-allow", "false");
        button.classList.remove("btn-outline-primary");
        button.classList.add("btn-outline-secondary");
        button.innerHTML = '<i class="bi bi-lock"></i>'; // 다운로드 비활성화 아이콘
        hiddenInput.value = "N";
    } else {
        button.setAttribute("data-allow", "true");
        button.classList.remove("btn-outline-secondary");
        button.classList.add("btn-outline-primary");
        button.innerHTML = '<i class="bi bi-arrow-down-circle"></i>'; // 다운로드 활성화 아이콘
        hiddenInput.value = "Y";
    }

    // 서버로 다운로드 상태 전송
    const fileName = button.closest(".file-item").getAttribute("data-file-name");
    const allowDownload = hiddenInput.value; // 현재 상태 (Y 또는 N)
    
    $.ajax({
        url: "/community/updateDownloadStatus", // 서버 엔드포인트
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({ fileName, allowDownload }), // 서버로 전송할 데이터
        success: function (response) {
            console.log("서버 반영 성공:", response);
        },
        error: function (xhr, status, error) {
            console.error("서버 반영 실패:", xhr, status, error);
            alert("다운로드 상태 업데이트 실패");
        }
    });
}

// 파일 삭제
function removeFile(targetIndex, fileName) {
    data.fileList = data.fileList.filter( (file, index, self) => index !== targetIndex);
    alert(`"${fileName}" 파일이 삭제되었습니다.`);
    drawFileList();
}
