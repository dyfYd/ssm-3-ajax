<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="lic/base_path.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="static/js/jquery-1.12.4.min.js"></script>
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

   <!-- Modal员工修改 -->
	<div class="modal fade" id="emp_update_add" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">

					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">姓名：</label>
							<div class="col-sm-10">
							    
								<p class="form-control-static" id="empName_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">Email：</label>
							<div class="col-sm-10">
							    
								<input type="email" class="form-control" id="email_update"
									placeholder="293670@qq.com" name="email">
								<span id="helpBlock2" class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">性别：</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="inlineRadio1" value="男"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="inlineRadio2" value="女"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">部门：</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" id="dept_name_update">

								</select>
							</div>
						</div>					
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="emp_update">修改</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 保存提交模态框 -->
	<div class="modal fade" id="emp_add" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">

					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">姓名：</label>
							<div class="col-sm-10">
							    
								<input type="text" class="form-control" id="empName_input"
									placeholder="empName" name="empName"/>
								<span id="helpBlock2" class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">Email：</label>
							<div class="col-sm-10">
							    
								<input type="email" class="form-control" id="email_input"
									placeholder="293670@qq.com" name="email">
								<span id="helpBlock2" class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">性别：</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="inlineRadio1" value="男"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="inlineRadio2" value="女"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">部门：</label>
							<div class="col-sm-4">
								<select class="form-control" name="dId" id="dept_name_all">

								</select>
							</div>
						</div>					
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="emp_save">保存</button>
				</div>
			</div>
		</div>
	</div>

