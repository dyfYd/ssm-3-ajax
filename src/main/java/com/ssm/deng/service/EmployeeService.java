package com.ssm.deng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.deng.bean.Employee;
import com.ssm.deng.mapper.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeMapper mapper;
	
	//删除员工
	public void delectId(int empId) {
		mapper.deleteByPrimaryKey(empId);
	}
	//修改员工信息
	public void update(Employee record) {
		mapper.updateByPrimaryKeySelective(record);
	}
	
	//保存员工
	public void save(Employee record) {
		mapper.insertSelective(record);
		
	}
	
	//用户名校验
	public int empName(String name) {
		Employee employee = mapper.selectName(name);
		if(employee != null) {
			return 1;			
		}else {
			return 0;
		}
	}
	
	public Employee selectById(int id) {
		Employee employee = mapper.selectByPrimaryKey(id);
		return employee;
	}
	
	public Employee selectAndDept(int id){
		Employee list = mapper.selectByPrimaryKeyAndDept(id);
		return list;
	}
	
	//查询全部信息包括部门
	public List<Employee> selectAllAndDept(){
		List<Employee> list = mapper.selectAllAndDept();
		return list;
	}
}
