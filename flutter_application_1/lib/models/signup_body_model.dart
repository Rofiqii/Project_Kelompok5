class SignUpBody {
  String f_name;
  String phone;
  String email;
  String password;
  SignUpBody(
      {required this.f_name,
      required this.phone,
      required this.email,
      required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_name'] = this.f_name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
