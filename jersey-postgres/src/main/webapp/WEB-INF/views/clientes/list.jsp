<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template" %>
<template:admin>
    <jsp:attribute name="title">Clientes</jsp:attribute>
    <jsp:attribute name="extraStyles">
        <link rel="stylesheet" href="<c:url value='/resources/css/pagination/jqpagination.css'/>" />
    </jsp:attribute>
    <jsp:attribute name="extraScripts">
        <script src="<c:url value='/resources/js/jquery.jqpagination.js'/>"></script>
    </jsp:attribute>
    <jsp:body>
        <div>
            <div class ="container">
                <h2 class="basic-title">Lista de Clientes</h2>
                <div class="well">
                    <table class="table table-condensed table-bordered table-striped table-hover">
                        <thead>
                            <tr>
                                <td>ID</td>
                                <td>Nome</td>
                                <td>CNPJ</td>
                                <td>Data Cadastro</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items='${paginatedList.currentList}' var='object'>         		
                                <tr>
                                    <td><a href="<c:url value='/clientes'/>/${object.id}">${object.id}</a></td>
                                    <td>${object.nome}</td>
                                    <td>${object.cnpj}</td>
                                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${object.dataCadastro}" /></td>
                                    <td>
                                        <a title="Alterar" href="<c:url value='/clientes'/>/${object.id}"> <i class="glyphicon glyphicon-edit"></i> Alterar</a>                                        
                                        <a title="Excluir" href="<c:url value='/clientes/remove'/>/${object.id}"> <i class="glyphicon glyphicon-trash"></i> Excluir</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <template:paginationComponent paginatedList="${paginatedList}" page="${param.page}" action="/clientes"/>
                    <a href="<c:url value='/clientes/form'/>" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign"></span> Add New</a>
                </div>
            </div>
        </div>
    </jsp:body>
</template:admin>
