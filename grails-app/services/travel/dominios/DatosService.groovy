package travel.dominios

import grails.transaction.Transactional
import grails.converters.JSON
import groovy.sql.Sql

class DatosService {
    def dataSource

    def dataTables(params){

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
                queryt='select s.nombre,s.appaterno,s.apmaterno,c.cat_area_descripcion  from sys_user s,cat_area c where s.area_id=c.cat_area_id AND UPPER(s.nombre) LIKE UPPER("%'+params.sSearch+'%") OR UPPER(s.appaterno) LIKE UPPER("%'+params.sSearch+'%") '+
                 ' OR UPPER(s.apmaterno) LIKE UPPER("%'+params.sSearch+'%") OR UPPER(c.cat_area_descripcion) LIKE UPPER("%'+params.sSearch+'%") GROUP BY c.cat_area_descripcion ORDER BY s.nombre'
                 
                 queryd='select s.nombre nombre,s.appaterno paterno,s.apmaterno materno,c.cat_area_descripcion descripcion  from sys_user s,cat_area c where s.area_id=c.cat_area_id AND UPPER(s.nombre) LIKE UPPER("%'+params.sSearch+'%") OR UPPER(s.appaterno) LIKE UPPER("%'+params.sSearch+'%") '+
                ' OR UPPER(s.apmaterno) LIKE UPPER("%'+params.sSearch+'%") OR UPPER(c.cat_area_descripcion) LIKE UPPER("%'+params.sSearch+'%") GROUP BY c.cat_area_descripcion ORDER BY s.nombre '+
                " LIMIT "+params.iDisplayLength+" OFFSET " + params.iDisplayStart
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
        
        return result as JSON

    }
    
}



