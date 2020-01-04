class Usuario {
  String login;
  String nome;
  String email;
  String token;

  List<String> rules;

  Usuario.fromJson(Map<String, dynamic> map)
      : login = map["login"],
        nome = map["nome"],
        email = map["email"],
        token = map["token"];

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, token: $token, rules: $rules}';
  }
}
