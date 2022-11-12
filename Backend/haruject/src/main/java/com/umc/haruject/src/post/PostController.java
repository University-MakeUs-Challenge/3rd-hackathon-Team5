package com.umc.haruject.src.post;


import com.umc.haruject.config.BaseException;
import com.umc.haruject.config.BaseResponse;
import com.umc.haruject.src.post.model.GetPostDetailRes;
import com.umc.haruject.src.post.model.PostPostApplyReq;
import com.umc.haruject.src.post.model.PostPostApplyRes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import static com.umc.haruject.config.BaseResponseStatus.*;

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
    @GetMapping("/{postIdx}")
    public BaseResponse<GetPostDetailRes> getPostDetail(@PathVariable("postIdx") int postIdx) {
        try {
            GetPostDetailRes getUserRes = postProvider.getPostDetail(postIdx);
            return new BaseResponse<>(getUserRes);
        } catch (BaseException exception) {
            return new BaseResponse<>((exception.getStatus()));
        }
    }

    @ResponseBody
    @PostMapping("/{postIdx}")
    public BaseResponse<PostPostApplyRes> postPostApply(@PathVariable("postIdx") int postIdx, @RequestBody PostPostApplyReq postPostApplyReq){
        if(postPostApplyReq.getPostIdx()==0){
            return new BaseResponse<>(EMPTY_USER_OR_POST);
        }
        if(postPostApplyReq.getUserIdx()==0){
            return new BaseResponse<>(EMPTY_USER_OR_POST);
        }
        try {
            PostPostApplyRes postPostApplyRes = postService.createApplicant(postPostApplyReq);
            return new BaseResponse<>(postPostApplyRes);
        } catch (BaseException exception) {
            return new BaseResponse<>((exception.getStatus()));
        }
    }

}
