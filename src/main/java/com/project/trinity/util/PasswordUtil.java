package com.project.trinity.util;

import org.apache.commons.lang3.RandomStringUtils;

public class PasswordUtil {
    public static String generateTemporaryPassword() {
        return RandomStringUtils.randomAlphanumeric(10); // 10자리 임시 비밀번호 생성
    }
}
