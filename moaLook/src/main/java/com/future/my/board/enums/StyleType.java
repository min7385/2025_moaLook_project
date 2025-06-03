package com.future.my.board.enums;

public enum StyleType {
    // Enum 상수 정의: (코드값, 설명)
    CASUAL_BUSINESS(1, "[캐주얼/비즈니스 캐주얼]"),
    DANDY_MINIMAL(2, "[댄디/미니멀]"),
    CLASSIC(3, "[클래식]"),
    STREET_VINTAGE(4, "[스트릿/빈티지]"),
    SPORTY(5, "[스포티]"),
    UNKNOWN(0, "[알 수 없음]"); // 정의되지 않거나 기본값으로 사용될 경우를 위한 상수

    private final int code;
    private final String description;

    // 생성자
    StyleType(int code, String description) {
        this.code = code;
        this.description = description;
    }

    // 코드값을 가져오는 Getter
    public int getCode() {
        return code;
    }

    // 설명을 가져오는 Getter
    public String getDescription() {
        return description;
    }

    /**
     * 주어진 코드값에 해당하는 StyleType의 설명을 반환
     * 일치하는 코드값이 없으면 "알 수 없음"을 반환
     */
    public static String getDescriptionByCode(int code) {
        for (StyleType type : StyleType.values()) {
            if (type.getCode() == code) {
                return type.getDescription();
            }
        }
        return UNKNOWN.getDescription();
    }
}