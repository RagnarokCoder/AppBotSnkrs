class RegistroTareaResponseModel {
  final String token;
  final String error;

  RegistroTareaResponseModel({this.token, this.error});

  factory RegistroTareaResponseModel.fromJson(Map<String, dynamic> json) {
    return RegistroTareaResponseModel(
        token: json["token"] != null ? json["token"] : "",
        error: json["error"] != null ? json["error"] : "");
  }
}

class RegistroTareaRequestModel {
  String producto;
  
  RegistroTareaRequestModel(
      {this.producto
      });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "producto": producto.trim()
    };

    return map;
  }
}
