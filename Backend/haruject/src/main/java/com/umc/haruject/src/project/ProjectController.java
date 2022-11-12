package com.umc.haruject.src.project;

import com.umc.haruject.config.BaseException;
import com.umc.haruject.config.BaseResponse;
import com.umc.haruject.config.BaseResponseStatus;
import com.umc.haruject.src.post.model.PostPostRes;
import com.umc.haruject.src.project.model.PostProjectReq;
import com.umc.haruject.src.project.model.PostProjectRes;
import com.umc.haruject.src.project.model.test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/posts")
public class ProjectController {

    @Autowired
    private final ProjectService projectService;
    @Autowired
    private final ProjectProvider projectProvider;


    public ProjectController(ProjectProvider projectProvider, ProjectService projectService){
        this.projectProvider = projectProvider;
        this.projectService = projectService;
    }

    @ResponseBody
    @PostMapping("/project")
    public BaseResponse<PostProjectRes> createProject(@RequestBody PostProjectReq postProjectReq) {
        try{

            PostProjectRes postProjectRes = projectService.createProject(postProjectReq);

            return new BaseResponse<>(postProjectRes);

        } catch(BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }

    @ResponseBody
    @PostMapping("/test")
    public BaseResponse<test> test(@RequestBody test test1) {
        try{

            //PostProjectRes postProjectRes = projectService.createProject(postProjectReq);

            projectService.createTest(test1);

            return new BaseResponse<>(test1);

        } catch(BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }

}
