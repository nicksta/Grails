
<%@ page import="ikiosk.Photo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'Photo.label', default: 'Photo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-Photo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-Photo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list Photo">
			
				<g:if test="${PhotoInstance?.imagePhoto}">
				<li class="fieldcontain">
					<span id="payload-label" class="property-label"><g:message code="Photo.payload.label" default="Payload" /></span>
					<img  src="${createLink(controller:'Photo', action:'showPayload', id:"${PhotoInstance.id}")}" width='300' />
				</li>
				</g:if>
			
				<g:if test="${PhotoInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="Photo.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${PhotoInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${PhotoInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="Photo.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${PhotoInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${PhotoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="Photo.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${PhotoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${PhotoInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="Photo.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${PhotoInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${PhotoInstance?.uploadDate}">
				<li class="fieldcontain">
					<span id="uploadDate-label" class="property-label"><g:message code="Photo.uploadDate.label" default="Upload Date" /></span>
					
						<span class="property-value" aria-labelledby="uploadDate-label"><g:formatDate date="${PhotoInstance?.uploadDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:PhotoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${PhotoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
