package com.ssm.deng.mapper;

import java.util.List;

import com.ssm.deng.bean.Employee;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Integer empId);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Integer empId);
    
    List<Employee> selectAll();
    
    Employee selectByPrimaryKeyAndDept(Integer empId);
    
    List<Employee> selectAllAndDept();

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
    
    void insertEmployee(Employee record);
    
    Employee selectName(String name);
}