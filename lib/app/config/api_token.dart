import 'package:get_storage/get_storage.dart';
import 'dart:convert' show json, base64, ascii;

final _storage = GetStorage();


//set token
void setToken(String token){
  _storage.write("api_token", token);
}

//remove token 
void removeToken(){
  _storage.remove("api_token");
}


//read token
Future<Map<String, dynamic>?> readToken() async{

  final Map<String, dynamic> payload;
  var token = await _storage.read("api_token");

  if(token == null) return null;

  payload = json.decode(
    ascii.decode(
      base64.decode(
        base64.normalize(
          token.split(".")[1]
        )
      )
    )
  ); 
  return payload;
}


//check api token status (is valid or not)

Future<bool> isTokenValid() async{
  var payload = await readToken();
  if(payload == null) return false;
  var isExp = DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000).isAfter(DateTime.now());
  if(isExp) return true;
  return false;
}


Future<String?> get getToken async{ 
  var token = await _storage.read("api_token");
  // print(token == null);

  if(token == null) return null;
  return token;
}