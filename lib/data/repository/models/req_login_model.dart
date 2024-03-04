class ReqLoginModel {
  final String? email;
  final String? password;

  ReqLoginModel({
    required this.email,
    this.password,
  });

  factory ReqLoginModel.fromJson(Map<String, dynamic> json) => ReqLoginModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
