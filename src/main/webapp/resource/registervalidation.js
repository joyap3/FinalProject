function validateForm() {
    var text;

    var fName = document.forms["registerUser"]["firstName"].value;
    if (fName == "") {
        text = "Please enter Name";
        document.getElementsByClassName("invalid")[0].innerHTML = text;
        return false;
    }
    var midName = document.forms["registerUser"]["middleName"].value;
    if (midName == "") {
        text = "Please enter Middle Name";
        document.getElementsByClassName("invalid")[1].innerHTML = text;
        return false;
    }
    var lName = document.forms["registerUser"]["lastName"].value;
    if (lName == "") {
        text = "Please enter Last Name";
        document.getElementsByClassName("invalid")[2].innerHTML = text;
        return false;
    }
    var bday = document.forms["registerUser"]["birthday"].value;
    if (bday == "") {
        text = "Please enter date of birth";
        document.getElementsByClassName("invalid")[3].innerHTML = text;
        return false;
    }

    var address = document.forms["registerUser"]["address"].value;
    if (address == "") {
        text = "Please enter Address";
        document.getElementsByClassName("invalid")[4].innerHTML = text;
        return false;
    }

    var phone = document.forms["registerUser"]["phoneNumber"].value;
    if (phone == "") {
        text = "Please enter valid phone number with no special characters";
        document.getElementsByClassName("invalid")[6].innerHTML = text;
        return false;
    }
    if (phone.length < 10){
        text = "Phone number is too short";
        document.getElementsByClassName("invalid")[6].innerHTML = text;
        return false;
    }
    if(phone.length > 10){
        text = "Phone number to long, please enter with no special characters";
        document.getElementsByClassName("invalid")[6].innerHTML = text;
        return false;
    }
    var email = document.forms["registerUser"]["email"].value;

    var atpos = email.indexOf("@");
    var dotpos = email.lastIndexOf(".");
    if (email == "" || atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email.length) {
        text = "Please enter valid email";
        document.getElementsByClassName("invalid")[7].innerHTML = text;
        return false;
    }
    var password = document.forms["registerUser"]["password"].value;
    if(password == ""){
        text = "Please enter a password";
        document.getElementsByClassName("invalid")[8].innerHTML = text;
        return false;
    }
    var cpassword = document.forms["registerUser"]["cfPassword"].value;
    if (cpassword == ""){
        text = "Please confirm password";
        document.getElementsByClassName("invalid")[9].innerHTML = text;
        return false;
    }
    if(password !== "" && password === cpassword) {

        if (password.length < 6) {
            text = "Password must be more than 6 characters";
            document.getElementsByClassName("invalid")[8].innerHTML = text;
            return false;
        }
        re = /[0-9]/;
        if(!re.test(password)){
            text = "Password must contain at least 1 number."
            document.getElementsByClassName("invalid")[8].innerHTML = text;
            return false;
        }
        if (password == email) {
            text = "Password cannot be same as email";
            document.getElementsByClassName("invalid")[8].innerHTML = text;
            return false;
        }
    }else if (password !== cpassword){
        text = "Passwords do not match, please confirm password."
        document.getElementsByClassName("invalid")[9].innerHTML = text;
        return false;
    }
    var zip = document.forms["registerUser"]["zip"].value;
    var isValidZip =(/^\d{5}$/);
    if (zip.match(isValidZip) && zip.length === 5) {
        return true;
    }else{
        text = "Enter valid zip";
        document.getElementsByClassName("invalid")[5].innerHTML = text;
        return false;
    }
}