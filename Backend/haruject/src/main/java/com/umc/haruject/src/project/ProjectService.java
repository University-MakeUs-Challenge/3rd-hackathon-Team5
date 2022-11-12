package com.umc.haruject.src.project;

import com.umc.haruject.config.BaseException;
import com.umc.haruject.src.project.model.PostProjectReq;
import com.umc.haruject.src.project.model.PostProjectRes;
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

}
