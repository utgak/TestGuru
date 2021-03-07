document.addEventListener('turbolinks:load', function() {
    var compare = document.querySelector('#user_password_confirmation')

    if (compare) { compare.addEventListener('input', comparePwd ) }
})

function comparePwd(){
    var pwd = document.querySelector('#user_password').value
    var pwd_confirm = document.querySelector('#user_password_confirmation').value

    if (pwd_confirm.length > 0) {
        if (pwd === pwd_confirm) {
            document.querySelector('.octicon-check').classList.remove('hide')
            document.querySelector('.octicon-x').classList.add('hide')
        } else {
            document.querySelector('.octicon-x').classList.remove('hide')
            document.querySelector('.octicon-check').classList.add('hide')
        }
    } else {
        document.querySelector('.octicon-x').classList.add('hide')
    }
}