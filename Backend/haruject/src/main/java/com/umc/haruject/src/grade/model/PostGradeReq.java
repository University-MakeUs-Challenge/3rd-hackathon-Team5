package com.umc.haruject.src.grade.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
public class PostGradeReq {
    private int graderIdx;
    private int gradeeIdx;
    private int grade;
    private String time;
    private String communication;
    private String skill;
}
