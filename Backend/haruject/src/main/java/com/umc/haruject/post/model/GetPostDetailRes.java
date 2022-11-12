package com.umc.haruject.post.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

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
    private int userIdx;
}
