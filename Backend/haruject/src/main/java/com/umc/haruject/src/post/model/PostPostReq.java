package com.umc.haruject.src.post.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PostPostReq {
    private int userIdx;
    private String title;
    private String content;
    private int headCount;
    private String position;
    private String framework;

    private Timestamp time;
    private String location;
    private String matchType;
    private String isOffline;
    private String projectStatus;

    //DB에 default 설정 해줄 거면 안 해도 됨
    private String matchStatus = "ING"; // 모집중= ING, 모집완료= END
}
