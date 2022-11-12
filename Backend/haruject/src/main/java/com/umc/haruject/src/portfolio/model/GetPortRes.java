package com.umc.haruject.src.portfolio.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
public class GetPortRes {
    private int idx;
    private int userIdx;
    private String position;
    private String framework;
    private String info;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // 나중에 되면 추가할 것
//    private String status;
}


public class GetUserRes {
    private int userIdx;
    private String nickname;
    private String email;
    private String password;
}