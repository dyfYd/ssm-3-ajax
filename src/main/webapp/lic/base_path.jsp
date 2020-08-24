<%@ page language="java" pageEncoding="UTF-8"%>
<%
// 获得项目名称-->/项目名称--><path>/项目名称</path>
String path = request.getContextPath();
// 协议名称http/https                       获得域名                                                         ：      端口号
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- html标签 -->
<base href="<%=basePath%>" />