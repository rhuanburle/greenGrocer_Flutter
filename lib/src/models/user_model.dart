class UserModel {
  String name;
  String email;
  String phone;
  String cpf;
  String password;

  UserModel(
      {required this.phone,
      required this.cpf,
      required this.password,
      required this.name,
      required this.email});
}
