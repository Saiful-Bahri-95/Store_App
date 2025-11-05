import 'dart:convert';

import 'package:store_app/globar_variable.dart';
import 'package:store_app/models/user.dart';
import 'package:http/http.dart' as http;

import '../services/manage_http_response.dart';

class AuthController {
  Future<void> signUpUser({
    required context,
    required String email,
    required String fullname,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        fullname: fullname,
        email: email,
        state: '',
        city: '',
        locality: '',
        password: password,
      );
      http.Response response = await http.post(
        //inisialisasi alamat ulr kita
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          "Content-Type":
              'application/json; charset=UTF-8', //specify the context type as json
        },
      );
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          showSnackbar(context, 'Account has been Created');
        },
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  //signin user function
  Future<void> signInUser({
    required context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );
      //handle response using the manage http response
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {},
      );
    } catch (e) {
      print('Error: $e');
    }
  }
}
