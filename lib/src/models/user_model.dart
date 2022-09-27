class UserModel {
  String? fullname;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? id;
  String? token;

  UserModel({
    this.fullname,
    this.email,
    this.phone,
    this.cpf,
    this.password,
    this.id,
    this.token,
  });

  UserModel.fromMap(Map<String, dynamic> map) {
    fullname = map['fullname'];
    email = map['email'];
    phone = map['phone'];
    cpf = map['cpf'];
    password = map['password'];
    id = map['id'];
    token = map['token'];
  }

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'password': password,
      'id': id,
      'token': token,
    };
  }

  @override
  String toString() {
    return 'UserModel(fullname: $fullname, email: $email, phone: $phone, cpf: $cpf, password: $password, id: $id, token: $token)';
  }
}
