package com.umc.haruject.src.project.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PostProjectRes {
    private int projectIdx;
    private String time;
    private String location;
    private String matchType; //선착순 또는 지원
    private String isOffline; //오프라인인가 온라인인가
    private String projectStatus = "진행중"; // 또는 진행 완료
}
