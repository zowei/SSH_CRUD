package cn.ssh.dao;

import java.util.List;

import cn.ssh.entity.Department;
import cn.ssh.entity.Employee;

public class DepartmentDao extends BaseDao{

	
	
	//获取所有员工列表
	@SuppressWarnings("unchecked")
	public List<Department> getListDepartment(){
		String hql="FROM Department";
		return getSession().createQuery(hql).list();
		
	}

	
}
