import 'package:bot_sneakers/src/model/login_model.dart';
import 'package:bot_sneakers/src/model/mac_model.dart';
import 'package:bot_sneakers/src/model/registro_tarea.dart';
import 'package:bot_sneakers/src/model/signin_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:universal_html/prefer_universal/html.dart' as localS;

class APIService {
  var usuario = localS.window.localStorage['usuario'];
  var id = localS.window.localStorage['id'];

  // ignore: missing_return
  Future<MacResponseModel> login2(MacRequestModel requestModelmac) async {
   
    String url = "https://v2-api-bot.herokuapp.com/api/v1/user/session/$id";
    
    final response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer $usuario',
      },
    );
    if (response.statusCode == 201 || response.statusCode == 401) {
      print(response.body.toString());
      return MacResponseModel.fromJson(json.decode(response.body));
    } else {
      print(response.body.toString());
      // throw Exception("Failed to load data");
    }
  }

  // ignore: missing_return
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "https://v2-api-bot.herokuapp.com/api/v1/user/login";

    final response = await http.post(url,
        headers: {
          'content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(requestModel));
    if (response.statusCode == 201 || response.statusCode == 401) {
      print(response.body.toString());
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      print(response.body.toString());
      // throw Exception("Failed to load data");
    }
  }

  Future<SigninResponseModel> createProfile(
      SigninRequestModel requestModel) async {
    String url = "https://v2-api-bot.herokuapp.com/api/v1/profile";

    final response = await http.post(url,
        headers: {
          'content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(requestModel));

    if (response.statusCode <= 205) {
      print(response.body.toString());
      return SigninResponseModel.fromJson(json.decode(response.body));
    } else {
      print(response.body.toString());
      return SigninResponseModel.fromJson(json.decode(response.body));
      // throw Exception("Failed to load data");
    }
  }

  Future<SigninResponseModel> registroo(SigninRequestModel requestModel) async {
    print(usuario);
    String url = "https://v2-api-bot.herokuapp.com/api/v1/user/register";

    final response = await http.post(url,
        headers: {
          'content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $usuario',
        },
        body: jsonEncode(requestModel));
    if (response.statusCode <= 205) {
      print(response.body.toString());
      return SigninResponseModel.fromJson(json.decode(response.body));
    } else {
      print(response.body.toString());
      return SigninResponseModel.fromJson(json.decode(response.body));
      // throw Exception("Failed to load data");
    }
  }

  Future<RegistroTareaResponseModel> registroTarea(RegistroTareaRequestModel requestModel) async {
    print(usuario);
    String url = "https://v2-api-bot.herokuapp.com/api/v1/task";

    final response = await http.post(url,
        headers: {
          'content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $usuario',
        },
        body: jsonEncode(requestModel));
    if (response.statusCode <= 205) {
      print(response.body.toString());
      return RegistroTareaResponseModel.fromJson(json.decode(response.body));
    } else {
      print(response.body.toString());
      return RegistroTareaResponseModel.fromJson(json.decode(response.body));
      // throw Exception("Failed to load data");
    }
  }


  // ignore: missing_return
  Future<CardResponseModel> cardList() async {
   
    String url = "https://v2-api-bot.herokuapp.com/api/v1/card";
    
    final response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhYmUxN2IyZi03Yjk1LTQ3MDYtOGNjMS0wNTg2MDgyNzNmZWUiLCJuYW1lIjoiQ2hyaXN0aWFuIEF4ZWwgU2VycmFubyBTYW5kb3ZhbCIsImVtYWlsIjoic2Vyc2FuMi5jaHJpc3RpMWFuQGdtYWlsLmNvbSIsInVzZXJUeXBlIjoiQ2xpZW50IiwiaWF0IjoxNjEzMDAyODgwLCJleHAiOjE2MTU1OTQ4ODB9.XRfpvf5NGBYVk74IinLkEI-CwbgP3VY-dm_gWP1Rnno',
      },
    );
    if (response.statusCode == 201 || response.statusCode == 401) {
      print(response.body.toString());

    //  print(response.body);
      return CardResponseModel.fromJson(json.decode(response.body));
    } else {
   //   print(response.body.toString());
      // throw Exception("Failed to load data");
    }
  }
}
