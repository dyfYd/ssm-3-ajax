package com.ssm.deng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.ssm.deng.bean.Department;
import com.ssm.deng.mapper.DepartmentMapper;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentMapper mapper;	
	
	public Department getSelect(int id) {
		Department dept = mapper.selectByPrimaryKey(id);
		return dept;
	}
	
	public List<Department> getSelectAll(){
		List<Department> list = mapper.selectAll();
		return list;		
	}
	
	
}
