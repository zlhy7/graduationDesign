<%@tag pageEncoding="UTF-8" body-content="scriptless"%>
<%@include file="/WEB-INF/view/include/head.jsp" %>
<%@ attribute name="items" type="java.util.List" required="true" description="集合"%>
<%@ attribute name="itemKey" type="java.lang.String" description="键"%>
<%@ attribute name="itemValue" type="java.lang.String" description="值"%>
<%@ attribute name="defaultValue" type="java.lang.String" description="默认值"%>
<c:forEach  items="${items}" var="item" varStatus="status">
    <option <c:if test="${item.itemValue eq defaultValue}">selected</c:if> value="${item.itemValue}">${item.name}</option>
</c:forEach>
