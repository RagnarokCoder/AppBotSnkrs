class LoginResponseModel {
  final String token;
  final String error;
  final String usuario;
  final bool succes;

  LoginResponseModel({this.token, this.error, this.usuario, this.succes});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        token: json["token"] != null ? json["token"] : "",
        error: json["message"] != null ? json["message"] : "",
        usuario: json["userType"] != null ? json["userType"] : "",
        succes: json["success"] != null ? json["success"] : "");
  }
}

class LoginRequestModel {
  String email;
  String password;
  String mac;

  LoginRequestModel({this.email, this.password, this.mac});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "email": email.trim(),
      "password": password.trim(),
      "device": mac
    };

    return map;
  }
}


class CardResponseModel {
  final String token;
  final String error;
  final String usuario;

  CardResponseModel({this.token, this.error, this.usuario});

  factory CardResponseModel.fromJson(Map<String, dynamic> json) {
    return CardResponseModel(
        token: json["cards[{'cardNameHolder'}]"] != null ? json["cards[{'cardNameHolder'}]"] : "",
       
       );
  }
}
