let data = {
    contextPath: "",
    fileList: [],
};

$(document).ready(function () {
    data.contextPath = document.getElementById('context-path').dataset.baseUrl; // Context Path 설정
    const boardNo = $('#boardNo').val(); // Hidden input에서 게시글 번호 가져오기

    // 서버에서 첨부파일 데이터가 있을 경우 처리
    if (Array.isArray(attachedFilesJson)) {
        console.log("첨부파일 데이터:", attachedFilesJson);

        // 유효한 데이터만 fileList에 추가
        attachedFilesJson.forEach((file) => {
            if (file && file.originName) { // null 체크 및 유효성 검사
                data.fileList.push({
                    name: file.originName,
                    size: file.fileSize || 0,
                    allowDownload: file.allowDownload || "Y",
                });
            }
        });

        console.log("파일 리스트 데이터:", data.fileList); // 디버깅 확인
        renderFileList(); // 파일 리스트 렌더링
    } else {
        console.warn("첨부파일 데이터가 올바르지 않습니다.");
    }

    initializeSummernote(); // Summernote 초기화
    loadBoardData(boardNo); // 게시글 데이터 초기화
    $(window).on('resize', syncSummernoteWidth); // 창 크기 변경 시 Summernote 크기 동기화
});

// 게시글 데이터 로드
function loadBoardData(boardNo) {
    $.ajax({
        url: `${data.contextPath}/community/getBoardDetail`, // 서버에서 데이터 가져오는 API
        type: "GET",
        data: { boardNo: boardNo },
        dataType: "json",
        success: function (response) {
            console.log("게시글 데이터:", response);

            // Summernote에 내용 초기화
            $('#summernote').summernote('code', response.boardContent);

            // 파일 리스트 초기화
            if (response.attachedFiles && Array.isArray(response.attachedFiles)) {
                data.fileList = response.attachedFiles.map(file => ({
                    name: file.originName,
                    size: file.fileSize,
                    allowDownload: file.allowDownload || "Y",
                }));
                renderFileList(); // 파일 리스트 렌더링
            }
        },
        error: function (xhr, status, error) {
            console.error("게시글 데이터 불러오기 실패:", error);
            alert("게시글 데이터를 불러오는데 실패했습니다.");
        }
    });
}

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
            ['view', ['fullscreen', 'codeview', 'help']],
        ],
        callbacks: {
            onImageUpload: function (imgs) {
                uploadImages(imgs);
            },
        },
    });
    syncSummernoteWidth(); // 초기 너비 동기화
}

// Summernote 너비 동기화
function syncSummernoteWidth() {
    const wrapperWidth = $('.post-wrapper').width();
    $('.note-editor').css('width', wrapperWidth);
}

// 첨부파일 리스트 렌더링
function renderFileList() {
    const fileListDiv = document.getElementById("file-list");
    fileListDiv.innerHTML = ""; // 기존 리스트 초기화

    if (data.fileList.length === 0) {
        document.getElementById("file-list-container").style.display = "none";
        return;
    }
    data.fileList.forEach((file, index) => {
        const fileSizeInKB = (file.size / 1024).toFixed(1);
        const allowDownload = file.allowDownload === "Y";

        const fileRow = `
            <div class="d-flex align-items-center mb-2">
                <span class="me-3">${file.name} (${fileSizeInKB} KB)</span>
                <button type="button" class="btn btn-sm ${allowDownload ? 'btn-success' : 'btn-secondary'} me-2" onclick="toggleDownload(${index})">
                    <i class="bi ${allowDownload ? 'bi-unlock' : 'bi-lock'}"></i>
                </button>
                <button type="button" class="btn btn-sm btn-danger" onclick="removeFile(${index})">
                    <i class="bi bi-trash"></i>
                </button>
            </div>
        `;
        fileListDiv.innerHTML += fileRow;
    });

    document.getElementById("file-list-container").style.display = data.fileList.length ? "block" : "none";
}

// 다운로드 허용/금지 토글
function toggleDownload(index) {
    const file = data.fileList[index];
    file.allowDownload = file.allowDownload === "Y" ? "N" : "Y";
    renderFileList(); // UI 업데이트
}

// 파일 삭제
function removeFile(index) {
    if (confirm("파일을 삭제하시겠습니까?")) {
        data.fileList.splice(index, 1);
        renderFileList(); // UI 업데이트
    }
}

// 이미지 업로드 처리
function uploadImages(imgs) {
    const fd = new FormData();
    imgs.forEach(img => fd.append("fileList", img));

    $.ajax({
        url: `${data.contextPath}/community/upload`,
        type: "POST",
        data: fd,
        processData: false,
        contentType: false,
        success: function (response) {
            response.forEach(filePath => {
                $('#summernote').summernote('insertImage', filePath);
            });
        },
        error: function () {
            alert("이미지 업로드에 실패했습니다.");
        },
    });
}

// 게시글 수정 요청
$('#postForm').on('submit', function (e) {
    e.preventDefault(); // 기본 동작 막기

    const boardContent = $('#summernote').summernote('code'); // Summernote 내용
    const formData = new FormData(this); // 기존 폼 데이터
    formData.append("boardContent", boardContent); // Summernote 내용 추가
    formData.append("fileList", JSON.stringify(data.fileList)); // 파일 리스트 추가

    $.ajax({
        url: `${data.contextPath}/community/update`, // 수정 요청 API
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (response) {
            console.log("수정 성공:", response);
            alert("게시글이 성공적으로 수정되었습니다.");
            window.location.href = `${data.contextPath}/community/detail?bno=${response.boardNo}`; // 상세 페이지로 이동
        },
        error: function (xhr, status, error) {
            console.error("수정 실패:", error);
            alert("게시글 수정에 실패했습니다.");
        }
    });
});
