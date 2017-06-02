<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//String imagePath=basePath+"WEB-INF/view/jsp/default/ui/login/images";

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
	<%-- 	<link type="text/css" href="<c:url value='/login/css/mystyle.css' />" rel="stylesheet" />
	<link type="text/css" href="<c:url value='/login/css/main.css' />" rel="stylesheet" />
	<link type="text/css" href="<c:url value='/login/css/css.css' />" rel="stylesheet" /> --%>
	<link href="<c:url value='/login/lz/common/bootstrap/bootstrap.min.css' />" rel='stylesheet' type='text/css' />
	<link href="<c:url value='/login/lz/common/bootstrap/bootstrap-theme.min.css' />" rel='stylesheet' type='text/css' />
	<script type="text/javascript" src="<c:url value='/login/lz/common/bootstrap/jquery-1.11.3.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/login/js/jquery-1.6.2.min.js' />"></script>
	<script type="text/javascript" >
	//$(function(){if((navigator.userAgent.indexOf('MSIE') >= 0) && (navigator.userAgent.indexOf('Opera') < 0)){$("#password").attr({"size":"26"});}else{$("#password").attr('size','25');}});  

	$(function() {
	$(window).resize(function() {
		resizeHeight();
	});
	resizeHeight();

	$('#dl').click(function() {
		window.location.href = basePath + "pages/index.jsp";
	});
});
function resizeHeight() {
	var height = $(window).height()- 90-678;
	//alert($(window).height());
	//alert(height);
	$("#footdiv").css("height", height + "px");
	$("#contents").css("margin-top", 90 + "px");
	$("#contents").css("height", $(window).height()-90 + "px");
}
	
	</script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	<style type="text/css">
		body{
			overflow: hidden;
		}
		.top {
			position: absolute;
			top: 0px;
			left: 0px;
			right: 0px;
			width: 100%;
			z-index: 99;
			min-width: 960px;
			height: 90px;
			margin: 0px;
			background-color: rgba(255, 255, 255, 0.6);
			border-bottom: solid 1px #D8D8D8;
		}
		
		.top .box {
			margin: 13px 0px 0px 170px;
		}
		
		.top .box .top-right {
			float: right;
			margin-top: -32px;
		}
		
		h2 {
			color: #000;
			padding: 10px 0px 10px 70px;
			letter-spacing: 0.2em;
			font-family: "微软雅黑";
			font-size: 36px;
			font-weight: 900;
			height: 64px;
			background-image: url(<%=basePath%>login/lzImg/logo.png);
			background-repeat: no-repeat;
			background-position: left center;
			margin: 0px;
		}
		</style>
</head>
<body class="loginBody" style="background: url(<%=basePath%>login/lzImg/login_bg.png);margin-top:90px;">

<div class="top">
		<div class="box" >
			<h2>甘肃省大件运输并联许可管理系统</h2>
			<div class="top-right"></div>
		</div>
</div>

	<div id="contents"
		style="background: url(<%=basePath%>login/lzImg/login_bg.png);margin-top:90px;">
			<div class="row clearfix" id="tags">
				<div class="col-md-8 column">
					<div class="carousel slide" id="carousel-74637"></div>
				</div>
				<div class="col-md-4 column"
					style="background: url(<%=basePath%>login/lzImg/login.png);height:359px;width:345px;margin-top:120px;">
					<form:form method="post" id="fm1"    class="form-horizontal" style="margin-top:135px;" commandName="${commandName}" htmlEscape="true">
								<div class="login_input">
										<c:if test="${not empty sessionScope.openIdLocalId}">
										<strong>${sessionScope.openIdLocalId}</strong>
										<input type="hidden" id="username" name="username"  value="${sessionScope.openIdLocalId}" />
										</c:if>
										<c:if test="${empty sessionScope.openIdLocalId}">
											<spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label"></label>
												<div class="col-sm-10">
													<form:input path="username" cssClass="required" cssErrorClass="error" class="form-control" id="username" accesskey="${userNameAccessKey}" autocomplete="false" htmlEscape="true"
														style="border:0;width:265px;height:38px;background-color: rgba(255, 255, 255, 0.6);" />
												</div>
											</div>
											<%-- <form:input cssClass="required" cssErrorClass="error" id="username" size="25" tabindex="1" accesskey="${userNameAccessKey}" path="username" autocomplete="false" htmlEscape="true" style="width:218px;height:26px;position:absolute;left:85px;top:6px;" /> --%>
										</c:if>
											<spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
											<div class="form-group" style="margin-top:40px;">
												<label for="inputPassword3" class="col-sm-2 control-label"></label>
												<div class="col-sm-10">
													<form:password cssClass="required" cssErrorClass="error" id="password"  tabindex="2" path="password"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" class="form-control" 
														style="border:0;width:265px;height:38px;background-color: rgba(255, 255, 255, 0.6);" />
												</div>
											</div>
											<%-- <form:password cssClass="required" cssErrorClass="error" id="password"  tabindex="2" path="password"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" style="width:218px;height:26px;position:absolute;left:85px;top:53px;"/> --%>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-6"
										style="margin-top: 13px;margin-left: 15px;">
										<button id="dl" type="button"
											class="btn btn-default btn-warning btn-block" onclick="document.getElementById('fm1').submit();"
											style="width:161px;height:40px;letter-spacing:7px;padding-left:22px;text-shadow:0 0 ;z-index:1000;cursor:pointer;">登
											录</button>
										<input type="hidden" name="lt" value="${loginTicket}" />
										<input type="hidden" name="execution" value="${flowExecutionKey}" />
										<input type="hidden" name="_eventId" value="submit" />
										<input  accesskey="l" tabindex="4" type="submit" style="display:none;"/>
									</div>
									<div class="checkbox" style="position:static;">
										<label style="margin-top: 18px;margin-left: 23px;"><input
											type="checkbox" style="opacity:0.5" />
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									</div>
								</div>
									
								
							<%-- 	<div class="login_btn" style="cursor:pointer;" onclick="document.getElementById('fm1').submit();">
										<input type="hidden" name="lt" value="${loginTicket}" />
										<input type="hidden" name="execution" value="${flowExecutionKey}" />
										<input type="hidden" name="_eventId" value="submit" />
										<input  accesskey="l" tabindex="4" type="submit" style="display:none;"/>
								</div>
							
								<div style="position:relative;top:155px;width:390px;height:200px;left:162px;">
										<div style="float:left;"></div>
										<div style="float:right;right:10px;">
											<table style="vertical-align:middle;">
												<tr>
													<td><input type="checkbox" style="width:16px;height:14px;vertical-align:middle;"/></td>
													<td><font style="font-size:12px;color:#444;font-weight:bold;">记住密码</font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
													<td><a style="font-size:12px;color:#444;font-weight:bold;cursor:pointer;">忘记密码</a></td>
												</tr>
											</table>
										</div>
								</div> --%>
								<div class="form-group" >
									<div class="col-sm-offset-2 col-sm-6"
										style="margin-top: -12px;margin-left: 180px;">
									<form:errors path="*" id="msg"  element="div" style="color:red;"/>
									</div>
								</div>
					</form:form>
				</div>
			</div>
		</div>
		<!-- <div class="foot_div" ><span style="vertical-align: middle;text-align: center;">
					技术支持 :中公高科 | 公路养护技术国家工程研究中心</span></div> -->
</body>
</html>