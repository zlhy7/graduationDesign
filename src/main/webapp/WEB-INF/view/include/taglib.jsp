<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fns" uri="myFns"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tagss"%>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static" />
<%
response.setHeader("Pragma","No-cache");    
response.setHeader("Cache-Control","no-cache");    
response.setDateHeader("Expires", -10);   
 %>