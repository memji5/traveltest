<%@ page import="travel.dominios.CatAreas" %>

<label for="txtdescripcion">Área de negocio</label>
<div class="form-group">
	<div class="form-line">
		<input type="text" required="" name="descripcion" id="descripcion"
			value="${catAreas?.descripcion}" class="form-control"
			placeholder="area de negocio">
	</div>
</div>
