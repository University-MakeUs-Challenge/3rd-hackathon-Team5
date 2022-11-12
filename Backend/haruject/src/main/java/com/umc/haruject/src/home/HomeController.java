package com.umc.haruject.src.home;



import com.umc.haruject.config.BaseException;
import com.umc.haruject.config.BaseResponse;
import com.umc.haruject.src.home.model.GetHomeRes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/home")
public class HomeController {
    final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private final HomeProvider homeProvider;

    @Autowired
    private final HomeService homeService;

    public HomeController(HomeProvider homeProvider, HomeService homeService) {
        this.homeProvider = homeProvider;
        this.homeService = homeService;
    }

    /*
    홈 화면 (게시글 목록 조회)
     */
    @ResponseBody
    @GetMapping("")
    public BaseResponse<List<GetHomeRes>> getHome(){
        try {
            List<GetHomeRes> getHomeRes = homeProvider.getHome();
            return new BaseResponse<>(getHomeRes);
        } catch (BaseException exception) {
            return new BaseResponse<>(exception.getStatus());
        }
    }




}
