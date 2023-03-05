package com.my.commute.controller;

import com.my.commute.model.Member;
import com.my.commute.model.Vacation;
import com.my.commute.service.MemberService;
import com.my.commute.service.VacationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class VacationController {
    @Autowired
    VacationService vacationService;

    @Autowired
    MemberService memberService;

    @GetMapping("/commute/vacation")
    public String vacation(Model model, String id, HttpSession session) {
        id = (String) session.getAttribute("id");

        model.addAttribute("vacation", vacationService.listVac(id));

        return "commute/vacation";
    }

    @PostMapping("/regVac")
    @ResponseBody
    public int regVac(Vacation vacation, HttpSession session) {
        vacation.setId((String) session.getAttribute("id"));
        return vacationService.regVac(vacation);
    }

    @PostMapping("/cntVac")
    @ResponseBody
    public float cntVac(String id) {
       try {
           float cntVac = vacationService.cntVac(id);
           return cntVac;
       }catch (NullPointerException e) {
           float cntVac =0;
           return cntVac;
       }
    }

    @PostMapping("/cancelVac/{vacNum}")
    @ResponseBody
    public void cancelVac(@PathVariable int vacNum) {
        vacationService.cancelVac(vacNum);
    }
}
