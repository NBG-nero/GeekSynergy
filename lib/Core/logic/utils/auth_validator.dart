
class AuthValidator {
validateName(String name) {
    if (name.split('').length <= 4) {
      return 'Name must be at least 4 characters';
    }
    return null;
  }

  validateEmail(String email) {
    if (!RegExp(
            r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$")
        .hasMatch(email)) {
      return 'Enter a valid Email Address';
    }
    return null;
  }

  validatePassword(String password) {
    if (password.split('').length <= 5) {
      return 'Password not Strong enough';
    }
    return null;
  }

  String isEmptyMobileNumber(value) {
    if (value.isEmpty) {
      return 'Mobile Number cannot be empty';
    }
    return null;
  }
   String numberValidator(String value) {
    // ignore: unnecessary_null_comparison
    if (value == null) {
      return null;
    }
    final n = num.tryParse(value);
    if (n == null) {
      return '"$value" is not a valid number';
    }
    return null;
  }
  String limit(value, {int min = 0, int max = 0}) {
    if (min != 0 && value.length < min) {
      return '$min minimum characters';
    } else if (max != 0 && value.length > max) {
      return '$max maximum characters';
    }
    return null;
  }

  validatemobileNumber( String value) {
    return numberValidator(value) ??
        limit(value, min: 2) ??
        isEmptyMobileNumber(value);
  }


}