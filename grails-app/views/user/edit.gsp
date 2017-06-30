<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
	<link href="${resource(dir: "css",file: "bootstrap-select.css")}" rel="stylesheet">
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
</head>
<body>

	<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Edicion de colaboradores
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
									<g:form resource="${this.userInstance}" method="PUT" >
										<g:hiddenField name="version" value="${userInstance?.version}" />
                                        <g:hiddenField name="idvalor" value="${userInstance?.id}" />
									<fieldset class="form">
									<g:render template="form" />
									</fieldset>
									<fieldset class="buttons">
										<g:actionSubmit class="btn btn-primary m-t-15 waves-effect" action="update"
										value="${message(code: 'default.button.update.label', default: 'Update')}" />
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

<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap-select.js')}"></script>
</body>
</html>
