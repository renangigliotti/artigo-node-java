<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="form-group">
    <label for="descricao">Nome</label>
    <div class="input-group">
        <form:input path='nome' type='text' required='true'/> <form:errors path='nome'/>
    </div>
</div>
<div class="form-group">
    <label for="cnpj">CNPJ</label>
    <div class="input-group">
        <form:input path='cnpj' type='text'/> <form:errors path='cnpj'/>
    </div>
</div>
<div class="form-group">
    <label for="dataCadastro">Data cadastro</label>
    <div class="input-group">
        <form:input path='dataCadastro' type='text'/> <form:errors path='dataCadastro'/>
    </div>
</div>