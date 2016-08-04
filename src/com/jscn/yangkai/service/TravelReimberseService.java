package com.jscn.yangkai.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jscn.yangkai.dao.TravelReimberseDAO;
import com.jscn.yangkai.entity.TravelReimberse;

@Service
public class TravelReimberseService {
	@Resource TravelReimberseDAO travelReimberseDAO;
	
	public String addTravelReimberse(TravelReimberse tr) throws Exception{
		return String.valueOf(travelReimberseDAO.addTravelReimberse(tr));
	}
	
	public List<TravelReimberse> queryTravelReimberse(String username)throws Exception{
		return travelReimberseDAO.queryTravelReimberse(username);
	}
	
	public TravelReimberse queryTravelReimburseById(int id)throws Exception{
		return travelReimberseDAO.queryTravelReimburseById(id);
	}
	public void delTravelReimburseById(int id)throws Exception{
		travelReimberseDAO.delTravelReimburseById(id);
	}
	public String updateTravelReimburse(TravelReimberse tr)throws Exception{
		return String.valueOf(travelReimberseDAO.updateTravelReimburse(tr));
	}
	public List<TravelReimberse> queryAllTravelReimburse()throws Exception{
		return travelReimberseDAO.queryAllTravelReimburse();
	}
	public String updateTravelReimburseState(int id,String state) throws Exception{
		return String.valueOf(travelReimberseDAO.updateTravelReimburseState(id, state));
	}
}
