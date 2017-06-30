<%@ page import="travel.dominios.CatAreas" %>
<%@ page import="travel.dominios.User" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main"/>
	<link href="${resource(dir: "css",file: "dataTables.bootstrap.css")}" rel="stylesheet">
	<link href="${resource(dir: "css",file: "bootstrap-dialog.css")}" rel="stylesheet">
	<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
</head>
<body>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<div class="card">
		<div class="body">
			<div class="table-responsive">
				<table id="tablaUsuarios" class="table table-bordered table-striped dataTable js-exportable">
					<thead>
					<tr>
						<th>Usuario</th>
						<th>Cuenta Expirada</th>
						<th>Cuenta bloqueada</th>
						<th>Cuenta habilitada</th>
						<th>Contraseña Expirada</th>
						<th></th>
					</tr>
					</thead>
					<tbody>
					<g:each in="${userInstanceList}" status="i" var="userInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td>${userInstance?.username}</td>

							<td><g:formatBoolean boolean="${userInstance.accountExpired}" /></td>

							<td><g:formatBoolean boolean="${userInstance.accountLocked}" /></td>

							<td><g:formatBoolean boolean="${userInstance.enabled}" /></td>

							<td><g:formatBoolean boolean="${userInstance.passwordExpired}" /></td>
							<td><sec:ifAllGranted roles="ROLE_ADMIN">
								<a href="${createLink(controller: 'user', action: 'edit', id: userInstance?.id)}">
									<button type="button" class="btn bg-green">
										editar
									</button>
								</a>

									<button onclick="deleteUser(${userInstance?.id}, '${userInstance?.username}')" type="button" class="btn bg-danger ">eliminar
									</button>
								</sec:ifAllGranted >
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>
<a name="anchorgrafica"/>
<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.dataTables.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'dataTables.bootstrap.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap-dialog.js')}"></script>

<script>
	$(document).ready(function() {
		function scrollToAnchor(aid){
			var aTag = $("a[name='"+ aid +"']");
			$('html,body').animate({scrollTop: aTag.offset().top},'slow');
		}

		var table = $('#tablaUsuarios').DataTable({
			language: {
				url: "${resource(dir: 'js', file: 'Spanish.json')}"
			},
			iDisplayLength: 5,
			columnDefs: [ {
				targets: 5,
				orderable: false
			} ]
		});
	});

	function deleteUser(id, username){
		BootstrapDialog.confirm({
			title: 'ELIMINAR Usuario',
			message: '¿Está seguro que desea eliminar al usuario <b>"'+username+'"</b>?',
			type: BootstrapDialog.TYPE_DANGER, 
			closable: true, 
			draggable: true, 
			btnCancelLabel: 'Cancelar', 
			btnOKLabel: 'Eliminar', 
			btnOKClass: 'bg-red', 
			callback: function(result) {
				if(result) {
					window.location = "${createLink(controller: 'user', action: 'deleteUser')}/"+id;
				}else {
					alert('error');
				}
			}
		});
	}
</script>

</body>
</html>
