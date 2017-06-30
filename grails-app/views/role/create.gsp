<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Alta de colaboradores
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
									<g:form url="[resource:roleInstance, action:'save']" >
									<fieldset class="form">
									<g:render template="form"/>
									</fieldset>
									<fieldset class="buttons">
									<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
									</fieldset>
									</g:form>

								</div>
                              	<div class="col-lg-6">
                              	</div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
	</body>
</html>
