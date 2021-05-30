package cn.ssh.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.hibernate.event.spi.SaveOrUpdateEvent;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import cn.ssh.entity.Employee;
import cn.ssh.service.DepartmentService;
import cn.ssh.service.EmployeeService;

public class EmployeeAction extends ActionSupport implements RequestAware,ModelDriven<Employee>,Preparable{
		
	private Employee model;
	private EmployeeService employeeService;
	private DepartmentService departmentService;
	
	public EmployeeService getEmployeeService() {
		return employeeService;
	}
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}


	

	private static final long serialVersionUID=1L;
	//获取所有员工列表
	public String list() {
		System.out.println("已经进入到list的方法中了---------------------------------------------------------------------------------------------------------------------------------------------------");
		request.put("employees",employeeService.getListEmployee());
		System.out.println("list方法查询完毕--------------------------------------------------------------------------------------------------------------------------------------------------------------");
		return "list";
	}
	
	
	private Integer id;
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	private InputStream inputStream;
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
	
	//根据传入id-删除该员工
	public String delete() throws UnsupportedEncodingException {
		System.out.println("已经进入到delete方法当中了--------------------------------------------------------------------------------------------------------------------------------------------------------------");
		try {
			employeeService.delete(id);
			inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
			inputStream=new ByteArrayInputStream("0".getBytes("UTF-8"));
		}
		System.out.println("delete方法执行完毕--------------------------------------------------------------------------------------------------------------------------------------------------------------------");
		return "ajax-success";
	}
	
	
	
	//在进入Input 之前执行的方法
	public void prepareInput() {
		if(id != null) {
			model = employeeService.getEmpById(id);
		}	
	}
	//进入添加或者修改页面--获取所有的部门信息--塞入前台下拉框中
	public String input() {
		System.out.println("已经进入到input方法当中了---------------------------------------------------------------------------------------------------------------------------------------------------------------------------");				
		request.put("departments", departmentService.getListDepartment());
		System.out.println("input方法执行完毕---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
		return "input";
	}		
	

	
	private Map<String, Object> request;
	@Override
	public void setRequest(Map<String, Object> request) {
		// TODO Auto-generated method stub
		this.request=request;
	}
	
	
	
	//添加新的员工并保存到数据库
	public String save() {
		System.out.println("已经进入到save方法当中了---------------------------------------------------------------------------------------------------------------------------------------------------------------------");
		if(id == null) {
			model.setCreateTime(new Date());
		}
		System.out.println(model);
		employeeService.saveEmployee(model);
		System.out.println("save方法执行完毕---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
		return "success";
	}
	
	/* 在进入save之前执行的方法
	   *    可以根据Id是否为空，来判断model 是新new的，还是从数据库中查询的
	 * */
	public void prepareSave() {
		if(id == null) {
			model=new Employee();
		}else {
			model = employeeService.getEmpById(id);
		}
	}
	@Override
	public void prepare() throws Exception {}
	@Override
	public Employee getModel() {
		// TODO Auto-generated method stub
		return model;
	}
	
	
	private String lastName;
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	//数据校验
	public String validateLastName() throws UnsupportedEncodingException {
		System.out.println("已经进入到validateLastName方法当中了----------------------------------------------------------------------------------------------------");
		if(employeeService.lastNameIsValid(lastName)) {
			inputStream=new ByteArrayInputStream("1".getBytes("UTF-8"));
		}else {
			inputStream=new ByteArrayInputStream("0".getBytes("UTF-8"));
		}
		System.out.println("validateLastName方法执行完毕------------------------------------------------------------------------------------------------------------------");
		return "ajax-success";
	}
	
	
	
	
}
