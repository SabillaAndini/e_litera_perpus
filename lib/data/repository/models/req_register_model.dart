class ReqRegisterModel {
  final String? userName;
  final String? longName;
  final String? email;
  final String? password;
  final String? address;
  final int? phone;

  ReqRegisterModel(
      {required this.email,
      this.password,
      this.address,
      this.userName,
      this.longName,
      this.phone});

  factory ReqRegisterModel.fromJson(Map<String, dynamic> json) =>
      ReqRegisterModel(
        email: json["email"],
        password: json["password"],
        address: json["address"],
        userName: json["userName"],
        longName: json["longName"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "user_name": userName,
        "long_name": longName,
        "phone": phone,
        "address": address
      };
}
