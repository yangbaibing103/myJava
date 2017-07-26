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
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="static\bootstrap-3.3.7-dist\css\bootstrap.min.css">
	<script type="text/javascript" src="static\js\jquery-3.2.1.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="angular.min.js"></script>
    <script type="text/javascript">
    var app=angular.module("app",[]);
    app.controller("AppController",["$scope","$http",function($scope,$http){
  
   $http({
    url:"message/selectUser.do",
    method:"GET"
    }).then(function successCallback(response){
   /*  console.log(response.data); */
     $scope.list=response.data.user; 
    });
  /*   var ids="";
    	$("#sub").click(function(){
    		
    		var check=$(".check:checked");
    		if(check.length!=0){
    		for(var i=0;i<check.length;i++){
    		var id=check[i].value;
    		
    		if(i==0){
    		ids+=id;
    		}else{
    		ids+=","+id;
    		}
    		
    		}alert(ids)
    		var context=$("#context").val();
    		alert(context)
    		$.post("message/insertMessage.do",{"ids":ids,"content":context});
    		}else{
    		alert("请选择联系人")
    		}
    		
    	}); */
    });
    
    </script>
  </head>
  
  <body ng-app="app" ng-controller="AppController"> 
  <center>
   	<h1>
   		站内信发送页面
   	</h1>  
  
     	<table>
   	<tr>
   	<td>请选择联系人</td>
   	<td>
   	
  	<input type="checkbox" ng-repeat="user in list" class="check" name="user.uid" value="${one.uid }">{{one.uname }} 
   
   	
   	</td>
   	</tr>
   	<tr>
   	<td>请输入消息内容</td>
   	<td>
   <textarea rows="6" cols="40" id="context"></textarea>
   
   	</td>
   	</tr>
   	</table>
   	<right>
   	<input type="button" id="sub" value="发送">
   	</right>
   
   </center>  
  </body>
</html>
