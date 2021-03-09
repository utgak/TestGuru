class ComparePwd{
    constructor() {
        this.pwd = document.querySelector('#user_password')
        this.pwd_confirm = document.querySelector('#user_password_confirmation')
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