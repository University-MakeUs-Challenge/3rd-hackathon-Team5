package com.umc.haruject.src.portfolio;

import com.umc.haruject.config.BaseException;
import com.umc.haruject.config.BaseResponse;
import com.umc.haruject.src.portfolio.model.GetPortRes;
import com.umc.haruject.src.portfolio.model.PostPortReq;
import com.umc.haruject.src.portfolio.model.PostPortRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.awt.*;

@RestController
@RequestMapping("/portfolio")
public class PortfolioController {

    @Autowired
    private final PortfolioProvider portfolioProvider;
    @Autowired
    private final PortfolioService portfolioService;

    public PortfolioController(PortfolioProvider portfolioProvider, PortfolioService portfolioService) {
        this.portfolioProvider = portfolioProvider;
        this.portfolioService = portfolioService;
    }

    @GetMapping("/test")
    public String test() {
        return "hello";
    }

    @ResponseBody
    @PostMapping("/create")
    public BaseResponse<PostPortRes> createPortfolio(@RequestBody PostPortReq postPortReq) {
        try {
            PostPortRes PostPortRes = portfolioService.createPortfolio(postPortReq);
            return new BaseResponse<>(PostPortRes);
        } catch (BaseException e) {
            return new BaseResponse<>((e.getStatus()));
        }
    }

    // 개인 포폴 조회
    @ResponseBody
    @GetMapping("/{idx}")
    public BaseResponse<GetPortRes> getUser(@PathVariable("idx") int idx) {
        try {
            GetPortRes getPortRes = portfolioProvider.getPortfolio(idx);
            return new BaseResponse<>(getPortRes);
        } catch (BaseException e) {
            return new BaseResponse<>((e.getStatus()));
        }

    }

    // 전체 포폴들 조회
}
