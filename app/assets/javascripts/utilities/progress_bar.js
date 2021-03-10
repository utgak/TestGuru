class ProgressBar{
    constructor(elem) {
        this.elem = elem
    }
    move(percent) {
        this.elem.style.width = percent + "%";
        this.elem.innerHTML = percent  + "%";
    }
}
