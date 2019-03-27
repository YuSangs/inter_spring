<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title><tiles:getAsString name="title"/></title>
		<%@ include file="/WEB-INF/views/common/includeInc.jsp" %>
	</head>
	<body>
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="content" />
		<tiles:insertAttribute name="footer" />
	</body>
</html>