package travel.dominios

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

//@Transactional(readOnly = true)
class CatAreasController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

@Secured(["hasAnyRole('ROLE_ADMIN','ROLE_USER')"])
    def index(Integer max) {
        [catAreasInstance:CatAreas.list(params), catAreasCount: CatAreas.count()]
    }

    def show(CatAreas catAreas) {
        respond catAreas
    }
@Secured(["hasAnyRole('ROLE_ADMIN','ROLE_USER')"])
    def create() {
        respond new CatAreas(params)
    }
@Secured(["hasAnyRole('ROLE_ADMIN','ROLE_USER')"])
    @Transactional
    def save(CatAreas catAreas) {
        if (catAreas == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (catAreas.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond catAreas.errors, view:'create'
            return
        }

        catAreas.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'catAreas.label', default: 'CatAreas'), catAreas.id])
                redirect (action: "index")
            }
            '*' { respond catAreas, [status: CREATED] }
        }
    }
@Secured(['ROLE_ADMIN'])
    def edit(Long id) {

        CatAreas catAreas= CatAreas.findById(id.toLong())
        respond catAreas
    }
@Secured(['ROLE_ADMIN'])
    @Transactional
    def update(CatAreas catAreas) {
        if (catAreas == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (catAreas.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond catAreas.errors, view:'edit'
            return
        }

        catAreas.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'catAreas.label', default: 'CatAreas'), catAreas.id])
                redirect (action: "index")
            }
            '*'{ respond catAreas, [status: OK] }
        }
    }
@Secured(['ROLE_ADMIN'])
    @Transactional
    def delete(Long id) {

        CatAreas catInstance = CatAreas.get(id)
        catInstance.delete(flush: true)

        redirect(controller: 'CatAreas', action: 'index')
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'catAreas.label', default: 'CatAreas'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
