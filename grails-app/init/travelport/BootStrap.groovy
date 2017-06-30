package travelport

import travel.dominios.Role
import travel.dominios.User
import travel.dominios.UserRole
import travel.dominios.CatAreas
class BootStrap {

    def init = { servletContext ->

      def adminRole = new Role(authority: 'ROLE_ADMIN',descripcion:'Modificación').save(failOnError: true , flush:true)
      def userRole = new Role(authority: 'ROLE_USER',descripcion:'Consulta').save(failOnError: true , flush:true)

      def CatArea = new CatAreas(descripcion:'Administrativo').save(failOnError: true , flush:true)

      def testUser = new User(username: 'me', password: 'pass',nombre:'jonatan',Appaterno:'mendez',Apmaterno:'monterrubio',area:CatArea).save(failOnError: true , flush:true)

      UserRole.create testUser, adminRole
      UserRole.create testUser, userRole

    }
    def destroy = {
    }
}
