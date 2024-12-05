const fileList = ${fileList};

console.log("첨부파일 목록:", fileList);

$(document).ready(function () {
   
    console.log("문서가 준비되었습니다.");  // 로그 추가

    // Initialize Summernote
    initializeSummernote();

    // 창 크기 변경 시 Summernote 크기 동기화
    $(window).on('resize', syncSummernoteWidth);

    // File upload event listener
    $("#upfiles").on("change", handleFileUpload);

});

function initializeSummernote() {
    $('#summernote').summernote({
        minHeight: 400,
        placeholder: '글을 수정하세요.',
        tabsize: 2,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['height', 'ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ]
    });
    syncSummernoteWidth(); // 초기 너비 동기화
}

function syncSummernoteWidth() {
    const wrapperWidth = $('.post-wrapper').width();
    $('.note-editor').css('width', wrapperWidth);
}




function drawFileList() {
    
    const fileListDiv = document.getElementById("file-list");
    console.log("제발 첨부파일 목록:", fileList);
    fileListDiv.innerHTML = ""; // 기존 UI 초기화

    formData.fileList.forEach((file, index) => {
        const fileSizeInKB = (file.size / 1024).toFixed(1);
        const allowDownloadValue = file.allowDownload === "Y";

        const fileRow = `
           <div class="file-item d-flex justify-content-between align-items-center" data-index="${index}">
                <span>${file.originName} (${(file.size / 1024).toFixed(1)} KB)</span>
                <div class="d-flex align-items-center">
                    <!-- 다운로드 허용 버튼 -->
                    <button type="button" 
                            class="btn btn-sm ${file.allowDownload === 'Y' ? 'btn-outline-primary' : 'btn-outline-secondary'} me-2"
                            data-allow="${file.allowDownload}" 
                            onclick="toggleDownload(this, ${file.fileNo})">
                        <i class="bi ${file.allowDownload === 'Y' ? 'bi-arrow-down-circle' : 'bi-lock'}"></i>
                    </button>

                    <!-- 삭제 버튼 -->
                    <button type="button" class="btn btn-sm btn-outline-danger" onclick="removeExistingFile(${file.fileNo})">
                        <i class="bi bi-x-circle"></i>
                    </button>
                </div>
            </div>`;
        fileListDiv.innerHTML += fileRow;
    });
}

function toggleDownload(button, index) {
    const isAllowed = $(button).data("allow");
    const newStatus = !isAllowed;

    $(button).data("allow", newStatus);
    $(button).toggleClass("btn-outline-primary btn-outline-secondary");
    $(button).find("i").toggleClass("bi-arrow-down-circle bi-lock");

    formData.fileList[index].allowDownload = newStatus ? "Y" : "N";
}

function handleFileUpload(event) {
    const files = event.target.files;

    Array.from(files).forEach((file) => {
        const fileSizeInKB = (file.size / 1024).toFixed(1);
        formData.fileList.push({
            name: file.name,
            size: file.size,
            allowDownload: "Y", // 기본적으로 다운로드 허용
            new: true // 새로 추가된 파일 표시
        });
    });

    drawFileList(); // UI 업데이트
}

function removeFile(index) {
    const file = formData.fileList[index];
    if (file.new) {
        // 새로 업로드된 파일 삭제
        formData.fileList.splice(index, 1);
        drawFileList(); // UI 업데이트
    } else {
        // 기존 파일 삭제 요청
        if (confirm("이 파일을 삭제하시겠습니까?")) {
            $.ajax({
                url: `${formData.contextPath}/community/deleteFile`,
                type: "POST",
                data: { fileName: file.name },
                success: () => {
                    formData.fileList.splice(index, 1);
                    drawFileList(); // UI 업데이트
                },
                error: (error) => {
                    console.error("Failed to delete file:", error);
                }
            });
        }
    }
}
