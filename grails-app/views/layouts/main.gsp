<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title> Travel test </title>

    <!-- icono test -->
        <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <!-- Bootstrap Core Css -->
        <asset:stylesheet src="bootstrap.css" />

    <!-- Theme metismenu sb-admin-2 Css -->
         <asset:stylesheet src="metisMenu.min.css"/>

    <!-- Theme Bootstrap sb-admin-2 Css -->
        <asset:stylesheet src="sb-admin-2.css"/>

    <!-- Theme Bootstrap fonts sb-admin-2 Css -->

    <g:layoutHead/>
    %{--<g:javascript library="application"/>       --}%
    <r:layoutResources/>
</head>
<body>

    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <!-- /.navbar-header -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="${createLink(controller:'Principal', action: 'listado')}"><i class="fa fa-dashboard fa-fw"></i> Listado por filtro</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Colaboradores<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="${createLink(controller:'User', action: 'create')}">Agregar</a>
                                </li>
                                <li>
                                    <a href="${createLink(controller:'User', action: 'index')}">Listar</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Areas de Negocio<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="${createLink(controller:'CatAreas', action: 'create')}">Agregar</a>
                                </li>
                                <li>
                                    <a href="${createLink(controller:'CatAreas', action: 'index')}">Listar</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="${createLink(controller: 'logout')}" ><i class="fa fa-dashboard fa-fw"></i> Salir</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <g:layoutBody />
                    
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>

    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.dataTables.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'dataTables.bootstrap.js')}"></script>
    <!-- Bootstrap Core JavaScript -->
    <script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script type="text/javascript" src="${resource(dir: 'js', file: 'metisMenu.min.js')}"></script>
    
    <!-- Custom Theme JavaScript -->
    <script type="text/javascript" src="${resource(dir: 'js', file: 'sb-admin-2.js')}"></script>

   
    
    <r:layoutResources/>

</body>

</html>