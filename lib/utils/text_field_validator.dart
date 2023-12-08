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

    final passwordRegex = RegExp(r'^.{6,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'A senha deve ter pelo menos 6 caracteres.';
    }

    return null;
  }

  static String? validateCPF(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, preencha o campo de CPF.';
    }

    final cleanCPF = value.replaceAll(RegExp(r'\D'), '');

    if (cleanCPF.length != 11) {
      return 'Por favor, insira um CPF válido com exatamente 11 dígitos.';
    }

    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, preencha o campo de data.';
    }

    final cleanDate = value.replaceAll(RegExp(r'\D'), '');

    if (cleanDate.length != 8) {
      return 'Por favor, insira uma data válida no formato dd/MM/yyyy.';
    }

    final day = int.tryParse(cleanDate.substring(0, 2));
    final month = int.tryParse(cleanDate.substring(2, 4));
    final year = int.tryParse(cleanDate.substring(4, 8));

    if (day == null || month == null || year == null) {
      return 'Por favor, insira uma data válida.';
    }

    try {
      final DateTime date = DateTime(year, month, day);
      // Verifica se o ano, mês e dia correspondem ao informado pelo usuário
      if (date.year != year || date.month != month || date.day != day) {
        return 'Por favor, insira uma data válida.';
      }
    } catch (e) {
      // Trata erros ao criar o objeto DateTime
      return 'Por favor, insira uma data válida.';
    }

    return null;
  }

}
