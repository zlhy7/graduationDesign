<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="type" type="java.lang.String" required="true" description="字典类型"%>
<%@ attribute name="defaultValue" type="java.lang.String" description="默认选中的值"%>
<%@ attribute name="cssClass" type="java.lang.String" description="class"%>
<%@ attribute name="htmlEscape" type="java.lang.String" description="class"%>
<%@ attribute name="name" type="java.lang.String"  required="true" description="class"%>
<%@ attribute name="id" type="java.lang.String"  required="true" description="class"%>
<%@ attribute name="onchange" type="java.lang.String"   description="class"%>
<%@ attribute name="onclick" type="java.lang.String"   description="class"%>
<c:set value="${fns:getDictList(type)}" var="dictx"></c:set>
<select id="${id}" name="${name}" class="${cssClass}"
  <c:if test="${not empty onchange}"> onchange="${onchange}"</c:if>
  <c:if test="${not empty onclick}"> onclick="${onclick}"</c:if>
>
	<c:forEach  items="${dictx}" var="dtx" varStatus="idxStatus">
	 	<option <c:if test="${dtx.value eq defaultValue}">selected</c:if> value="${dtx.value}">${dtx.name}</option>
	</c:forEach>
</select>

