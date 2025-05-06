class Validator {
  Validator._();

  static String? validateName(String? value) {
    final condition = RegExp(r"^[a-zA-ZÀ-ÿ\s]+$");
    if (value != null && value.isEmpty) {
      return 'Campo obrigatorio!';
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Nome Invalido";
    }
    return null;
  }
  static String? validateEmail(String? value) {
    final condition = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    );
    if (value != null && value.isEmpty) {
      return 'Campo obrigatorio!';
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Email Invalido";
    }
    return null;
  }
  static String? validatePassword(String? value) {
    final condition = RegExp(
      r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$",
    );
    if (value != null && value.isEmpty) {
      return 'Campo obrigatorio!';
    }
    if (value != null && !condition.hasMatch(value)) {
      return "Password Invalido";
    }
    return null;
  }
  static String? validateconfirmPassword(String? first, String? second) {
    if (first != second) {
      return "As senhas digitadas são diferentes.";
    }
    return null;
  }
}
