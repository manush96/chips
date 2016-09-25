package com.elitecore.services;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.elitecore.dto.DBMasterDto;
import com.elitecore.model.DBMaster;

@Service("chartservices")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)

public class chartservices {
	
	
}
