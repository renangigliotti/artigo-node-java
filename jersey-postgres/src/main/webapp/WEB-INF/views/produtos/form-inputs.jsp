<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="form-group">
    <label for="descricao">Descri��o</label>
    <div class="input-group">
        <form:input path='descricao' type='text' required='true'/> <form:errors path='descricao'/>
    </div>
</div>
<div class="form-group">
    <label for="preco">Pre�o</label>
    <div class="input-group">
        <form:input path='preco' type='text' required='true'/> <form:errors path='preco'/>
    </div>
</div>