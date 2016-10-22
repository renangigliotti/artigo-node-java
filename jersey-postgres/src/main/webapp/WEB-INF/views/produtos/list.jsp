<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template" %>
<template:admin>
    <jsp:attribute name="title">Produtos</jsp:attribute>
    <jsp:attribute name="extraStyles">
        <link rel="stylesheet" href="<c:url value='/resources/css/pagination/jqpagination.css'/>" />
    </jsp:attribute>
    <jsp:attribute name="extraScripts">
        <script src="<c:url value='/resources/js/jquery.jqpagination.js'/>"></script>
    </jsp:attribute>
    <jsp:body>
        <div>
            <div class ="container">
                <h2 class="basic-title">Lista de Produtos</h2>
                <div class="well">
                    <table class="table table-condensed table-bordered table-striped table-hover">
                        <thead>
                            <tr>
                                <td>ID</td>
                                <td>Descrição</td>
                                <td>Preço</td>
                                <td></td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items='${paginatedList.currentList}' var='object'>         		
                                <tr>
                                    <td>${object.id}</td>
                                    <td>${object.descricao}</td>
                                    <td><fmt:formatNumber type="currency" minFractionDigits="2" value="${object.preco}"/></td>
                                    <td>
                                        <a href="<c:url value='/produtos'/>/${object.id}"><i class="glyphicon glyphicon-edit"></i> Alterar</a>
                                        <a href="<c:url value='/produtos/remove'/>/${object.id}"><i class="glyphicon glyphicon-trash"></i> Excluir</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <template:paginationComponent paginatedList="${paginatedList}" page="${param.page}" action="/produtos"/>
                    <a href="<c:url value='/produtos/form'/>" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> Add New</a>
                </div>
            </div>
        </div>
    </jsp:body>
</template:admin>
