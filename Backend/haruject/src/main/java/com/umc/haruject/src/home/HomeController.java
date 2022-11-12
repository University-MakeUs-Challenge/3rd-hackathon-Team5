package com.umc.haruject.src.home;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
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


}
