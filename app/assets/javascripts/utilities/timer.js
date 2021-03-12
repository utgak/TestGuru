class Timer {
    constructor(elem, seconds) {
        this.elem = elem
        this.seconds = seconds
    }

    startTimer() {
        this.id = setInterval(() => this.changeTime(), 1000)
    }

    changeTime() {
        if (this.seconds <= 0){
            clearInterval(this.id)
            document.getElementById('submit').click()
        } else {
            this.elem.innerHTML = Math.floor(this.seconds / 60) + ":" + Math.floor(this.seconds % 60)
            this.seconds--
        }
    }
}
