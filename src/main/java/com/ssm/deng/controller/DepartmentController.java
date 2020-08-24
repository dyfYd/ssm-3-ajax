package com.ssm.deng.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.ssm.deng.bean.Department;
import com.ssm.deng.bean.Msg;
import com.ssm.deng.service.DepartmentService;

@RequestMapping("/dept")
@Controller
public class DepartmentController {

	@Autowired
	private DepartmentService department;
	
	@RequestMapping("/put")
	@ResponseBody
	public Msg selectAll() {
		List<Department> list = department.getSelectAll();
		return Msg.success().add("department", list);
	}
	
}
