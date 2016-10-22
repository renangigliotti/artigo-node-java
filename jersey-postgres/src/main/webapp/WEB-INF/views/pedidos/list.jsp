<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template" %>
<template:admin>
    <jsp:attribute name="title">Pedidos</jsp:attribute>
    <jsp:attribute name="extraStyles">
        <link rel="stylesheet" href="<c:url value='/resources/css/pagination/jqpagination.css'/>" />
    </jsp:attribute>
    <jsp:attribute name="extraScripts">
        <script src="<c:url value='/resources/js/jquery.jqpagination.js'/>"></script>
    </jsp:attribute>
    <jsp:body>
        <div>
            <div class ="container">
                <h2 class="basic-title">Lista de Pedidos</h2>
                <div class="well">
                    <table class="table table-condensed table-bordered table-striped table-hover">
                        <thead>
                            <tr>
                                <td>ID</td>
                                <td>Cliente</td>
                                <td>Número</td>
                                <td>Data</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items='${paginatedList.currentList}' var='object'>         		
                                <tr>
                                    <td>${object.id}</td>
                                    <td>${object.cliente.nome}</td>
                                    <td>${object.numero}</td>
                                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${object.data}" /></td>
                            <td>
                                <a title="Itens" href="<c:url value='/pedidos'/>/${object.id}/itens"> <i class="glyphicon glyphicon-th-list"></i> Itens </a>
                                <a title="Alterar" href="<c:url value='/pedidos'/>/${object.id}"> <i class="glyphicon glyphicon-edit"></i> Alterar</a>                                        
                                <a title="Excluir" href="<c:url value='/pedidos/remove'/>/${object.id}"> <i class="glyphicon glyphicon-trash"></i> Excluir</a>
                            </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <template:paginationComponent paginatedList="${paginatedList}" page="${param.page}" action="/pedidos"/>
                    <a href="<c:url value='/pedidos/form'/>" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> Add New</a>
                </div>
            </div>
        </div>
    </jsp:body>
</template:admin>
