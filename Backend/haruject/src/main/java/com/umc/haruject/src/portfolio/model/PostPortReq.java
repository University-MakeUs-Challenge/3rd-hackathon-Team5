package com.umc.haruject.src.portfolio.model;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class PostPortReq {
    // pk 빼고?
    private int userIdx;
    private String position;
    private String framework;
    private String info;
//
//    private Date createdAt;
//    private Date updatedAt;
}
