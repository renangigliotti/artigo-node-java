<%@attribute name="title" fragment="true"%>
<%@attribute name="extraScripts" fragment="true"%>
<%@attribute name="extraStyles" fragment="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title><jsp:invoke fragment="title"/></title>

        <!-- bootstrap -->
        <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap-theme.min.css'/>" type="text/css">

        <!-- style -->
        <link rel="stylesheet" href="<c:url value='/resources/css/index.css'/>">
        <link rel="stylesheet" href="<c:url value='/resources/css/forms.css'/>">
        <jsp:invoke fragment="extraStyles"/>
    </head>

    <body>

        <!-- INICIO NAV (alterar pra include)-->

        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">

                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#menu" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<c:url value="/"/>">Pedidos</a>
                </div>

                <div class="collapse navbar-collapse" id="menu">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Cadastros <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="<c:url value='/produtos'/>"><span class="glyphicon glyphicon-menu-hamburger"></span> Produtos</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="<c:url value='/clientes'/>"><span class="glyphicon glyphicon-menu-hamburger"></span> Clientes</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="<c:url value='/pedidos'/>"><span class="glyphicon glyphicon-menu-hamburger"></span> Pedidos</a></li>
                                <li role="separator" class="divider"></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="navbar-brand pull-right">
                        Usuário: [${usuarioLogado}] 
                        <a href="${pageContext.servletContext.contextPath}/logout" ><strong>Sair</strong></a>
                    </div>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <jsp:doBody />
        </div>

        <script src="<c:url value='/resources/js/jquery-2.1.4.min.js'/>"></script>
        <script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
        <jsp:invoke fragment="extraScripts"/>
    </body>
</html>