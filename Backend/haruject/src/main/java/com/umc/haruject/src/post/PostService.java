package com.umc.haruject.src.post;

import com.umc.haruject.config.BaseException;
import com.umc.haruject.src.post.model.PostPostApplyReq;
import com.umc.haruject.src.post.model.PostPostApplyRes;
import org.springframework.stereotype.Service;

import static com.umc.haruject.config.BaseResponseStatus.*;


@Service
public class PostService {
    private final PostDao postDao;
    private final PostProvider postProvider;

    public PostService(PostDao postDao, PostProvider postProvider) {
        this.postDao = postDao;
        this.postProvider = postProvider;
    }

    public PostPostApplyRes createApplicant(PostPostApplyReq postPostApplyReq) throws BaseException {
        if (postProvider.checkApplicantUser(postPostApplyReq.getUserIdx()) == 1 && postProvider.checkApplicantPost(postPostApplyReq.getPostIdx())==1) {
            throw new BaseException(POST_APPLY_EXISTS_USER_AND_POST);
        }
        try {
            int applyIdx = postDao.createApplicant(postPostApplyReq);
            return new PostPostApplyRes(applyIdx);

        } catch (Exception exception) {
            System.out.println(exception);
            throw new BaseException(DATABASE_ERROR);
        }
    }


}
