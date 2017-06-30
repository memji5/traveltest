package travel.dominios

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
//import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.data.JRMapCollectionDataSource;
import groovy.sql.Sql

//@Transactional(readOnly = true)
//@Secured(['ROLE_ADMIN','ROLE_USER'])
class PrincipalController {
	def dataSource
  //@Secured(["hasAnyRole('ROLE_ADMIN','ROLE_USER')"])
    def index() { }
   //@Secured(["hasAnyRole('ROLE_ADMIN','ROLE_USER')"])
    def listado() { }
  //@Secured(["hasAnyRole('ROLE_ADMIN','ROLE_USER')"])
    def datosDataTables(){
        String queryt
        String queryd
        //enviamos parametro extra por combo

        if(params.filtro =="1"){
           queryt='select s.nombre nombre,s.appaterno paterno,s.apmaterno materno,c.cat_area_descripcion descripcion  from sys_user s,cat_area c where s.area_id=c.cat_area_id AND '+
                 ' CONCAT_WS(" ",UPPER(nombre),UPPER(appaterno),UPPER(apmaterno)) LIKE UPPER("%'+params.sSearch+'%") GROUP BY c.cat_area_descripcion ORDER BY s.nombre '

            queryd='select s.nombre nombre,s.appaterno paterno,s.apmaterno materno,c.cat_area_descripcion descripcion  from sys_user s,cat_area c where s.area_id=c.cat_area_id AND '+
                 ' CONCAT_WS(" ",UPPER(nombre),UPPER(appaterno),UPPER(apmaterno)) LIKE UPPER("%'+params.sSearch+'%") '+
                 " LIMIT "+params.iDisplayLength+" OFFSET " + params.iDisplayStart
                 
        }else{ 

                if (params.filtro=="2"){
                queryt='select s.nombre,s.appaterno,s.apmaterno,c.cat_area_descripcion  from sys_user s,cat_area c where s.area_id=c.cat_area_id AND '+
                 ' UPPER(c.cat_area_descripcion) LIKE UPPER("%'+params.sSearch+'%") GROUP BY c.cat_area_descripcion ORDER BY s.nombre '

                 queryd='select s.nombre nombre,s.appaterno paterno,s.apmaterno materno,c.cat_area_descripcion descripcion  from sys_user s,cat_area c where s.area_id=c.cat_area_id AND '+
                 ' UPPER(c.cat_area_descripcion) LIKE UPPER("%'+params.sSearch+'%") GROUP BY c.cat_area_descripcion ORDER BY s.nombre '+
                 " LIMIT "+params.iDisplayLength+" OFFSET " + params.iDisplayStart
            }else{

              if(params.sSearch){
                queryt='select s.nombre,s.appaterno,s.apmaterno,c.cat_area_descripcion  from sys_user s,cat_area c where s.area_id=c.cat_area_id AND UPPER(s.nombre) LIKE UPPER("%'+params.sSearch+'%") OR UPPER(s.appaterno) LIKE UPPER("%'+params.sSearch+'%") '+
                 ' OR UPPER(s.apmaterno) LIKE UPPER("%'+params.sSearch+'%") OR UPPER(c.cat_area_descripcion) LIKE UPPER("%'+params.sSearch+'%") GROUP BY c.cat_area_descripcion ORDER BY s.nombre'
                 
                 queryd='select s.nombre nombre,s.appaterno paterno,s.apmaterno materno,c.cat_area_descripcion descripcion  from sys_user s,cat_area c where s.area_id=c.cat_area_id AND UPPER(s.nombre) LIKE UPPER("%'+params.sSearch+'%") OR UPPER(s.appaterno) LIKE UPPER("%'+params.sSearch+'%") '+
                ' OR UPPER(s.apmaterno) LIKE UPPER("%'+params.sSearch+'%") OR UPPER(c.cat_area_descripcion) LIKE UPPER("%'+params.sSearch+'%") GROUP BY c.cat_area_descripcion ORDER BY s.nombre '+
                " LIMIT "+params.iDisplayLength+" OFFSET " + params.iDisplayStart
                }else{
                    queryt='select s.nombre,s.appaterno,s.apmaterno,c.cat_area_descripcion  from sys_user s,cat_area c where s.area_id=c.cat_area_id '
                 
                 queryd='select s.nombre nombre,s.appaterno paterno,s.apmaterno materno,c.cat_area_descripcion descripcion  from sys_user s,cat_area c where s.area_id=c.cat_area_id '+
                " LIMIT "+params.iDisplayLength+" OFFSET " + params.iDisplayStart

                }
                
            }  
            } 

        def dbp = new Sql(dataSource)
        def totalR = dbp.rows(queryt)
        dbp.close()
        
        def datosResult = []
        println params
        def db = new Sql(dataSource)
        def datos = db.rows(queryd)
        db.close()
        
        def total = totalR.size()
        
        if(datos.size() > 0 ){
            datos.each {
                def registro = [:]
                registro.put("0", it?.nombre)
                registro.put("1", it?.paterno)
                registro.put("2", it?.materno)
                registro.put("3", it?.descripcion)
                
                datosResult.push(registro)
            }
        }
        
        int sEcho = 0
        if(params.sEcho){
            sEcho = params.sEcho.toInteger()
            sEcho++
        }
        
        def result =['sEcho':sEcho, 'iTotalRecords':total  , 'iTotalDisplayRecords':total, 'aaData':datosResult]
        
        render result as JSON
    }


    def creareporte(){

        User UserInstance = User.get(params.id)
         ByteArrayOutputStream  pdfStream
         try {
          String reportName, namaFile, dotJasper
          namaFile = "reporte"
          reportName = grailsApplication.mainContext.getResource('reports/' + namaFile + '.jrxml').file.getAbsoluteFile()
          dotJasper = grailsApplication.mainContext.getResource('reports/' + namaFile + '.jasper').file.getAbsoluteFile()
          // Report parameter
          Map<String, String> reportParam = new HashMap<String, String>()

          def realPath = servletContext.getRealPath("/reports/imagenes/")
          reportParam.put("imgpath", realPath);
           
          // compiles jrxml
          JasperCompileManager.compileReportToFile(reportName);

          // Create DataSource

          Collection<Map<String, ?>> list = new ArrayList<Map<String,?>>();
            Map<String, Object> hashMap = new HashMap<String, Object>();
            hashMap.put("nombre", UserInstance.nombre + " " + UserInstance.paterno + " " + UserInstance.materno);
            hashMap.put("area", UserInstance.area.descripcion);
            list.add(hashMap);

          // fills compiled report with parameters and a connection
          JasperPrint print = JasperFillManager.fillReport(dotJasper, reportParam, new JRMapCollectionDataSource(list));
          
          pdfStream = new ByteArrayOutputStream();
         
          println pdfStream
     
          // exports report to pdf
          JRExporter exporter = new JRPdfExporter();
          exporter.setParameter(JRExporterParameter.JASPER_PRINT, print);
          exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, pdfStream); // your output goes here
        
          exporter.exportReport();
     
         } catch (Exception e) {
           
            e.printStackTrace()
          throw new RuntimeException("It's not possible to generate the pdf report.", e); 
         } finally {
          render(file: pdfStream.toByteArray(), contentType: 'application/pdf')
         }

    }
}