class ComparePwd{
    constructor(pwd, pwd_confirm) {
        this.pwd = pwd
        this.pwd_confirm = pwd_confirm
        this.setup()
    }

    chekPasswords() {
        if (this.pwd.value === this.pwd_confirm.value) {
            document.querySelector('.octicon-check').classList.remove('hide')
            document.querySelector('.octicon-x').classList.add('hide')
        } else {
            document.querySelector('.octicon-x').classList.remove('hide')
            document.querySelector('.octicon-check').classList.add('hide')
        }
    }

    setup() {
        this.pwd_confirm.addEventListener('input', event => {
            if (this.pwd !== '') this.chekPasswords()
        } )
    }
}