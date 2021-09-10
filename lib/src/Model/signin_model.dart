class SigninResponseModel {
  final String token;
  final String error;

  SigninResponseModel({this.token, this.error});

  factory SigninResponseModel.fromJson(Map<String, dynamic> json) {
    return SigninResponseModel(
        token: json["token"] != null ? json["token"] : "",
        error: json["error"] != null ? json["error"] : "");
  }
}

class SigninRequestModel {
  String email;
  String password;
  String nombre;
  String day;
  String month;
  String year;

  SigninRequestModel(
      {this.nombre,
      this.email,
      this.password,
      this.day,
      this.year,
      this.month});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "email": email.trim(),
      "password": password.trim(),
      "name": nombre.trim(),
      "expirationDay": day.trim(),
      "expirationMonth": month.trim(),
      "expirationYear": year.trim(),
    };

    return map;
  }
}
