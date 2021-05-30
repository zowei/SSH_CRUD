package cn.ssh.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import cn.ssh.entity.Employee;


public class EmployeeDao extends BaseDao{
	
	
	
	//根据传入的员工id删除该员工
	public void delete(Integer id) {
		String hql="DELETE FROM Employee e WHERE e.id=?";
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
	}
	
	//获取所有员工列表
	@SuppressWarnings("unchecked")
	public List<Employee> getListEmployee(){
		String hql="FROM Employee e LEFT JOIN FETCH e.department";
		return getSession().createQuery(hql).list();
		
	}
	//添加新员工
	public void saveEmployee(Employee employee) {
		// TODO Auto-generated method stub
		getSession().saveOrUpdate(employee);
	}

	//数据校验
	public Employee getEmpByLastName(String lastName) {
		// TODO Auto-generated method stub
		String hql="FROM Employee e WHERE e.lastName=?";
		Query query = getSession().createQuery(hql).setString(0,lastName);
		return (Employee)query.uniqueResult();
	}
	
	//数据保存
	public Employee getEmpById(Integer id) {
		return (Employee)getSession().get(Employee.class,id);
	}
	
	
	
	
}