<!-- 信息展示框 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>CRUD</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button type="button" class="btn btn-success" id="insert_btn">新增</button>
				<button type="button" class="btn btn-danger" id="delect_btn_all">删除</button>
			</div>
		</div>
		<div class="row">
			<table class="table table-hover" id="emp_list">
				<thead>
					<tr>
					    <th>
					    <input type="checkbox" id="all_checkbox"/>
					    </th>
						<th>#</th>
						<th>姓名</th>
						<th>性别</th>
						<th>邮箱</th>
						<th>部门</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

				</tbody>

			</table>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-6" id="page-1">
				<!-- 当前第页；总共页；总共条记录 -->
			</div>
			<!-- 显示分页条 -->
			<div class="col-md-6" id="page-2"></div>
		</div>
	</div>
	<script type="text/javascript">
	   var totalAll;
	   var pageNums;
		$(function() {
			to_page(1);
		});

		function to_page(page) {
			$.ajax({
				url : "main/show",
				data : "page=" + page,
				type : "GET",
				success : function(result) {
					build_emp_table(result);
					build_page_nav(result);
					build_page_list(result);
				}
			});
		}

		//解析全部的员工信息
		function build_emp_table(result) {
			$("#emp_list tbody").empty();
			var emps = result.extend.employee.list;
			$.each(emps, function(index, item) {
				//alert(item.empName);
				var checkBoxId = $("<td><input type='checkbox' class='check_item'/></td>");
				var empId = $("<td></td>").append(item.empId);
				var empName = $("<td></td>").append(item.empName);
				var gender = $("<td></td>").append(item.gender);
				var email = $("<td></td>").append(item.email);
				var department = $("<td></td>")
						.append(item.department.deptName);

				/**
				   <button type="button" class="btn btn-primary btn-sm btn-success">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							修改
						</button>
						<button type="button" class="btn btn-primary btn-sm btn-danger">
							<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							删除
						</button>
				 */
				var update = $("<button></button>").addClass(
						"btn btn-primary btn-sm btn-success emp_update_btn").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-pencil").append("修改"));
				//给修改按钮赋一个属性，值为empId
				 update.attr("edit-id",item.empId);
				var delect = $("<button></button>").addClass(
						"btn btn-primary btn-sm btn-danger btn_delect").append(
						$("<span></span>")
								.addClass("glyphicon glyphicon-trash").append(
										"删除"));
				delect.attr("edit-id",item.empId);
				var upd = $("<td></td>").append(update).append(delect);
				$("<tr></tr>").append(checkBoxId).append(empId).append(empName).append(gender)
						.append(email).append(department).append(upd).appendTo(
								"#emp_list tbody");
			});
		}
		//解析分页数
		function build_page_nav(result) {
			$("#page-1").empty();
			var pageNum = result.extend.employee.pageNum;
			var pages = result.extend.employee.pages;
			var totals = result.extend.employee.total;
			$("#page-1").append("当前第").append(pageNum).append("页，总共有").append(
					pages).append("页，总共").append(totals).append("条记录");
		    totalAll = totals;
		    pageNums=pageNum;
		}

		//解析分页条
		function build_page_list(result) {
			$("#page-2").empty();
			var ul = $("<ul></ul>").addClass("pagination");

			//当页数为1时不能点击	    	
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (result.extend.employee.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}
			//为首页和前一夜添加事件
			firstPageLi.click(function() {
				to_page(1);
			});
			prePageLi.click(function() {
				to_page(result.extend.employee.pageNum - 1);
			});

			//设置当前页为最后一页时不能点击,其他页可以点击

			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));

			if (result.extend.employee.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}
			nextPageLi.click(function() {
				to_page(result.extend.employee.pageNum + 1);
			});
			lastPageLi.click(function() {
				to_page(result.extend.employee.pages);
			});

			ul.append(firstPageLi).append(prePageLi);

			$.each(result.extend.employee.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.employee.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				});
				ul.append(numLi);
			});
			ul.append(nextPageLi).append(lastPageLi);
			//把ul加入到nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page-2");
		}

		//添加操作显示模态框
		$("#insert_btn").click(function() {
			emp_add_dept("#emp_add select");			
			$("#emp_add").modal({
				backdrop : "static"
			});
		});

		//添加中部门表单显示
		function emp_add_dept(ele) {
			$(ele).empty();
			$.ajax({
				url : "dept/put",
				type : "GET",
				success : function(result) {
					//console.log(result);
					//${"#dept_name"}.apend($("option").append())
					//extend: {department: [{deptId: 1, deptName: "销售部"}]}}
					$.each(result.extend.department, function(index, item) {
						var one = $("<option></option>").append(item.deptName)
								.attr("value", item.deptId);
						one.appendTo(ele);
					});
				}

			});
		}
		
		//校验信息
		function validate_add_from(){
			var empName = $("#empName_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
		    if(!regName.test(empName)){
		    	show_validate_msg("#empName_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
		    	return false;
		    }else{
		    	show_validate_msg("#empName_input", "success", "");
		    };
		    //校验邮箱
		    var email = $("#email_input").val();
		    var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		    if(!regEmail.test(email)){
		    	show_validate_msg("#email_input", "error", "邮箱格式不正确");
		    	return false;
		    }else{
		    	show_validate_msg("#email_input", "success", "");
		    }		    
		    return true;
		}
		
		//显示校验结果的提示信息
		function show_validate_msg(ele,status,msg){
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		//校验用户名是否可用
		$("#empName_input").change(function(){
			//发送ajax请求校验用户名是否可用
			var empName = this.value;
			$.ajax({
				url:"main/checkuser",
				data:"empName="+empName,
				type:"GET",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#empName_input","success","用户名可用");
						$("#emp_save").attr("ajax-va","success");
					}else{
						show_validate_msg("#empName_input","error","用户名不可用");
						$("#emp_save").attr("ajax-va","error");
					}
				}
			});
		});
		
		//保存信息
		$("#emp_save").click(function(){
			if(!validate_add_from()){
				return false;
			};
			//1、判断之前的ajax用户名校验是否成功。如果成功。
			if($(this).attr("ajax-va")=="error"){
				return false;
			};
			$.ajax({
				url:"main/save",
				type:"POST",
				data:$("#emp_add form").serialize(),
				success:function(result){
					alert(result.msg);
					$("#emp_add").modal('hide');
					to_page(totalAll);
				}
			})
			//alert($("#emp_add form").serialize());
		});
		
		
		//1、我们是按钮创建之前就绑定了click，所以绑定不上。
		//1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
		//jquery新版没有live，使用on进行替代
		$(document).on("click",".emp_update_btn",function(){
			//alert("edit");
			
			
			//1、查出部门信息，并显示部门列表
			    emp_add_dept("#emp_update_add select")
			//2、查出员工信息，显示员工信息
			    getEmp($(this).attr("edit-id"));			
			  //3、把员工的id传递给模态框的更新按钮
				$("#emp_update").attr("edit-id",$(this).attr("edit-id"));
				$("#emp_update_add").modal({
					backdrop:"static"
				});
		});
		
		//回显操作
		function getEmp(id){
			$.ajax({
				url:"main/update",
				data:"empId="+id,
				type:"GET",
				success:function(result){
					//console.log(result);
					var empData = result.extend.emp;
					$("#empName_update_static").text(empData.empName);
					$("#email_update").val(empData.email);
					$("#emp_update_add input[name=gender]").val([empData.gender]);
					$("#emp_update_add select").val([empData.dId]);
				}
			});
		}
		
		//点击更新，更新员工信息
		$("#emp_update").click(function(){
			//验证邮箱是否合法
			//1、校验邮箱信息
			var email = $("#email_update").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				show_validate_msg("#email_update", "error", "邮箱格式不正确");
				return false;
			}else{
				show_validate_msg("#email_update", "success", "");
			}
			
			//2、发送ajax请求保存更新的员工数据
			$.ajax({
				url:"main/saveUpdate/"+$(this).attr("edit-id"),
				type:"PUT",
				data:$("#emp_update_add form").serialize(),
				success:function(result){
					//alert(result.msg);
					alert("修改成功！"),
					//1、关闭对话框
					$("#emp_update_add").modal("hide");
					//2、回到本页面
					to_page(pageNums);
				}
			});
						
		});
		
		//删除操作
		$(document).on("click",".btn_delect",function(){
	    
	    		var isflag=confirm("确定要删除吗");
	    		if(isflag){
	    			$.ajax({
	    				url:"main/delect/"+$(this).attr("edit-id"),
	    				type:"POST",
	    				success:function(result){
	    					alert(result.msg);
	    					//2、回到本页面
	    					to_page(pageNums);
	    				}
	    			
	    			});
	    			return true;
	    		}    		
	    		return false;   			    	
		});
		
		//全部选中
		$(document).on("click","#all_checkbox",function(){
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		//单个选择，当全部选中后总按钮也选中
		//check_item
		$(document).on("click",".check_item",function(){
			//判断当前选择中的元素是否5个
			var flag = $(".check_item:checked").length==$(".check_item").length;
			$("#all_checkbox").prop("checked",flag);
		});
		
		//批量删除
		$("#delect_btn_all").click(function(){
			var empNames = "";
			var del_idstr = "";
			$.each($(".check_item:checked"),function(index,item){
				empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				//组装员工id字符串
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			//去除empNames多余的,
			empNames = empNames.substring(0, empNames.length-1);
			//去除删除的id多余的-
			del_idstr = del_idstr.substring(0, del_idstr.length-1);
			if(confirm("确认删除【"+empNames+"】吗？")){
				$.post({
					url:"main/delectall/"+del_idstr,
					success:function(result){
						alert(result.msg);
						//回到当前页面
						to_page(pageNums);	
					}
				});
			}
		});
	</script>
</body>
</html>