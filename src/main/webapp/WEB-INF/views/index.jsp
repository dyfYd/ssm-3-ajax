<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/lic/base_path.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="static/js/jquery-1.9.1.min.js"></script>
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>CRUD</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button type="button" class="btn btn-success">新增</button>
				<button type="button" class="btn btn-danger">删除</button>
			</div>
		</div>
		<div class="row">
			<table class="table table-hover">
				<tr>
					<th>#</th>
					<th>姓名</th>
					<th>性别</th>
					<th>邮箱</th>
					<th>部门</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${employee.list }" var="ct">
				<tr>
					<td>${ct.empId }</td>
					<td>${ct.empName }</td>
					<td>${ct.gender }</td>
					<td>${ct.email }</td>
					<td>${ct.department.deptName }</td>
					<td>
						<button type="button" class="btn btn-primary btn-sm btn-success">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							修改
						</button>
						<button type="button" class="btn btn-primary btn-sm btn-danger">
							<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							删除
						</button>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>

    <div class="container">
	<div class="row">
		<div class="col-md-6">
		  当前第${employee.pageNum }页；总共${employee.pages }页；总共${employee.total }条记录
		</div>
		<!-- 显示分页条 -->
		<div class="col-md-6">
			<nav aria-label="Page navigation">
				<ul class="pagination">
				<li><a href="main/show?page=1">首页</a></li>
					<li>
					   <c:if test="${employee.pageNum>0 }">
					     <a href="main/show?page=${employee.pageNum-1 }" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					     </a>
					   </c:if>
					</li>
					<c:forEach items="${employee.navigatepageNums }" var="page">
					   <c:if test="${page==employee.pageNum }">
					      <li class="active"><span>${page }<span class="sr-only"></span></span></li>
					   </c:if>
					   <c:if test="${page!=employee.pageNum }">
					      <li><a href="main/show?page=${page }">${page }</a></li>
					   </c:if>
					</c:forEach>
					
					<li>
					  <c:if test="${employee.pageNum<employee.pages }">
					    <a href="main/show?page=${employee.pageNum+1 }" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
				        </a>
				      </c:if>
				    </li>
				    <li>				     			       
				       <a href="main/show?page=${employee.pages }">末页</a>				      
				    </li>
				</ul>				
			</nav>
		</div>
	</div>
	</div>
</body>
</html>