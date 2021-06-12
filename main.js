var cfml = {}

cfml.authForm = document.getElementById('AuthForm')
cfml.authBT = document.getElementById('AuthBT')
cfmluserLogin = document.getElementById('LoginInput')
cfml.userPassword = document.getElementById('PasswordInput')

cfml.authBT.addEventListener('click', function(event) {
	cfml.authForm.submit();
})
