let data = {
    contextPath: "",
    fileList: [],
};

$(document).ready(function () {
    // Context Path 설정
    data.contextPath = document.getElementById('context-path').dataset.baseUrl;

    // attachedFilesJson 데이터 확인
    if (typeof attachedFilesJson !== "undefined" && Array.isArray(attachedFilesJson)) {
        console.log(attachedFilesJson); // attachedFilesJson 내용 확인
    
        attachedFilesJson.forEach((file) => {
            if (file.originName && file.fileSize) {
                data.fileList.push({
                    name: file.originName,
                    size: file.fileSize,
                    allowDownload: file.allowDownload || "Y",
                });
            }
        });
        renderFileList();
    } else {
        console.log("첨부파일 데이터가 존재하지 않거나 올바르지 않습니다.");
    }
    

    // Summernote 초기화
    initializeSummernote();

    // 창 크기 변경 시 Summernote 동기화
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
            ['view', ['fullscreen', 'codeview', 'help']],
        ],
        height: ['1.0', '1.5', '1.75', '2.0'], // 줄 간격 설정
        callbacks: {
            onImageUpload: function (imgs) {
                fileUpload(imgs, data.contextPath); // 이미지 업로드 처리
            },
            onChange: adjustHeight, // 글 내용 변화 시 높이 조정
        },
    });
    syncSummernoteWidth(); // 초기 Summernote 크기 동기화
}

// 파일 리스트 렌더링 함수
function renderFileList() {
    const fileListDiv = document.getElementById("file-list");
    const fileListContainer = document.getElementById("file-list-container");

    fileListDiv.innerHTML = ""; // 기존 리스트 초기화

    // 파일 리스트 렌더링
    data.fileList.forEach((file, index) => {
        const fileSizeInKB = (file.size / 1024).toFixed(1); // KB로 변환
        const allowDownload = file.allowDownload === "Y";

        const fileRow = `
            <div class="file-item d-flex justify-content-between align-items-center">
                <span>${file.name} (${fileSizeInKB} KB)</span>
                <div class="d-flex align-items-center">
                    <button type="button" class="btn btn-sm btn-${allowDownload ? "outline-primary" : "outline-secondary"} me-2"
                            onclick="toggleDownload(this, ${index})">
                        <i class="bi ${allowDownload ? "bi-arrow-down-circle" : "bi-lock"}"></i>
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

    // 파일 리스트 컨테이너 표시/숨기기
    fileListContainer.style.display = data.fileList.length > 0 ? "block" : "none";
}

function removeFile(index, fileName) {
    data.fileList.splice(index, 1); // 해당 파일 삭제
    renderFileList(); // 리스트 다시 렌더링
    console.log(`"${fileName}" 파일이 삭제되었습니다.`);
}

function toggleDownload(button, index) {
    const file = data.fileList[index];
    file.allowDownload = file.allowDownload === "Y" ? "N" : "Y"; // 다운로드 상태 토글
    renderFileList(); // 변경된 상태로 다시 렌더링
}
