let data = {
    contextPath: "",
    fileList: [],
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
                fileUpload(imgs); // contextPath를 전달
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

function fileUpload(imgs) {
    const fd = new FormData();
    for (let i = 0; i < imgs.length; i++) {
        fd.append("fileList", imgs[i]);
    }

    $.ajax({
        url: `${data.contextPath}/community/upload`, // 템플릿 리터럴로 수정
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

    if (data.fileList.length + files.length > maxFileCount) {
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

function updateFileList(input) {
    const selectedFiles = Array.from(input.files);
    data.fileList = [...data.fileList, ...selectedFiles];

    data.fileList = data.fileList.filter(
        (file, index, self) =>
            index === self.findIndex((f) => f.name === file.name && f.size === file.size)
    );

    drawFileList();
}

function drawFileList() {
    const fileListDiv = document.getElementById("file-list");
    fileListDiv.innerHTML = ""; // UI 초기화

    const fileListContainer = document.getElementById("file-list-container");
    fileListContainer.style.display = data.fileList.length === 0 ? "none" : "block";

    data.fileList.forEach((file, index) => {
        const fileSizeInKB = (file.size / 1024).toFixed(1);
        const allowDownloadValue = file.allowDownload || "Y";

        const fileRow = `
            <div class="file-item d-flex justify-content-between align-items-center"
                 data-index="${index}" data-file-name="${file.name}" data-file-size="${file.size}">
                <span>${file.name} (${fileSizeInKB} KB)</span>
                <div class="d-flex align-items-center">
                    <input type="hidden" name="allowDownload" id="allowDownload${index}" value="${allowDownloadValue}">
                    <button type="button" class="btn btn-sm btn-outline-primary allow-download-btn me-2"
                            data-allow="${allowDownloadValue === 'Y'}" data-index="${index}"
                            onclick="toggleDownload(this, ${index})">
                        <i class="bi ${allowDownloadValue === 'Y' ? 'bi-arrow-down-circle' : 'bi-lock'}"></i>
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
}

function toggleDownload(button, index) {
    const hiddenInput = document.querySelector(`#allowDownload${index}`);
    const isAllowed = button.getAttribute("data-allow") === "true";

    if (isAllowed) {
        button.setAttribute("data-allow", "false");
        button.classList.remove("btn-outline-primary");
        button.classList.add("btn-outline-secondary");
        button.innerHTML = '<i class="bi bi-lock"></i>';
        hiddenInput.value = "N";
    } else {
        button.setAttribute("data-allow", "true");
        button.classList.remove("btn-outline-secondary");
        button.classList.add("btn-outline-primary");
        button.innerHTML = '<i class="bi bi-arrow-down-circle"></i>';
        hiddenInput.value = "Y";
    }
}

function removeFile(targetIndex, fileName) {
    data.fileList = data.fileList.filter((file, index) => index !== targetIndex);
    alert(`"${fileName}" 파일이 삭제되었습니다.`);
    drawFileList();
}
