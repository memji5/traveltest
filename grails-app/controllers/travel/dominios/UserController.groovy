package travel.dominios



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured
//import javax.sql.DataSource

@Transactional(readOnly = true)
//@Secured(["hasRole('ROLE_ADMIN')"])
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured(["hasRole('ROLE_USER')"])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params),userInstanceCount: User.count()]
    }
    @Secured(["hasRole('ROLE_ADMIN')"])
    def show(User userInstance) {
        respond userInstance
    }
    
    def create() {
        respond new User(params)
    }
    @Transactional
    def save(User userInstance) {
		def usuarioInstance = new User()
        usuarioInstance.setUsername(params.username)
        usuarioInstance.setPassword(params.password)
        usuarioInstance.setNombre(params.nombre)
        usuarioInstance.setAppaterno(params.Appaterno)
        usuarioInstance.setApmaterno(params.Apmaterno)
        usuarioInstance.setArea(CatAreas.findById(params.area.toLong()))
        usuarioInstance.setEnabled(params.enabled.equals("true"))

		if (!usuarioInstance.save(flush: true)) {
            usuarioInstance.errors.each {
                println it
            }
			render(view: "create", model: [usuarioInstance: usuarioInstance])
			return
		}

        List permisos = params.list("permiso")
        permisos.each {String idString ->
            UserRole.create usuarioInstance, Role.findById(idString.toLong())
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'Usuario.label', default: 'Usuario'), usuarioInstance.id])
		redirect(action: "index")
		
		
    }
    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        User userInstance= User.findById(id.toLong())
        respond userInstance
    }
    @Secured(['ROLE_ADMIN'])
    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }
        usuarioInstance.setArea(CatAreas.findById(params.area.toLong()))
        userInstance.save flush:true

        List permisos = params.list("permiso")
        permisos.each {String idString ->
            UserRole.create userInstance, Role.findById(idString.toLong()), true
        }

        redirect(controller: 'user', action: 'index')
    }
    @Secured(['ROLE_ADMIN'])
    @Transactional
    def deleteUser(Long id) {
        User user = User.get(id)
        user.delete(flush: true)

        redirect(controller: 'user', action: 'index')

    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
