"use strict";
/*
   Filename: port_formsubmit.js

   Purpose: The purpose of this program is to simply report on a
            successful completion of a valid Web form.

            When the form is submitted, the onsubmit event handler
            verifies that the form data is complete and valid.
            An alert box is displayed notifying the user.

            The event function returns a value of false so that the
            student does not have to continually retype test values
            in the survey form.

    Usage: Add <script src="port_formsubmit.js"></script> just above the </head> on your page


    
JIB Karimi
3/19/19

*/

window.addEventListener("load", function() {
   document.getElementById("submit").onclick = submit;
   document.getElementById("compName").oninput = validName;
   document.getElementById("phone").oninput = validPhone;
   document.getElementById("mail").oninput = validMail;
});

function submit() {
   validName();
   validPhone();
   validMail();  
   selectOption();

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
   //var email = document.querySelector("input[name='contactName']").value;

   if (email.validity.valueMissing) {
      email.setCustomValidity("Please enter an E-mail Adress");
   } else if (/^[a-z]{4,12}\.?\d?\d?\w+\@\D{9,20}\.\D{3}$/ig.test(email.value) === false) {
      email.setCustomValidity("***Please enter a valid E-mail");
   } else {
      email.setCustomValidity("")
   }
}

function validPhone() {
   var phone  = document.getElementById("phone");

   if (phone.validity.valueMissing) {
      phone.setCustomValidity("Please enter a valid phone number");
   } else {
      phone.setCustomValidity("")
   }
}

function selectOption() {
   var select = document.getElementById("dropDown");
   if (select.selectedIndex != 0) {
      select.setCustomValidity("");
   } else select.setCustomValidity("Pleae select One of the options!");
}

