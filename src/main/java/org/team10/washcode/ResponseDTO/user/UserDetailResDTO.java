package org.team10.washcode.ResponseDTO.user;

import lombok.Setter;

import java.sql.Timestamp;

@Setter
public class UserDetailResDTO {
    // 회원 목록 조회 (관리자)
    private int user_id;
    private String email;
    private String name;
    private String address;
    private String phone;
    private String role;
    private Timestamp create_at;
}