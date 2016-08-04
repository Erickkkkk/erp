package com.jscn.yangkai.controller;

import java.math.BigDecimal;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jscn.yangkai.entity.TravelReimberse;
import com.jscn.yangkai.service.TravelReimberseService;

@Controller
@RequestMapping("travel")
public class TravelReimberseController {
	@Resource TravelReimberseService travelReimberseService;
	
	@RequestMapping("addTravelReimberse")
	@ResponseBody
	public String addTravelReimberse(HttpServletRequest request)throws Exception{
		TravelReimberse tr=new TravelReimberse();
		
		tr.setUsername(request.getParameter("username"));
		tr.setName(request.getParameter("name"));
		tr.setLastmodifyusername(request.getParameter("lastmodifyusername"));
		tr.setTravelreason(request.getParameter("travelreason"));
		tr.setStartdate(request.getParameter("startdate"));
		tr.setEnddate(request.getParameter("enddate"));
		tr.setStartplace(request.getParameter("startplace"));
		tr.setEndplace(request.getParameter("endplace"));
		tr.setLeavevehicle(request.getParameter("leavevehicle"));
		BigDecimal leavevehiclecost=new BigDecimal(request.getParameter("leavevehiclecost"));
		tr.setLeavevehiclecost(leavevehiclecost);
		tr.setReturnvehicle(request.getParameter("returnvehicle"));
		BigDecimal returnvehiclecost=new BigDecimal(request.getParameter("returnvehiclecost"));
		tr.setReturnvehiclecost(returnvehiclecost);
		tr.setAccommodationtype(request.getParameter("accommodationtype"));
		BigDecimal accommodationcost=new BigDecimal(request.getParameter("accommodationcost"));
		tr.setAccommodationcost(accommodationcost);
		tr.setAccommodationremark(request.getParameter("accommodationremark"));
		tr.setSubsidytype(request.getParameter("subsidytype"));
		BigDecimal subsidyperday=new BigDecimal(request.getParameter("subsidyperday"));
		tr.setSubsidyperday(subsidyperday);
		tr.setSubsidydays(Integer.parseInt(request.getParameter("subsidydays")));
		BigDecimal subsidysum=new BigDecimal(request.getParameter("subsidysum"));
		tr.setSubsidysum(subsidysum);
		tr.setOthercontent(request.getParameter("othercontent"));
		BigDecimal othercost=new BigDecimal(request.getParameter("othercost"));
		tr.setOthercost(othercost);
		BigDecimal sum=new BigDecimal(request.getParameter("sum"));
		tr.setSum(sum);
		
		return travelReimberseService.addTravelReimberse(tr);
	}
	
	@RequestMapping("queryTravelReimberse")
	public String queryTravelReimberse(HttpServletRequest request) throws Exception{
		request.setAttribute("list", travelReimberseService.queryTravelReimberse(request.getParameter("username")));
		return "myreimberse";
	}
	
	@RequestMapping("queryTravelReimburseById")
	@ResponseBody
	public String queryTravelReimburseById(HttpServletRequest request)throws Exception{
		return JSONArray.fromObject(travelReimberseService.queryTravelReimburseById(Integer.parseInt(request.getParameter("id")))).toString();
	}
	@RequestMapping("delTravelReimburseById")
	public String delTravelReimburseById(HttpServletRequest request)throws Exception{
		travelReimberseService.delTravelReimburseById(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("list", travelReimberseService.queryTravelReimberse(request.getParameter("username")));
		return "myreimberse";
	}
	@RequestMapping("editTravelReimburseById")
	public String editTravelReimburseById(HttpServletRequest request)throws Exception{
		request.setAttribute("tr", travelReimberseService.queryTravelReimburseById(Integer.parseInt(request.getParameter("id"))));
		return "edittravelreimburse";
	}
	@RequestMapping("updateTravelReimburse")
	@ResponseBody
	public String updateTravelReimburse (HttpServletRequest request)throws Exception{
		TravelReimberse tr=new TravelReimberse();
		tr.setId(Integer.parseInt(request.getParameter("id")));
		tr.setLastmodifyusername(request.getParameter("lastmodifyusername"));
		tr.setTravelreason(request.getParameter("travelreason"));
		tr.setStartdate(request.getParameter("startdate"));
		tr.setEnddate(request.getParameter("enddate"));
		tr.setStartplace(request.getParameter("startplace"));
		tr.setEndplace(request.getParameter("endplace"));
		tr.setLeavevehicle(request.getParameter("leavevehicle"));
		BigDecimal leavevehiclecost=new BigDecimal(request.getParameter("leavevehiclecost"));
		tr.setLeavevehiclecost(leavevehiclecost);
		tr.setReturnvehicle(request.getParameter("returnvehicle"));
		BigDecimal returnvehiclecost=new BigDecimal(request.getParameter("returnvehiclecost"));
		tr.setReturnvehiclecost(returnvehiclecost);
		tr.setAccommodationtype(request.getParameter("accommodationtype"));
		BigDecimal accommodationcost=new BigDecimal(request.getParameter("accommodationcost"));
		tr.setAccommodationcost(accommodationcost);
		tr.setAccommodationremark(request.getParameter("accommodationremark"));
		tr.setSubsidytype(request.getParameter("subsidytype"));
		BigDecimal subsidyperday=new BigDecimal(request.getParameter("subsidyperday"));
		tr.setSubsidyperday(subsidyperday);
		tr.setSubsidydays(Integer.parseInt(request.getParameter("subsidydays")));
		BigDecimal subsidysum=new BigDecimal(request.getParameter("subsidysum"));
		tr.setSubsidysum(subsidysum);
		tr.setOthercontent(request.getParameter("othercontent"));
		BigDecimal othercost=new BigDecimal(request.getParameter("othercost"));
		tr.setOthercost(othercost);
		BigDecimal sum=new BigDecimal(request.getParameter("sum"));
		tr.setSum(sum);
		
		return travelReimberseService.updateTravelReimburse(tr);
	}
	
	@RequestMapping("queryAllTravelReimburse")
	public String queryAllTravelReimburse(HttpServletRequest request) throws Exception{
		request.setAttribute("list", travelReimberseService.queryAllTravelReimburse());
		return "reimbursecheck";
	}
	@RequestMapping("delTravelReimburse")
	public String delTravelReimburse(HttpServletRequest request)throws Exception{
		travelReimberseService.delTravelReimburseById(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("list", travelReimberseService.queryAllTravelReimburse());
		return "reimbursecheck";
	}
	@RequestMapping("updateTravelReimburseState")
	@ResponseBody
	public String updateTravelReimburseState(HttpServletRequest request)throws Exception{
		return travelReimberseService.updateTravelReimburseState(Integer.parseInt(request.getParameter("id")), request.getParameter("state"));
	}

}
