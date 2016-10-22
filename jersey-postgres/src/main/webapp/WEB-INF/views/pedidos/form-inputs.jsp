<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="form-group">
    <label for="cliente.id  ">Cliente</label>
    <div class="input-group">
        <form:select path="cliente.id" size="1" id="selectClientes" required='true'>
            <form:options items="${clientes}" itemValue="id" itemLabel="nome"/>
        </form:select>
    </div>
</div>
<div class="form-group">
    <label for="numero">Número</label>
    <div class="input-group">
        <form:input path='numero' type='text' required='true'/> <form:errors path='numero'/>
    </div>
</div>
<div class="form-group">
    <label for="data">Data</label>
    <div class="input-group">
        </span><form:input path='data' type='text' required='true'/> <form:errors path='data'/>
    </div>
</div>