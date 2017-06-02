<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String imagePath=basePath+"WEB-INF/view/jsp/default/ui/login/images";

%>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
	<title>公路养护管理系统</title>
	<link type="text/css" href="<c:url value='/login/css/main.css' />" rel="stylesheet" />
	<link type="text/css" href="<c:url value='/login/css/css.css' />" rel="stylesheet" />
	<script type="text/javascript" src="<c:url value='/login/js/jquery-1.6.2.min.js' />"></script>
	<script type="text/javascript" >$(function(){if((navigator.userAgent.indexOf('MSIE') >= 0) && (navigator.userAgent.indexOf('Opera') < 0)){$("#password").attr({"size":"26"});}else{$("#password").attr('size','25');}});  </script>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body class="bg">
		<!--div class="bg_div bg" -->
				<div style="height:200px;width:425px;position:relative;top:200px;left:180px">
					<div class="title_logo"></div>
					<div>
						<form:form method="post" id="fm1"   cssClass="fm-v clearfix" commandName="${commandName}" htmlEscape="true">
						<div class="login_input">
							<c:if test="${not empty sessionScope.openIdLocalId}">
							<strong>${sessionScope.openIdLocalId}</strong>
							<input type="hidden" id="username" name="username"  value="${sessionScope.openIdLocalId}" style="width:220px;height:26px;position:relative;left:86px;top:6px;">
							</c:if>
							<c:if test="${empty sessionScope.openIdLocalId}">
								<spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
								<form:input cssClass="required" cssErrorClass="error" id="username" size="25" tabindex="1" accesskey="${userNameAccessKey}" path="username" autocomplete="false" htmlEscape="true" style="width:218px;height:26px;position:absolute;left:85px;top:6px;" />
							</c:if>
								<spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
								<form:password cssClass="required" cssErrorClass="error" id="password"  tabindex="2" path="password"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" style="width:218px;height:26px;position:absolute;left:85px;top:53px;"/>
						</div>
						<div class="login_btn" style="position:relative;top:-80px;left:326px;cursor:pointer;" onclick="document.getElementById('fm1').submit();">
							<input type="hidden" name="lt" value="${loginTicket}" />
							<input type="hidden" name="execution" value="${flowExecutionKey}" />
							<input type="hidden" name="_eventId" value="submit" />
							<input  accesskey="l" tabindex="4" type="submit" style="display:none;"/>
						</div>
						<div style="position:relative;top:-68px;width:390px;height:200px;position:relative;left:24px;">
							<div style="float:left;"><form:errors path="*" id="msg"  element="div" style="color:red;"/></div>
							<div style="float:right;right:10px;">
								<!--input type="checkbox" style="width:14px;height:14px;"/>
								<font style="font-size:12px;color:#D9E2EC;font-weight:bold;position:relative;top:-4px!important;">记住密码</font>&nbsp;&nbsp;&nbsp;&nbsp;
								<a style="font-size:12px;color:#D9E2EC;font-weight:bold;cursor:pointer;position:relative;top:-4px!important;">忘记密码</a-->
								
								<table style="vertical-align:middle;">
									<tr>
										<td><input type="checkbox" style="width:16px;height:14px;vertical-align:middle;"/></td>
										<td><font style="font-size:12px;color:#D9E2EC;font-weight:bold;">记住密码</font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td><a style="font-size:12px;color:#D9E2EC;font-weight:bold;cursor:pointer;">忘记密码</a></td>
									</tr>
								</table>
							</div>
						</div>
						</form:form>
					</div>
				</div>
			
			<div class="foot_div" ><span style="vertical-align: middle;text-align: center;">
					中公高科 | 公路养护技术国家工程研究中心技术支持 </span></div>
		<!--/div-->
</body>
</html>