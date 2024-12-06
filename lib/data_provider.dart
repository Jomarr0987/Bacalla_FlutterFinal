import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/user.dart';

class DataProvider {
  static const String apiUrl = "https://jsonplaceholder.typicode.com/users";

  static Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => User.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
