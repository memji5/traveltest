<%@ page import="travel.dominios.UserRole; travel.dominios.User"%>
<%@ page import="travel.dominios.Role; travel.dominios.CatAreas"%>

<!-- Vertical Layout -->

<label for="txtUsername">Usuario</label>
<div class="form-group">
	<div class="form-line">
		<input type="text" name="username" id="txtUsername"
			value="${userInstance?.username}" class="form-control"
			placeholder="Usuario para el sistema">
	</div>
</div>
<label for="txtNombre">Nombre</label>
<div class="form-group">
	<div class="form-line">
		<input type="text" name="nombre" id="txtNombre"
			value="${userInstance?.nombre}" class="form-control"
			placeholder="Nombre">
	</div>
</div>
<label for="txtAppaterno">Paterno</label>
<div class="form-group">
	<div class="form-line">
		<input type="text" name="Appaterno" id="Appaterno"
			value="${userInstance?.Appaterno}" class="form-control"
			placeholder="Apellido paterno">
	</div>
</div>
<label for="txtApmaterno">Materno</label>
<div class="form-group">
	<div class="form-line">
		<input type="text" name="Apmaterno" id="Apmaterno"
			value="${userInstance?.Apmaterno}" class="form-control"
			placeholder="Apellido materno">
	</div>
</div>

<label for="password">Contraseña</label>
<div class="form-group">
	<div class="form-line">
		<input type="password" name="password" id="password"
			value="" class="form-control" placeholder="Contraseña" required>
	</div>
</div>
<label for="Area">Area de Negocio</label>
<div class="form-group">
	<div class="form-line"> 
		<g:select class="selectpicker" multiple="false" name="area" id="area" optionKey="id" optionValue="descripcion" from="${travel.dominios.CatAreas.list() }" value="${userInstance?.id ?  userInstance?.area?.id: []}"/>
	</div>
</div>
<label for="permiso">Rol</label>
<div class="form-group">
	<div class="form-line"> 
		<g:select name="permiso" id="permiso" optionKey="id" optionValue="descripcion" from="${travel.dominios.Role.list() }" value="${userInstance?.id ? travel.dominios.UserRole.findAllByUser(userInstance)?.role*.id : []}" class="selectpicker" multiple="true"/>
	</div>
</div>


<div class="">
	<div class="form-line">
	<input type="checkbox" id="enabled" value="true" class="filled-in" name="enabled" ${userInstance?.enabled?'checked':''}/><label for="enabled"> Activo</label>
	</div>
</div>

<%--                                <button type="button" class="btn btn-primary m-t-15 waves-effect">LOGIN</button>--%>

<!-- #END# Vertical Layout -->



