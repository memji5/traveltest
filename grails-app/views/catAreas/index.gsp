<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'catAreas.label', default: 'CatAreas')}" />
        <title></title>
        <link href="${resource(dir: "css",file: "dataTables.bootstrap.css")}" rel="stylesheet">
        <link href="${resource(dir: "css",file: "bootstrap-dialog.css")}" rel="stylesheet">
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
    </head>
    <body>
<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Categorias creadas
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
            <table id="categorias" class="table table-bordered table-striped dataTable js-exportable">
            <thead>
                    <tr>
                        
                        <th>Id</th>
                        <th>Descripcion</th>
                        <th></th>
                    
                    </tr>
                </thead>
                <tbody>
                <g:each in="${catAreasInstance}" status="i" var="areasList">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    
                        <td>${areasList.id}</td>
                        <td>${areasList.descripcion}</td>
                        <td><sec:ifAllGranted roles="ROLE_ADMIN">
                            <a href="${createLink(controller: 'CatAreas', action: 'edit', id: areasList?.id)}">
                                    <button type="button" class="btn bg-green">
                                        editar
                                    </button>
                                </a>
                                <button onclick="deleteCat(${areasList?.id}, '${areasList?.descripcion}')" type="button" class="btn bg-danger ">eliminar
                                    </button>
                            </sec:ifAllGranted>
                        </td>
                    
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
                                <div class="col-lg-6">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
<a name="anchorgrafica"/>
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.dataTables.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'dataTables.bootstrap.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap-dialog.js')}"></script>
    <script>
    $(document).ready(function() {
        function scrollToAnchor(aid){
            var aTag = $("a[name='"+ aid +"']");
            $('html,body').animate({scrollTop: aTag.offset().top},'slow');
        };

        var table = $('#categorias').DataTable({
            language: {
                url: "${resource(dir: 'js', file: 'Spanish.json')}"
            },
            iDisplayLength: 5,
            columnDefs: [ {
                targets: 5,
                orderable: false
            } ]
        });
    });

    function deleteCat(id, cat){
        BootstrapDialog.confirm({
            title: 'ELIMINAR categoria',
            message: '¿Está seguro que desea eliminar la categoria <b>"'+cat+'"</b>?',
            type: BootstrapDialog.TYPE_DANGER, 
            closable: true, 
            draggable: true, 
            btnCancelLabel: 'Cancelar', 
            btnOKLabel: 'Eliminar', 
            btnOKClass: 'bg-red', 
            callback: function(result) {
                if(result) {
                    window.location = "${createLink(controller: 'CatAreas', action: 'delete')}/"+id;
                }else {
                    alert('error');
                }
            }
        });
    }
</script>
    </body>
</html>