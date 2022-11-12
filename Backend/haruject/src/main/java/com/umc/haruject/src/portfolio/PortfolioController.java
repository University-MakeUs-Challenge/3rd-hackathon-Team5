package com.umc.haruject.src.portfolio;

import com.umc.haruject.config.BaseException;
import com.umc.haruject.config.BaseResponse;
import com.umc.haruject.src.portfolio.model.GetPortRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.awt.*;

@RestController
@RequestMapping("/portfolio")
public class PortfolioController {

    @GetMapping("/test")
    public String test() {
        return "hello";
    }

//    @Autowired
//    private final PortfolioProvider portfolioProvider;
////    @Autowired
////    private final PortfolioService portfolioService;
//
//    public PortfolioController(PortfolioProvider portfolioProvider) { //, PortfolioService portfolioService) {
//        this.portfolioProvider = portfolioProvider;
////        this.portfolioService = portfolioService;
//    }
//
//    // 개인 포폴 조회
//    @ResponseBody
//    @GetMapping("/userIdx")
//    public BaseResponse<GetPortRes> getUser(@PathVariable("idx") int idx) {
//        try {
//            GetPortRes getPortRes = portfolioProvider.getPortfolio(idx);
//            return new BaseResponse<>(getPortRes);
//        } catch (BaseException exception) {
//            return new BaseResponse<>((exception.getStatus()));
//        }
//
//    }
//
//    // 전체 포폴들 조회
}
