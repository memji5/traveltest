<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title>alta usuario</title>
		<link href="${resource(dir: "css",file: "bootstrap-select.css")}" rel="stylesheet">
		<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
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
                                	<g:form url="[resource:userInstance, action:'save']" >
										<g:render template="form"/>
									<fieldset class="buttons">
									<g:submitButton name="create" class="btn btn-primary m-t-15 waves-effect" value="${message(code: 'default.button.create.label', default: 'Create')}" />
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
