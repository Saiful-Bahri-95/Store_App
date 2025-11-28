import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/globar_variable.dart';
import 'package:store_app/models/category_model.dart';

class CategoryController {
  //load uploaded categories
  Future<List<Category>> loadCategories() async {
    try {
      //send http request
      http.Response response = await http.get(
        Uri.parse('$uri/api/category'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Category> categories = data
            .map((category) => Category.fromJson(category))
            .toList();
        return categories;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }
}
