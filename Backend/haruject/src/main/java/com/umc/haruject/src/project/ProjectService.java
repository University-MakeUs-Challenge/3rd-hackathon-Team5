package com.umc.haruject.src.project;

import com.umc.haruject.config.BaseException;
import com.umc.haruject.src.post.PostDao;
import com.umc.haruject.src.post.PostProvider;
import com.umc.haruject.src.post.model.PostPostReq;
import com.umc.haruject.src.post.model.PostPostRes;
import com.umc.haruject.src.project.model.PostProjectReq;
import com.umc.haruject.src.project.model.PostProjectRes;
import com.umc.haruject.src.project.model.test;
import org.springframework.stereotype.Service;

import static com.umc.haruject.config.BaseResponseStatus.DATABASE_ERROR;

@Service
public class ProjectService {

    private final ProjectDao projectDao;

    public ProjectService(ProjectDao projectDao) {
        this.projectDao = projectDao;
    }

    public PostProjectRes createProject(PostProjectReq postProjectReq) throws BaseException {
        try{

            int projectIdx = projectDao.insertProject(postProjectReq);

            return new PostProjectRes(projectIdx, postProjectReq.getTime(), postProjectReq.getLocation(),
                    postProjectReq.getMatchType(),postProjectReq.getIsOffline(),postProjectReq.getProjectStatus());
        }
        catch (Exception exception) {
            throw new BaseException(DATABASE_ERROR);
        }
    }

    public test createTest(test test1) throws BaseException {
        try {

            int idx = projectDao.insertTest(test1);

            return test1;
        }
        catch (Exception exception) {
            throw new BaseException(DATABASE_ERROR);
        }
    }
}
