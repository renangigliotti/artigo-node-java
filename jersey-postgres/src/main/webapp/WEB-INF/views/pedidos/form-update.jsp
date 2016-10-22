<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags/template" prefix="template" %>
<template:admin>
    <div class ="container">      
        <h2 class="basic-title">Atualizar</h2>
        <form:form role="form" cssClass="well" commandName="pedido" servletRelativeAction="/pedidos/${pedido.id}" method="POST">
            <%@include file="form-inputs.jsp" %>
            <button type="submit" class="btn btn-primary">Salvar</button>
            <a href="${pageContext.servletContext.contextPath}/pedidos" class="btn btn-danger">Voltar</a>
        </form:form>	
    </div>
</template:admin>
