class Validators {
  String? validateEmail(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    return (!regex.hasMatch(value!.trim())) ? "Please Enter A Valid Email" : null;
  }

  String? validateDate(String? value) {
    Pattern pattern = r'/^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$/';
    RegExp regex = RegExp(pattern as String);
    return (!regex.hasMatch(value!.trim())) ? "Please Enter A Valid Date" : null;
  }

  String? validatePassword(String? value) {
    return value!.length >= 8
        ? null
        : "Password should be at least 8 characters.";
  }

  String? validateNotEmpty(String? value) {
    return value!.length > 1
        ? null
        : "This field cannot be Empty";
  }

  String? validateAtLeastTwoNames(String value) {


    if (value.isEmpty) {
      return "Please enter a name";
    }
    return value.trim().split(" ").length >= 2
        ? null
        : "Please enter at least two name.";
  }

}