package travel.dominios

class CatAreas {
	int id
	String descripcion

    static constraints = {
    	descripcion nullable:false, blank:false
    }

     static mapping = {
		table 'cat_area'

		id column: 'cat_area_id'
		descripcion column: 'cat_area_descripcion'
		version false
	}
}