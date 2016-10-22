<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template" %>
<template:admin>
    <jsp:attribute name="title">Home</jsp:attribute>
    <jsp:attribute name="extraStyles">
        <link rel="stylesheet" href="<c:url value='/resources/css/pagination/jqpagination.css'/>" />
    </jsp:attribute>
    <jsp:attribute name="extraScripts">
        <script src="<c:url value='/resources/js/jquery.jqpagination.js'/>"></script>
    </jsp:attribute>
    <jsp:body>
    </jsp:body>
</template:admin>
