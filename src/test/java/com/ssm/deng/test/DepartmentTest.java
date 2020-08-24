package com.ssm.deng.test;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ssm.deng.bean.Department;
import com.ssm.deng.bean.Employee;
import com.ssm.deng.mapper.DepartmentMapper;
import com.ssm.deng.mapper.EmployeeMapper;
import com.ssm.deng.service.DepartmentService;
import com.ssm.deng.service.EmployeeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-mybatis.xml"})
public class DepartmentTest {

	@Autowired
	private DepartmentMapper dept;
	@Autowired
	private EmployeeService emp;
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private EmployeeMapper empm;
	
	@Test
	public void test1() {
		ApplicationContext sxc= new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");
		DepartmentService bean = sxc.getBean(DepartmentService.class);
		List<Department> list = bean.getSelectAll();
		for(Department a:list) {
			System.out.println(a);			
		}
	}
	
	@Test
	public void test2() {
		ApplicationContext sxc= new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");
		EmployeeService bean = sxc.getBean(EmployeeService.class);
		Employee employee = bean.selectAndDept(1);
		
			System.out.println(employee);			
	}
	
	@Test
	public void test5() {
		List<Employee> list = empm.selectAllAndDept();
		for(Employee a : list) {
			System.out.println(a);
		}
		
	}
	
	
	@Test
	public void test3() {
		Department department = dept.selectByPrimaryKey(1);
		System.out.println(department);		
	}
	@Test
	public void test4() {
//		Employee employee = emp.selectById(1);
//		System.out.println(employee);	
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for(int i = 0;i<100;i++) {
			String substring = UUID.randomUUID().toString().substring(0, 5)+i;
			mapper.insertSelective(new Employee(null,"substring","m",substring+"@qq",1));
		}
		System.out.println("批量完成");
	}
	
	@Test
    public void test6() {
		Employee record = new Employee();
		record.setEmpName("qwe");
		record.setGender("男");
		record.setEmail("3258740");
		record.setdId(1);
		emp.save(record);
	}
	
	@Test
	public void test7() {
		int empName = emp.empName("猴子");
		System.out.println(empName);
	}
}
