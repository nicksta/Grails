
<%@ page import="ikiosk.Photo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'Photo.label', default: 'Photo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-Photo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-Photo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="image" title="${message(code: 'Photo.displayImage.label', default: 'Image')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'Photo.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'Photo.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'Photo.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'Photo.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="uploadDate" title="${message(code: 'Photo.uploadDate.label', default: 'Upload Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${photoList}" status="i" var="Photo">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">


						<td>
							<img  src="${createLink(controller:'Photo', action:'showPayload', id:"${Photo.id}")}" width='100' />
						</td>


						<td>${fieldValue(bean: Photo, field: "type")}</td>

						<td><g:link action="show" id="${Photo.id}"> ${fieldValue(bean: Photo, field: "name")}</g:link></td>

						<td><g:formatDate date="${Photo.dateCreated}" /></td>

						<td><g:formatDate date="${Photo.lastUpdated}" /></td>

						<td><g:formatDate date="${Photo.uploadDate}" /></td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${DBPhotoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
