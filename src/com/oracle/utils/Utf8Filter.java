package com.oracle.utils;

import javax.servlet.*;
import java.io.IOException;

public class Utf8Filter implements Filter {
    public void destroy() {
    }

    /**
     * @param req
     * @param resp
     * @param chain 过滤器链 大于等于两个过滤器
     * @throws ServletException
     * @throws IOException
     */
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
