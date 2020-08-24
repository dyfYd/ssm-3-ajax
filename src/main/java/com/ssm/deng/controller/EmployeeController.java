package com.ssm.deng.controller;

import java.lang.reflect.Method;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.deng.bean.Employee;
import com.ssm.deng.bean.Msg;
import com.ssm.deng.service.EmployeeService;

@RequestMapping("/main")
@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employee;
	
	//批量删除
	@RequestMapping("/delectall/{allid}")
	@ResponseBody
	public Msg delectAll(@PathVariable String allid) {
		String[] split = allid.split("-");
		for(int i=0;i<split.length;i++) {
			int num = Integer.parseInt(split[i]);
			employee.delectId(num);
		}
		return Msg.success();
	}
	
	//删除操作
	@RequestMapping("/delect/{empId}")
	@ResponseBody
	public Msg delect(@PathVariable int empId) {
		employee.delectId(empId);		
		return Msg.success();
	}
	
	//修改保存操作
	@RequestMapping(value="/saveUpdate/{empId}",method = RequestMethod.PUT)
	@ResponseBody
	public Msg saveUpdate(Employee good) {
		employee.update(good);
		return Msg.success();
	}
	
	//修改回显操作
    @RequestMapping("/update")
    @ResponseBody
    public Msg update(@RequestParam(value = "empId") int empId) {
    
		Employee id = employee.selectById(empId);
    	return Msg.success().add("emp", id);
    }
	
	//用户名校验
	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg empName(@RequestParam(value = "empName") String empName) {
		int empName1 = employee.empName(empName);
		if(empName1 == 1) {
			return Msg.fail();
		}else {			
			return Msg.success();
		}
	}
	
	//保存操作
	@RequestMapping(value="/save",method = RequestMethod.POST)
	@ResponseBody
	public Msg SaveData(Employee employee1) {
		employee.save(employee1);
		System.out.println(employee1);
		return Msg.success();
	}
	
	
	//使用Ajax方式进行分页,要使用@RequestBody，必须引入jackson依赖
	@RequestMapping("/show")
	@ResponseBody
	public Msg pageAjax(@RequestParam(required = false,defaultValue = "1") int page,
			@RequestParam(required = false,defaultValue = "5") int row) {
		PageHelper.startPage(page, row);
		List<Employee> list = employee.selectAllAndDept();
		PageInfo<Employee> info= new PageInfo<Employee>(list,row);
		//把要传送的数据保存到Msg对象中。
		return Msg.success().add("employee", info);
	}
	
	
	//分页展示
	//@RequestMapping("/show")
	public ModelAndView show(@RequestParam(required = false,defaultValue = "1") int page,
			@RequestParam(required = false,defaultValue = "5") int row) {
		PageHelper.startPage(page, row);
		List<Employee> list = employee.selectAllAndDept();
		ModelAndView mav = new ModelAndView();
		mav.addObject("employee", new PageInfo<Employee>(list,5));
		mav.setViewName("index");
		return mav;
	}
	
	
	
}
