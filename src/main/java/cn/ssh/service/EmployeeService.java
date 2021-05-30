package cn.ssh.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.ssh.dao.EmployeeDao;
import cn.ssh.entity.Employee;

public class EmployeeService {
	
	
	
	private EmployeeDao employeeDao;
	public EmployeeDao getEmployeeDao() {
		return employeeDao;
	}
	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	
	//根据传入的员工id-删除该员工
	@Transactional
	public void delete(Integer id) {
		employeeDao.delete(id);
	}
	
	//获取所有员工数据列表
	public List<Employee> getListEmployee(){
		// TODO Auto-generated method stub
		return employeeDao.getListEmployee();
		
	}
	//添加新员工
	@Transactional
	public void saveEmployee(Employee employee) {
		// TODO Auto-generated method stub
		employeeDao.saveEmployee(employee);
	}

	//数据校验
	public boolean lastNameIsValid(String lastName) {
		// TODO Auto-generated method stub
		return employeeDao.getEmpByLastName(lastName) == null;
	}

	public Employee getEmpById(Integer id) {
		// TODO Auto-generated method stub
		return employeeDao.getEmpById(id);
	}

	

}
