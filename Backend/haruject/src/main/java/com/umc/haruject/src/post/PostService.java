package com.umc.haruject.src.post;

import com.umc.haruject.config.BaseException;
import com.umc.haruject.src.post.model.PostPostReq;
import com.umc.haruject.src.post.model.PostPostRes;
import com.umc.haruject.src.project.ProjectService;
import org.springframework.stereotype.Service;

import static com.umc.haruject.config.BaseResponseStatus.DATABASE_ERROR;


@Service
public class PostService {
    private final PostDao postDao;
    private final PostProvider postProvider;

    private final ProjectService projectService;

    public PostService(PostDao postDao, PostProvider postProvider, ProjectService projectService) {
        this.postDao = postDao;
        this.postProvider = postProvider;
        this.projectService = projectService;
    }

    public PostPostRes createPost(PostPostReq postPostReq) throws BaseException {
        try{

            int postIdx = postDao.insertPost(postPostReq);

            return new PostPostRes(postIdx, postPostReq.getProjectIdx());
        }
        catch (Exception exception) {
            throw new BaseException(DATABASE_ERROR);
        }
    }
}
