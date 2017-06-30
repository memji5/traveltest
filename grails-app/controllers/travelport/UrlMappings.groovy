package travelport

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        //"/"(view:"/index")
        "/"(controller:"Principal",action:"index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
