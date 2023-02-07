package com.my.commute.controller;

import com.my.commute.model.Commute;
import com.my.commute.service.CommuteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class CommuteController {

    @Autowired
    CommuteService commuteService;

    @GetMapping("/commute/work")
    public String work(Model model, Commute commute) {
        return "commute/work";
    }

    @PostMapping("/startWork")
    @ResponseBody
    public int startWork(Commute commute, HttpSession session) {
        commute.setId((String) session.getAttribute("id"));
        return commuteService.startWork(commute);
    }

}
