<%@ page import="ikiosk.Photo" %>

<div class="fieldcontain ${hasErrors(bean: DBPhotoInstance, field: 'imagePhoto', 'error')} required">
	<label for="payload">
		<g:message code="DBPhoto.payload.label" default="loadImage" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="payload" name="loadImage" />

</div>





