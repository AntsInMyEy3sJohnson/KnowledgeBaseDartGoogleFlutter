class Validators {
  
  static final RegExp _mailRegexPattern = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static String validateMailString(String mail) {

    if (mail.isEmpty) {
      return "Mail address cannot be empty";
    }

    if(!_mailRegexPattern.hasMatch(mail)) {
      return "No valid mail address";
    }
    
    // Validators must return the error string in case a validation of the 
    // given element fails, and 'null' if the element is determined to be valid
    return null;

  }
  
  static String validatePasswordString(String password) {
    
    if (password.isEmpty) {
      return "Password cannot be empty";
    }
    
    if (password.length < 8) {
      return "Password must contain at least eight characters";
    }
    
    return null;
    
  }

}