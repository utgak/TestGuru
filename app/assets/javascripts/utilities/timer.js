class Timer {
    constructor(elem, seconds) {
        this.test_id = elem.dataset.test
        this.elem = elem
        this.seconds = seconds
        this.id = setInterval(() => this.changeTime(), 1000)
    }

    changeTime() {
        if (this.seconds <= 0){
            clearInterval(this.id)
            window.location.href = `http://localhost:3000/test_passages/${this.test_id}/result`
        } else {
            this.elem.innerHTML ="Time left: " + Math.floor(this.seconds / 60) + ":" + Math.floor(this.seconds % 60)
            this.seconds--
        }
    }
}
