package com.umc.haruject.src.project;

import com.umc.haruject.config.BaseException;
import com.umc.haruject.config.BaseResponse;
import com.umc.haruject.src.project.model.PostProjectReq;
import com.umc.haruject.src.project.model.PostProjectRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/projects")
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
    @PostMapping("")
    public BaseResponse<PostProjectRes> createProject(@RequestBody PostProjectReq postProjectReq) {
        try{

            PostProjectRes postProjectRes = projectService.createProject(postProjectReq);

            return new BaseResponse<>(postProjectRes);

        } catch(BaseException exception){
            return new BaseResponse<>((exception.getStatus()));
        }
    }

}
