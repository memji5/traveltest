<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Iniciar sesión</title>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">

    <!-- Bootstrap Core Css -->
    <link href="${resource(dir: 'css', file: 'bootstrap.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'metisMenu.min.css')}" rel="stylesheet">
    <!-- Waves Effect Css -->
    <link href="${resource(dir: 'css', file: 'sb-admin-2.css')}" rel="stylesheet">

    <!-- Animation Css -->
    <link href="${resource(dir: 'css', file: 'font.awesome.min.css')}" rel="stylesheet">
</head>

<body >
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">

                        <form id="sign_in" method="POST" action="${postUrl?:'/login/authenticate'}">
                            <fieldset>
                                <div class="msg">Iniciar sesión</div>
                                <g:if test="${params.login_error=="1"}">
                                    <div class="alert bg-pink">
                                        Usuario y/o contraseña incorrectos.
                                    </div>
                                </g:if>
                                <div class="form-group">
                                    <div class="form-line">
                                    <input type="text" class="form-control" name="${usernameParameter ?: 'username'}" placeholder="Usuario" required autofocus>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="form-line">
                                    <input type="password" class="form-control" name="${passwordParameter ?: 'password'}" placeholder="Contraseña" required>
                                    </div>
                                </div>
                                <div class="row">
                                <div class="col-xs-offset-3 col-xs-6">
                                <button class="btn btn-lg btn-success btn-block" type="submit">Iniciar sesión</button>
                                </div>
                                </div>
                            <fieldset>
                        </form>
                    </div>
            </div>
        </div>

<asset:javascript src="jquery.min.js"/>

<asset:javascript src="bootstrap.js"/>

<asset:javascript src="metisMenu.min.js"/>

<asset:javascript src="sb-admin-2.js"/>

</body>

</html>