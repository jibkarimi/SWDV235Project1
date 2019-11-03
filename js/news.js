"use strict";

/* 
JIB Karimi
3/19/19
*/

window.addEventListener("load", function() {
    document.getElementById("submit").onclick = submit;
    document.getElementById("compName").oninput = validName;
    document.getElementById("mail").oninput = validMail;
 });
 
 function submit() {
    validName();
    validMail();  
 }
 
 function validName() {
    var fullName  = document.getElementById("fullName");
    if (fullName.validity.valueMissing) {
       fullName.setCustomValidity("Please enter a valid Name");
    } else {
       fullName.setCustomValidity("")
    }
 }
 
 function validMail() {
    var email  = document.getElementById("mail");
    if (email.validity.valueMissing) {
       email.setCustomValidity("Please enter an E-mail Adress");
    } else if (/^[a-z]{4,12}\.?\d?\d?\w+\@\D{9,20}\.\D{3}$/ig.test(email.value) === false) {
       email.setCustomValidity("**Please enter a valid E-mail");
    } else {
       email.setCustomValidity("")
    }
 }
 