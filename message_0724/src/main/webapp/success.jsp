<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="static/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/angular.min.js"></script>
    <script type="text/javascript">
	var app=angular.module("app",[]);
	app.controller("AppController",["$scope","$http",function($scope,$http){
		var uid="";
		$http({
		url:"message/selectUser.do",
		method:"GET"
		}).then(function successCallback(response){
		console.log(response.data);
		 $scope.list=response.data; 
		});
		$scope.read=function(){
		var uid=angular.element("#select").val();
		if(uid==""){
		uid="";
		}
		$http({
		url:"message/selectMessage.do?uid="+uid,
		method:"GET"
		}).then(function successCallback(response){
		$scope.message=response.data;
		});
		}
		$scope.del=function(){
		var mid=angular.element(".delBut").parent().parent().find("td").eq(0).text();
		alert(mid)
		}
		$scope.read();
		}]);
	</script>
  </head>
  
  <body ng-app="app" ng-controller="AppController">
  <center>
   <h1>站内信息查看</h1>
 	
  	<select id="select" onchange="angular.element(this).scope().read()"> 	
 	<option value="">所有用户</option>
	<option  ng-repeat="one in list" value="{{one.uid }}">{{one.uname }}</option>
 	 	</select>
 		
 	
 	<table>
 	<tr>
 	<td>消息id</td>
 	<td>消息内容</td>
 	<td>时间</td>
 	<td>接收人</td>
 	<td>操作</td>
 	</tr> 
 	
 	<tr ng-repeat="mes in message">
 	<td>{{mes.mid }}</td>
 	<td>{{mes.content }}</td>
 	<td>{{mes.createtime}}</td>
 	<td>{{mes.user.uname }}</td>
 	<td><input type="button" value="删除" class="delBut" ng-click="del()"></td>
 	</tr> 
 	
 	
 	</table>
  </center>
  </body>
</html>
