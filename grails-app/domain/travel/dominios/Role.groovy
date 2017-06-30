package travel.dominios

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class Role implements Serializable {

	private static final long serialVersionUID = 1

	String authority
	String descripcion

	static constraints = {
		authority blank: false, unique: true
	}

	static mapping = {
		table 'sys_role'
		version false
		cache true
	}
}
