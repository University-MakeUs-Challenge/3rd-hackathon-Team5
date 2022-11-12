package com.umc.haruject.src.post.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
public class GetPostDetailRes {
    private String title;
    private String content;
    private int headCount;
    private String position;
    private String framework;
    private String matchStatus;
    private String nickName;
    private Timestamp time;
    private String location;
    private String matchType;
    private String isOffline;
}

