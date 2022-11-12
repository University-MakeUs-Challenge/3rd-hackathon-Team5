package com.umc.haruject.src.post;


import com.umc.haruject.config.BaseException;
import com.umc.haruject.src.post.model.GetPostDetailRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.umc.haruject.config.BaseResponseStatus.EMPTY_USER_OR_POST;

@Service
public class PostProvider {

    private final PostDao postDao;

    @Autowired
    public PostProvider(PostDao postDao){
        this.postDao = postDao;
    }

    public GetPostDetailRes getPostDetail(int postIdx) throws BaseException {
        try{
            GetPostDetailRes getPostDetailRes = postDao.getPostDetail(postIdx);
            return getPostDetailRes;
        }
        catch (Exception exception){
            System.out.println(exception);
            throw new BaseException(EMPTY_USER_OR_POST);
        }
    }

    public int checkApplicantUser(int userIdx) throws BaseException {
        try {
            return postDao.checkApplicantUser(userIdx);
        } catch (Exception exception) {
            System.out.println(exception);
            throw new BaseException(EMPTY_USER_OR_POST);
        }
    }

    public int checkApplicantPost(int postIdx) throws BaseException {
        try {
            return postDao.checkApplicantPost(postIdx);
        } catch (Exception exception) {
            System.out.println(exception);
            throw new BaseException(EMPTY_USER_OR_POST);
        }
    }
}
