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
    private int projectIdx;
    private String title;
    private String content;
    private int headCount;
    private String position;
    private String framework;
    private String matchStatus = "ING"; // 모집중= ING, 모집완료= END
}
