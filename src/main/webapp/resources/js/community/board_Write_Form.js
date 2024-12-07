let attFile = {
    fileList: [] // 파일 리스트를 관리하는 배열
};

$(document).ready(function () {
   
   

    // 창 크기 변경 시 Summernote 크기 동기화
    $(window).on('resize', syncSummernoteWidth);
    initializeSummernote();
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
        fd.append("imgList", imgs[i]);
    }

    $.ajax({
        url: contextPath + "/community/imgUpload", // 템플릿 리터럴로 수정
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

function updateFileList(input) {
    const selectedFiles = Array.from(input.files);
    attFile.fileList = selectedFiles;

    attFile.fileList = attFile.fileList.filter(
        (file, index, self) =>
            index === self.findIndex((f) => f.name === file.name && f.size === file.size)
    );

    drawFileList();
}



function drawFileList() {
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
                    <button type="button" class="btn btn-sm btn-outline-primary allow-download-btn me-2"
                            data-allow="${allowDownloadValue === 'Y'}" data-index="${index}"
                            onclick="toggleDownload(this, ${index})">
                        <i class="bi ${allowDownloadValue === 'Y' ? 'bi-arrow-down-circle' : 'bi-lock'}"></i>
                    </button>
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
function toggleDownload(button, index) {
    const isAllowed = $(button).data("allow");
    const newStatus = !isAllowed;

    $(button).data("allow", newStatus);
    $(button).toggleClass("btn-outline-primary btn-outline-secondary");
    $(button).find("i").toggleClass("bi-arrow-down-circle bi-lock");

    // `attFile.fileList`에 allowDownload 값 업데이트
    attFile.fileList[index].allowDownload = newStatus ? "Y" : "N";
    
    // hidden input 값 업데이트
    const hiddenInput = document.getElementById(`allowDownload${index}`);
    if (hiddenInput) {
        hiddenInput.value = attFile.fileList[index].allowDownload;  // 변경된 값으로 업데이트
    }
}
function removeFile(targetIndex, fileName) {
    attFile.fileList = attFile.fileList.filter((file, index) => index !== targetIndex);
    alert(`"${fileName}" 파일이 삭제되었습니다.`);
    drawFileList();
}
