package com.umc.haruject.src.post.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class PostPostApplyReq {
    private String matchStatus;
    private int userIdx;
    private int postIdx;
}
