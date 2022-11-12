package com.umc.haruject.src.portfolio.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
public class GetPortRes {
    private int idx;
    private int userIdx;
    private String position;
    private String framework;
    private String info;

    private Date createdAt;
    private Date updatedAt;

    // 나중에 되면 추가할 것
//    private String status;
}
