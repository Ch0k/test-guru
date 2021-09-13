document.addEventListener('turbolinks:load', function() {
    var user_password_confirmation = document.getElementById('user_password_confirmation')
    var user_password = document.getElementById('user_password')
    user_password.addEventListener('input', check)
    user_password_confirmation.addEventListener('input', check)

    function check() {
      if (user_password.value == user_password_confirmation.value) 
      {
        document.querySelector('#user_password').classList.add('green-border')
        document.querySelector('#user_password').classList.remove('red-border')
      }
      else {
        document.querySelector('#user_password').classList.remove('green-border')
        document.querySelector('#user_password').classList.add('red-border')
      }
    }
  
})
