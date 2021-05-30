package cn.ssh.service;

import java.util.List;

import cn.ssh.dao.DepartmentDao;
import cn.ssh.entity.Department;
import cn.ssh.entity.Employee;

public class DepartmentService {
	
	private DepartmentDao departmentDao;	
	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}
	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	public List<Department> getListDepartment() {
		return  departmentDao.getListDepartment();
	}
	
	
}
