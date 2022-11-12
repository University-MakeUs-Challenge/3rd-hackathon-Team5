package com.umc.haruject.src.post;

import com.umc.haruject.config.BaseException;
import com.umc.haruject.src.post.model.PostPostReq;
import com.umc.haruject.src.post.model.PostPostRes;
import org.springframework.stereotype.Service;

import static com.umc.haruject.config.BaseResponseStatus.DATABASE_ERROR;


@Service
public class PostService {
    private final PostDao postDao;
    private final PostProvider postProvider;

    public PostService(PostDao postDao, PostProvider postProvider) {
        this.postDao = postDao;
        this.postProvider = postProvider;
    }

    public PostPostRes createPost(PostPostReq postPostReq) throws BaseException {
        try{

            int projectIdx = postDao.insertProject(postPostReq);
            int postIdx = postDao.insertPost(projectIdx, postPostReq);

            return new PostPostRes(postIdx,projectIdx);
        }
        catch (Exception exception) {
            throw new BaseException(DATABASE_ERROR);
        }
    }
}
