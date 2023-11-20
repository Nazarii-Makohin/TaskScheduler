// // app/javascript/packs/password_toggle.js
// document.addEventListener('turbo:load', function () {
//     var passwordField = document.getElementById('password-field');
//     var togglePassword = document.getElementById('togglePassword');
//     var progressField = document.getElementById('progress');
//     var progressLabel = document.getElementById('progresslabel');
//
//     console.log("s")
//
//     if (passwordField && togglePassword && progressField && progressLabel) {
//         passwordField.addEventListener('turbo:load', function() {
//             var pwd = passwordField.value;
//
//             // Reset if password length is zero
//             if (pwd.length === 0) {
//                 progressLabel.innerHTML = "";
//                 progressField.value = "0";
//                 return;
//             }
//
//             // Check progress
//             var prog = [/[$@$!%*#?&]/, /[A-Z]/, /[0-9]/, /[a-z]/]
//                 .reduce((memo, test) => memo + test.test(pwd), 0);
//
//             // Length must be at least 8 chars
//             if(prog > 2 && pwd.length > 7){
//                 prog++;
//             }
//
//             // Display it
//             var strength = "";
//             switch (prog) {
//                 case 0:
//                 case 1:
//                 case 2:
//                     strength = "25%";
//                     break;
//                 case 3:
//                     strength = "50%";
//                     break;
//                 case 4:
//                     strength = "75%";
//                     break;
//                 case 5:
//                     strength = "100% - Password strength is good";
//                     break;
//             }
//             progressLabel.innerHTML = strength;
//             progressField.value = prog * 25; // Adjust the value based on your criteria
//         });
//     }
// });
