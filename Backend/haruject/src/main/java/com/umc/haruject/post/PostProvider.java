package com.umc.haruject.post;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostProvider {

    private final PostDao postDao;


    @Autowired //readme 참고
    public PostProvider(PostDao postDao) {
        this.postDao = postDao;
    }
}
