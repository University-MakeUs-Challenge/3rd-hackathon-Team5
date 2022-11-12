package com.umc.haruject.src.grade;

import com.umc.haruject.config.BaseException;
import com.umc.haruject.src.grade.model.PostGradeReq;
import com.umc.haruject.src.grade.model.PostGradeRes;
import com.umc.haruject.src.home.HomeDao;
import com.umc.haruject.src.home.HomeProvider;
import org.springframework.stereotype.Service;

import static com.umc.haruject.config.BaseResponseStatus.DATABASE_ERROR;


@Service
public class GradeService {
    private final GradeDao gradeDao;
    private final GradeProvider gradeProvider;

    public GradeService(GradeDao gradeDao, GradeProvider gradeProvider) {
        this.gradeDao = gradeDao;
        this.gradeProvider = gradeProvider;
    }

/*
평점 등록
 */
    public PostGradeRes createGrade(int graderIdx, PostGradeReq postGradeReq) throws BaseException {

        try {
        int idx = gradeDao.createGrade(postGradeReq.getGraderIdx(), postGradeReq.getGradeeIdx(), postGradeReq.getGrade(),
                postGradeReq.getTime(), postGradeReq.getCommunication(), postGradeReq.getSkill());
        return new PostGradeRes(idx);

        } catch (Exception exception) {
            System.out.println(exception);
            throw new BaseException(DATABASE_ERROR);
        }

    }

}
