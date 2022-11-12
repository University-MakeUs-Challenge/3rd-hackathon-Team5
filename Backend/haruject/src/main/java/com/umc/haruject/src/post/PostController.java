package com.umc.haruject.src.post;


import com.umc.haruject.config.BaseException;
import com.umc.haruject.config.BaseResponse;
import com.umc.haruject.config.BaseResponseStatus;
import com.umc.haruject.src.post.model.PostPostReq;
import com.umc.haruject.src.post.model.PostPostRes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/posts")
public class PostController {
    final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private final PostProvider postProvider;
    @Autowired
    private final PostService postService;

    public PostController(PostProvider postProvider, PostService postService){
        this.postProvider = postProvider;
        this.postService = postService;
    }

    @ResponseBody
    @PostMapping("")
    public BaseResponse<PostPostRes> createBread(@RequestBody PostPostReq postPostReq) {
        try{
            //게시물 본문의 길이가 너무 길 때
            if(postPostReq.getContent().length() > 450) {
                return new BaseResponse<>(BaseResponseStatus.POST_POSTS_INVALID_CONTENTS);
            }

            PostPostRes postPostRes = postService.createPost(postPostReq);
            return new BaseResponse<>(postPostRes);

        } catch(BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }

}
