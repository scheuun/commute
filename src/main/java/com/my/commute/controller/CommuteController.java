package com.my.commute.controller;

import com.my.commute.model.Commute;
import com.my.commute.model.Member;
import com.my.commute.service.CommuteService;
import com.my.commute.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

@Controller
public class CommuteController {

    @Autowired
    CommuteService commuteService;
    @Autowired
    MemberService memberService;



    @RequestMapping(value="/commute/work" , method = {RequestMethod.GET, RequestMethod.POST})
    public String work(Model model, String id, HttpServletRequest httpServletRequest, HttpSession session, String startDate, String endDate) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        startDate = sdf.format(cal.getTime());
        cal.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
        endDate = sdf.format(cal.getTime());

        id = (String) session.getAttribute("id");
        Member member = memberService.myPage(id);

        if (httpServletRequest.getParameter("startDate") != null && httpServletRequest.getParameter("endDate") != null) {
            startDate = httpServletRequest.getParameter("startDate");
            endDate = httpServletRequest.getParameter("endDate");
        }

        model.addAttribute("commute", commuteService.listWork(id, startDate, endDate));
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("startWork", member.getStartWork());
        model.addAttribute("endWork", member.getEndWork());
        model.addAttribute("startWork", member.getStartWork());
        model.addAttribute("endWork", member.getEndWork().plusHours(2));

        return "commute/work";
    }

    @PostMapping("/startWork")
    @ResponseBody
    public int startWork(Commute commute, HttpSession session) {
        commute.setId((String) session.getAttribute("id"));
        return commuteService.startWork(commute);
    }

    @PostMapping("/endWork")
    @ResponseBody
    public void endWork(Commute commute) {
        commuteService.endWork(commute);
    }

    @PostMapping("/chkWork")
    @ResponseBody
    public int chkWork(String id) {
        int cnt = commuteService.chkWork(id);
        return cnt;
    }
}
