package com.jhta.neocom.util;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.jhta.neocom.model.VisitorCountVo;
import com.jhta.neocom.service.VisitorCountService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@WebListener
public class VisitorCounter implements HttpSessionListener {
    @Autowired
    VisitorCountService service;

    @Override
    public void sessionCreated(HttpSessionEvent arg0) {
        if (arg0.getSession().isNew()) {
            execute(arg0);
        }
    }

    private void execute(HttpSessionEvent arg0) {
        System.out.println("세션 생성!");
        HttpSession session = arg0.getSession();
        HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
                .getRequest();
        // request를 파라미터에 넣지 않고도 사용할수 있도록 설정
        VisitorCountVo vo = new VisitorCountVo();
        vo.setVisit_ip(req.getRemoteAddr());
        vo.setVisit_agent(req.getHeader("User-Agent"));// 브라우저 정보
        vo.setVisit_refer(req.getHeader("referer"));// 접속 전 사이트 정보
        int visitor_hit = service.selectAll().size();

        session.setAttribute("visitor_hit", visitor_hit);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent arg0) {
    }
}