package ikiosk

class Photo {

    String name
    String type
    String test
    byte[] imagePhoto
    Date lastUpdated
    Date dateCreated
    Date uploadDate = new Date()

    static constraints = {

        imagePhoto(nullable:false, maxSize:1073741824) // max of 4GB photo
        type(blank:true, nullable:true)
        name(blank:true, nullable:true)

    }

    String toString() {
        return name
    }

}