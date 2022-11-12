package com.umc.haruject.src.home.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class GetHomeRes {
    private int postIdx;
    private int userIdx;
    private int projectIdx;
    private String title;
    private int HeadCount;
    private String position;
    private String framework;
    private String matchStatus;
    private String time;
    private String location;
    private String matchType;
    private String isOffline;
}
