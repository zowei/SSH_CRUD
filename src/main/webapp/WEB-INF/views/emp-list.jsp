<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>员工信息展示页面</title>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
	<div>
		<h2>下面是所有员工数据：</h2>
		<s:debug></s:debug>
		<s:if test="#request.employees == null || #request.employees.size() == 0">
			没有任何员工信息
		</s:if>
		<s:else>
			<table border="1" cellpadding="10" cellspacing="0">
				<tr>
					<td>ID</td>
					<td>LASTNAME</td>
					<td>EMAIL</td>
					<td>BIRTH</td>
					<td>CREATETIME</td>
					<td>DEPT</td>
					<td>删除Button</td>	
					<td>修改Button</td>				
				</tr>
				<s:iterator value="#request.employees">
					<tr>
						<td>${id }</td>
						<td>${lastName }</td>
						<td>${email }</td>
						<td>
							<s:date name="birth" format="yyyy-MM-dd"></s:date>
						</td>
						<td>
							<s:date name="createTime" format="yyyy-MM-dd hh:mm:ss"></s:date>
						</td>
						<td>${department.departmentName }</td>	
						<td>
							<input type="hidden" value="${id }"/>
							<a href="javascript:void(0);" class="delete">Delete</a>
							<input type="hidden" value="${lastName }"/>
						</td>	
						<td>
							<a href="emp-input?id=${id }" class="edit">EDIT</a>
						</td>				
					</tr>
				</s:iterator>
			</table>
		
		</s:else>
	
	</div>
	<script type="text/javascript">
		$(function(){			
			//1.点击删除按钮后添加确定环节
			$(".delete").click(function(){
				var $tr=$(this).parent().parent();
				var lastName=$(this).next(":hidden").val();
				var flag=confirm("你确定要删除"+lastName+"数据信息吗？");				
				if(flag){
					//使用Ajax方式删除
					var url="emp-delete?id="+$(this).prev(":hidden").val();
					var data={"time" : new Date()};
					$.post(url,data,function(response){							
						//若返回值为1，则删除成功
						if(response=="1"){
							alert("删除成功！");							
							$tr.remove();
						}else{
							//若返回值为不是1，则提示删除失败
							alert("删除失败！");							
						}										
					})
				}		
			})			
		})
	</script>		
</body>

</html>