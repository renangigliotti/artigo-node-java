<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

        <!-- bootstrap -->
        <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap-theme.min.css'/>" type="text/css">

        <!-- style -->
        <link rel="stylesheet" href="<c:url value='/resources/css/index.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/css/forms.css'/>">
    </head>
    <body>
        <div>
            <div class ="container">      
                <h2 class="basic-title">Login</h2>
                <center>
                    <form:form role="form" cssClass="well" commandName="usuario" servletRelativeAction="/login" method="POST">
                        <div class="form-group">
                            <label for="usuario">Usuário</label>
                            <div class="input-group">
                                <form:input path='usuario' type='text' required='true'/> <form:errors path='usuario'/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="senha">Senha</label>
                            <div class="input-group">
                                <form:password path='senha' required='true'/> <form:errors path='senha'/>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form:form>
                </center>
            </div>
        </div>

        <script src="<c:url value='/resources/js/jquery-2.1.4.min.js'/>"></script>
        <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
    </body>

</html>
