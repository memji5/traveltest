<%@ page import="travel.dominios.Role" %>

<label for="txtauthority">authority</label>
<div class="form-group">
	<div class="form-line">
		<input type="text" required="" name="authority" id="authority"
			value="${roleInstance?.authority}" class="form-control"
			placeholder="authority">
	</div>
</div>
<label for="txtdescripcion">descripcion</label>
<div class="form-group">
	<div class="form-line">
		<input type="text" required="" name="descripcion" id="descripcion"
			value="${roleInstance?.descripcion}" class="form-control"
			placeholder="descripcion">
	</div>
</div>
