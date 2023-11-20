document.addEventListener('turbo:load', function () {
    var passwordField = document.getElementById('password-field');
    var togglePassword = document.getElementById('togglePassword');

    togglePassword.addEventListener('click', function () {
        passwordField.type = passwordField.type === 'password' ? 'text' : 'password';
        togglePassword.classList.toggle('bi-eye');
        togglePassword.classList.toggle('bi-eye-slash');
    });
});
//
// <progress id="progress" value="0" max="100">70</progress>
// <span id="progresslabel"></span>