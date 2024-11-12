.custom-dropdown {
    position: relative;
    width: 200px;
    font-size: 14px;
    color: #265708;
    cursor: pointer;
}

.selected-option {
    background-color: #f9f9f9;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.dropdown-arrow {
    position: absolute;
    top: 50%;
    right: 10px;
    transform: translateY(-50%);
    color: #265708;
    pointer-events: none;
}

.option-list {
    display: none; /* 처음에는 숨김 */
    position: absolute;
    top: 100%;
    left: 0;
    width: 100%;
    border: 1px solid #ccc;
    background-color: #fff;
    border-radius: 4px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    z-index: 10;
}

.option-item {
    padding: 10px;
    background-color: #f9f9f9;
    border-bottom: 1px solid #ddd;
}

.option-item:hover {
    background-color: #d3e4d1; /* 호버 시 색상 */
}
