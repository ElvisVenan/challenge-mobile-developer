class TextFieldValidator {
  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, preencha este campo obrigatório.';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, preencha o campo de e-mail.';
    }

    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Por favor, insira um endereço de e-mail válido.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, preencha o campo de senha.';
    }

    final passwordRegex = RegExp(r'^.{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'A senha deve ter pelo menos 8 caracteres.';
    }

    return null;
  }
}
