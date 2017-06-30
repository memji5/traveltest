<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'catAreas.label', default: 'CatAreas')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Alta de categorias
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
            <g:form resource="${this.catAreas}" method="PUT">
                <g:hiddenField name="version" value="${this.catAreas?.version}" />
                <fieldset class="form">
                     <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
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
