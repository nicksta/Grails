
@Transactional(readOnly = false)



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class PhotoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def result = Photo.count()
        respond Photo.list(params), model:[DBPhotoInstanceCount: Photo.count()]
    }


    def show(Photo DBPhotoInstance) {
        [PhotoInstance: DBPhotoInstance]
    }


    def showPayload(Photo DBPhotoInstance) {
        response.outputStream << DBPhotoInstance.imagePhoto // write the image to the output stream
        response.outputStream.flush()
    }


    def create() {
        respond new Photo(params)
    }



    @Transactional
    def save(Photo PhotoInstance) {

        if (PhotoInstance == null) {
            notFound()
            return
        }

        def uploadedFile = request.getFile('loadImage')
        PhotoInstance.imagePhoto = uploadedFile.getBytes() //converting the file to bytes
        PhotoInstance.name = uploadedFile.originalFilename //getting the file name from the uploaded file
        PhotoInstance.type = uploadedFile.contentType//getting and storing the file type
        PhotoInstance.save flush:true //Create the record in DB by sending the needed Select command
        redirect(action: "index")
    }



    def edit(Photo PhotoInstance) {
        respond PhotoInstance
    }


    def update(Photo PhotoInstance) {

        if (PhotoInstance == null) {
            notFound()
            return
        }

        def uploadedFile = request.getFile('loadImage')

        if (uploadedFile.empty){//If File was not defined/updated
            notFound()
            return
        }
        else
            PhotoInstance.name = uploadedFile.originalFilename //getting the file name from the uploaded file
        PhotoInstance.type = uploadedFile.contentType//getting and storing the file type
        PhotoInstance.imagePhoto = uploadedFile.getBytes()
        PhotoInstance.save(flush: true)

        redirect(action: "index")
    }


    @Transactional
    def delete(Photo PhotoInstance) {
        if (PhotoInstance == null) {
            notFound()
            return
        }

        PhotoInstance.delete(flush: true)
        redirect(action: "index")
    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'Photo.label', default: 'Photo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
