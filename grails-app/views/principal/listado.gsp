<html>
<head>
    <meta name="layout" content="main" />
    <title>listado</title>
    <!-- data tables css-->
    <link href="${resource(dir: 'css', file: 'dataTables.bootstrap.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'buttons.dataTables.min.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'metisMenu.min.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'morris.css')}" rel="stylesheet">
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
     <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.dataTables.js')}"></script>
    <!-- export-->
    <script type="text/javascript" src="${resource(dir: 'js', file: 'tableExport.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jspdf.debug.js')}"></script>

    <script type="text/javascript" src="${resource(dir: 'js', file: 'metisMenu.min.js')}"></script>
   
</head>
<body>
         <div class="row">
                <div class="col-lg-12">
                    <br/>
                </div>
        </div>
        
        <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Listado de colaboradores con filtro
                            <select class="selectpicker" id="campoBusqueda">
                            <option value="1">Nombre y apellidos</option>
                            <option value="2">Area de negocio</option>
                            <option value="3" selected>Sin busqueda</option>
                            </select>

                        </div>
                        
                        <!-- /.panel-heading -->
                        <div id="paraPdf" class="panel-body">
                            <table  id="datosData" class="table table-bordered table-striped table-hover dataTable js-exportable">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Paterno</th>
                                        <th>Materno</th>
                                        <th>Area de Negocio</th>
                                    </tr>
                                </thead>
                            </table>

                            <button id="btnExport">Export to xls</button>
                            <button id="cmd" onclick="javascript:demoFromHTML();">Generate PDF</button>
                            <!-- /.table-responsive -->
                        </div>
                        
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
        </div>
            <!-- /.row -->
<script type="text/javascript">

    $(document).ready(function(){
        $('#datosData').dataTable({ 
            bProcessing: true,
            bServerSide: true,
            iDisplayLength: 5,
            pagingType: "full_numbers",
            language: {
                url: "${resource(dir: 'js', file: 'Spanish.json')}"
            },
            sAjaxSource: "<g:createLink controller='Principal' action='datosDataTables' />",
            fnServerParams: function ( aoData ) {
                  aoData.push( { "name": "filtro", "value": $('#campoBusqueda option:selected').val() } );
              },
            aoColumns: [
                          { "bSortable": false, "visible": true },
                          null,
                          null,
                          null
                        ]
        });
            
    });
     $("#btnExport").click(function(e) {
    e.preventDefault();

    //getting data from our table
    var data_type = 'data:application/vnd.ms-excel';
    var table_div = document.getElementById('datosData');
    var table_html = table_div.outerHTML.replace(/ /g, '%20');

    var a = document.createElement('a');
    a.href = data_type + ', ' + table_html;
    a.download = 'listado' + '.xls';
    a.click();
  });

     function demoFromHTML() {
    var pdf = new jsPDF('p', 'pt', 'letter');
    
    pdf.cellInitialize();
    pdf.setFontSize(10);
    $.each( $('#paraPdf tr'), function (i, row){
        $.each( $(row).find("td, th"), function(j, cell){
            var txt = $(cell).text().trim() || " ";
            var width = (j==4) ? 40 : 70; //make with column smaller
            pdf.cell(10, 50, width, 30, txt, i);
        });
    });
    
    pdf.save('listado.pdf');
    }
</script> 
</body>

</html>

