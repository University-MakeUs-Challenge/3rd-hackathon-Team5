package com.umc.haruject.src.grade;



import com.umc.haruject.config.BaseException;
import com.umc.haruject.config.BaseResponse;
import com.umc.haruject.config.BaseResponseStatus;
import com.umc.haruject.src.grade.model.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/grade")
public class GradeController {
    final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private final GradeProvider gradeProvider;

    @Autowired
    private final GradeService gradeService;

    public GradeController(GradeProvider gradeProvider, GradeService gradeService) {
        this.gradeProvider = gradeProvider;
        this.gradeService = gradeService;
    }

    /*
    평점 등록
     */
    @ResponseBody
    @PostMapping("")
    public BaseResponse<PostGradeRes> createGrade(@RequestBody PostGradeReq postGradeReq){
        try {
            if(postGradeReq.getGrade() < 1){
                return new BaseResponse<>(BaseResponseStatus.GRADE_IS_EMPTY);
            }

            if(postGradeReq.getTime().length() < 1){
                return new BaseResponse<>(BaseResponseStatus.RATE_IS_EMPTY);
            }

            if(postGradeReq.getCommunication().length() < 1){
                return new BaseResponse<>(BaseResponseStatus.RATE_IS_EMPTY);
            }

            if(postGradeReq.getSkill().length() < 1){
                return new BaseResponse<>(BaseResponseStatus.RATE_IS_EMPTY);
            }

             PostGradeRes postGradeRes = gradeService.createGrade(postGradeReq.getGraderIdx(), postGradeReq);
            return new BaseResponse<>(postGradeRes);
        } catch (BaseException exception) {
            return new BaseResponse<>(exception.getStatus());
        }
    }




}
