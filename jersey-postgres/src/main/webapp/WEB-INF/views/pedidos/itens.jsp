<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template" %>
<template:admin>
    <div>
        <div class ="container">      
            <h2 class="basic-title">Pedido</h2>            
            <form:form role="form" cssClass="well" commandName="pedido" servletRelativeAction="#" method="POST">
                <div class="form-group">
                    Cliente: <label for="cliente.id">${pedido.cliente.nome}</label>
                    Número: <label for="numero">${pedido.numero}</label>
                    Data: <label for="data"><fmt:formatDate pattern="dd/MM/yyyy" value="${pedido.data}"/></label>
                </div>
            </form:form>

            <div class="well">
                <h2 class="basic-title">Itens</h2>
                <form:form role="form" cssClass="well" commandName="item" servletRelativeAction="/pedidos/${pedido.id}/itens" method="POST">
                    <div class="form-group">
                        <label for="produto.id  ">Produto</label>
                        <div class="input-group">
                            <form:select path="produto.id" size="1" required='true'>
                                <form:options items="${produtos}" itemValue="id" itemLabel="descricao"/>
                            </form:select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="quantidade">Quantidade</label>
                        <div class="input-group">
                            <form:input path='quantidade' type='text' required='true'/> <form:errors path='quantidade'/>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">Adicionar</button>
                </form:form>
                <table class="table table-condensed table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <td>ID</td>
                            <td>Produto</td>
                            <td>Quantidade</td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items='${itens}' var='object'>         		
                            <tr>
                                <td>${object.id}</td>
                                <td>${object.produto.descricao}</td>
                                <td>${object.quantidade}</td>
                                <td><a title="Excluir" href="<c:url value='/pedidos'/>/${object.pedido.id}/itens/${object.id}/remove"> <i class="glyphicon glyphicon-trash"></i> Excluir</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>            
        </div>
    </div>
</template:admin>