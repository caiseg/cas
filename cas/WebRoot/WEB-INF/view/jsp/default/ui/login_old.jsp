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
	<title>广东省交通集团养护数据中心</title>
	<link type="text/css" href="<c:url value='/login/css/main.css' />" rel="stylesheet" />
	<link type="text/css" href="<c:url value='/login/css/css.css' />" rel="stylesheet" />
	<script type="text/javascript" src="<c:url value='/login/js/jquery-1.6.2.min.js' />"></script>
 <script type="text/javascript" >$(function(){if((navigator.userAgent.indexOf('MSIE') >= 0) && (navigator.userAgent.indexOf('Opera') < 0)){$("#password").attr({"size":"26"});}else{$("#password").attr('size','25');}});  </script>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<div class="con">
		<div class="top">
			<div class="top_logo"><img src="<c:url value='/login/images/logo_2.png' />" width="350" height="54" /></div>
		</div>
		<div class="login">
			<form:form method="post" id="fm1"   cssClass="fm-v clearfix" commandName="${commandName}" htmlEscape="true">
					  <form:errors path="*" id="msg" cssClass="errors" element="div" style="margin-left:-10px;color:red;"/>
						<div class="row fl-controls-left">
							<label for="username" class="fl-label" style="font-size:10pt;"><spring:message code="screen.welcome.label.netid" /></label>
							<c:if test="${not empty sessionScope.openIdLocalId}">
							<strong>${sessionScope.openIdLocalId}</strong>
							<input type="hidden" id="username" name="username"  value="${sessionScope.openIdLocalId}" />
							</c:if>
							<c:if test="${empty sessionScope.openIdLocalId}">
							<spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
							<form:input cssClass="required" cssErrorClass="error" id="username" size="25" tabindex="1" accesskey="${userNameAccessKey}" path="username" autocomplete="false" htmlEscape="true" />
							</c:if>
						</div>
						<div style="height:8px;"></div>
						<div class="row fl-controls-left">
							<label for="password" class="fl-label" style="font-size:10pt;"><spring:message code="screen.welcome.label.password" /></label>
							<span style="width:10px;"></span>
							<spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
							<form:password cssClass="required" cssErrorClass="error" id="password"  tabindex="2" path="password"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
						</div>
						<div style="height:8px;"></div>
						<div class="row check" style="margin-left:30px;">
							<input id="warn" name="warn" value="true" tabindex="3" accesskey="<spring:message code='screen.welcome.label.warn.accesskey' />" type="checkbox" />
							<label for="warn"><spring:message code="screen.welcome.label.warn" /></label>
						</div>
						
						<div class="row btn-row">
							<input type="hidden" name="lt" value="${loginTicket}" />
							<input type="hidden" name="execution" value="${flowExecutionKey}" />
							<input type="hidden" name="_eventId" value="submit" />
							<input class="btn-submit" name="submit" accesskey="l" value="<spring:message code='screen.welcome.button.login' />" tabindex="4" type="submit" />
							<input class="btn-reset" name="reset" style="margin-left:10px;" accesskey="c" value="<spring:message code='screen.welcome.button.clear' />" tabindex="5" type="reset" />
						</div>
		</form:form>
	</div>
	<div class="ss1"><img src="<c:url value='/login/images/ss1.gif' />" /></div>
</div>
	<div class="m_top"></div>
	<div class="m_bg"></div>
	<div class="foot" style="height:32px;">
		<ul>
		 <li></li>
		 <span>版权所有：广东省交通集团&nbsp;&nbsp;&nbsp;&nbsp;技术支持：北京星球数码科技有限公司</span>
		</ul>
	</div>
</body>
</html>