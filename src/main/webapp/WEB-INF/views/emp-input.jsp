<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>员工添加页面</title>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script>
		$(function(){
			$(":input[name=lastName]").change(function(){
				
				var val=$(this).val();
				val=$.trim(val);
				var $this = $(this);
				
				if(val!==""){
					//把当前节点后面的font 节点清除
					$this.nextAll("font").remove();
					var url="emp-validateLastName";
					var args={"lastName":val,"time":new Date()};
					$.post(url,args,function(data){
						if(data == "1"){
							$this.after("<font color='green'>LastName可用！</font>");
						}else if(data == "0"){
							$this.after("<font color='red'>LastName不可用！</font>");
						}else{
							alert("服务器错误！");
						}
					})
				}else{
					alert("lastName 不能为空");
					$(this).val("");
					//this.focus();
				}
				
			});
		
		})
	</script>
</head>
<body>

	<h2>Employee Input Page</h2>
	<s:debug></s:debug>
	
	<s:form action="emp-save" method="post">
		<s:if test="id != null">
			LastName:<s:textfield name="lastName" disabled="true"></s:textfield>
			<s:hidden name="id"></s:hidden>
			<s:hidden name="lastName"></s:hidden>
			<s:hidden name="createTime"></s:hidden>
		</s:if>	
		<s:else>
			LastName:<s:textfield name="lastName"></s:textfield>
		</s:else>
		
		Email:<s:textfield name="email"></s:textfield>
		Birth:<s:textfield name="birth"></s:textfield>
		Department:
		<select name="department.id">
			<s:iterator value="#request.departments">
				<option value=${id }>${departmentName }</option>
			</s:iterator>
		</select>		
		<s:submit></s:submit>
	</s:form>
</body>
</html>