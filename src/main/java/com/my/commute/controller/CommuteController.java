package com.my.commute.controller;

import com.my.commute.model.Commute;
import com.my.commute.service.CommuteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;

@Controller
public class CommuteController {

    @Autowired
    CommuteService commuteService;

    @RequestMapping(value="/commute/work" , method = {RequestMethod.GET, RequestMethod.POST})
//    @GetMapping("/commute/work")
    public String work(Model model, String id, HttpSession session, String startDate, String endDate) {
        id = (String) session.getAttribute("id");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        startDate = sdf.format(cal.getTime());
        cal.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
        endDate = sdf.format(cal.getTime());
        System.out.println(startDate);
        System.out.println(endDate);

        model.addAttribute("commute", commuteService.listWork(id, startDate, endDate));
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
