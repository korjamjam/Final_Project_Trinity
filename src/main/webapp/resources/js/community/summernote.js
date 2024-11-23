$(document).ready(function () {
    initializeSummernote();

    // 창 크기 변경 시 Summernote 크기 동기화
    $(window).on('resize', syncSummernoteWidth);
});

// Summernote 초기화
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
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ]
    });
    syncSummernoteWidth(); // 초기 너비 동기화
}

// Summernote 너비 동기화
function syncSummernoteWidth() {
    const wrapperWidth = $('.post-wrapper').width();
    $('.note-editor').css('width', wrapperWidth);
}

// 파일 검증 및 목록 업데이트
function checkFileValidation(input) {
    const files = input.files;
    const maxFileSize = 5 * 1024 * 1024; // 최대 파일 크기 5MB
    const maxFileCount = 3; // 최대 파일 개수 3개

    // 파일 개수 체크
    if (files.length > maxFileCount) {
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
    const fileListDiv = document.getElementById("file-list"); // 파일 목록 DOM
    const fileListContainer = document.getElementById("file-list-container"); // 파일 목록 컨테이너
    const dataTransfer = new DataTransfer(); // DataTransfer 객체를 사용하여 파일 관리

    // 기존 파일 정보 수집
    const existingFileElements = Array.from(fileListDiv.querySelectorAll(".file-item"));
    const existingFiles = existingFileElements.map((fileElement) => {
        const fileName = fileElement.getAttribute("data-file-name");
        const fileSize = parseInt(fileElement.getAttribute("data-file-size"), 10);
        return new File([], fileName, { size: fileSize });
    });

    // 새로 선택된 파일 가져오기
    const selectedFiles = Array.from(input.files);

    // 기존 파일과 새로 선택된 파일 병합
    const allFiles = [...existingFiles, ...selectedFiles];

    // 중복 제거
    const uniqueFiles = allFiles.filter(
        (file, index, self) =>
            index === self.findIndex((f) => f.name === file.name && f.size === file.size)
    );

    // UI 초기화
    fileListDiv.innerHTML = "";

    // 파일이 없을 경우 컨테이너 숨기기
    if (uniqueFiles.length === 0) {
        fileListContainer.style.display = "none";
        return;
    }

    // 파일이 있으면 컨테이너 표시
    fileListContainer.style.display = "block";

    // 파일 목록 표시
    uniqueFiles.forEach((file, index) => {
        const fileSizeInKB = (file.size / 1024).toFixed(1); // KB 단위 파일 크기
        const fileRow = `
            <div class="file-item d-flex justify-content-between align-items-center border-bottom py-2" 
                 data-index="${index}" data-file-name="${file.name}" data-file-size="${file.size}">
                <span>${file.name} (${fileSizeInKB} KB)</span>
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-outline-primary allow-download-btn me-2" 
                            data-allow="true" data-index="${index}" onclick="toggleDownload(this)">
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

        // DataTransfer에 파일 추가
        dataTransfer.items.add(file);
    });

    // input.files를 갱신
    input.files = dataTransfer.files;

    // 파일 개수 업데이트
    const fileCountLabel = document.querySelector(".file-count-label");
    if (fileCountLabel) {
        fileCountLabel.textContent = `파일 ${uniqueFiles.length}개`;
    }
}

// 다운로드 허용 토글
function toggleDownload(button) {
    const isAllowed = button.getAttribute("data-allow") === "true";
    if (isAllowed) {
        button.setAttribute("data-allow", "false");
        button.classList.remove("btn-outline-primary");
        button.classList.add("btn-outline-secondary");
        button.innerHTML = '<i class="bi bi-lock"></i>'; // 다운로드 비활성화 아이콘
    } else {
        button.setAttribute("data-allow", "true");
        button.classList.remove("btn-outline-secondary");
        button.classList.add("btn-outline-primary");
        button.innerHTML = '<i class="bi bi-arrow-down-circle"></i>'; // 다운로드 활성화 아이콘
    }
}

// 파일 삭제
function removeFile(index, fileName) {
    const input = document.getElementById("upfile");
    const dataTransfer = new DataTransfer();

    // 삭제 대상 파일 제외하고 다시 추가
    Array.from(input.files).forEach((file, i) => {
        if (i !== index) {
            dataTransfer.items.add(file);
        }
    });

    // input.files 갱신
    input.files = dataTransfer.files;

    // DOM에서 파일 행 제거
    const fileRow = document.querySelector(`[data-index="${index}"]`);
    if (fileRow) fileRow.remove();

    alert(`"${fileName}" 파일이 삭제되었습니다.`);

    // 파일 리스트가 비었을 경우 컨테이너 숨기기
    const fileListDiv = document.getElementById("file-list");
    if (fileListDiv.children.length === 0) {
        document.getElementById("file-list-container").style.display = "none";
    }
}
