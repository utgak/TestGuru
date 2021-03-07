document.addEventListener('turbolinks:load', function() {
    var compare = document.querySelector('#user_password_confirmation')

    if (compare) { compare.addEventListener('input', comparePwd ) }
})

function comparePwd(){
    var pwd = document.querySelector('#user_password').value
    var pwd_confirm = document.querySelector('#user_password_confirmation').value

    if (pwd_confirm.lenght > 0 ) {
        if (pwd === pwd_confirm) {
            this.querySelector('.octicon-check').classList.remove('hide')
            this.querySelector('.octicon-x').classList.add('hide')
        } else {
            this.querySelector('.octicon-x').classList.remove('hide')
            this.querySelector('.octicon-check').classList.add('hide')
        }
    }
}