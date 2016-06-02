package shortme

class ShortMeController {

    def index() {

    }

    def shortener() {
        println params
    }

    def _twtButton() {
        println params
        [url: params.url]
    }
}
