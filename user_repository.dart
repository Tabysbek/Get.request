import 'dart:convert';

import 'package:json_example/data/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<User>?> getUser() async {
    try {
      var uri = Uri.parse('https://jsonplaceholder.typicode.com/users');
      final response = await http.get(uri);
      Iterable request = jsonDecode(response.body);
      List<User> user = request.map((e) => User.fromJson(e)).toList();
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }
  //get end

  Future<List<User>?> addUser(List<User> list, User newUser) async {
    try {
      list.add(newUser);
      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<User>?> removeUser(List<User> list, User removeUser) async {
    try {
      list.remove(removeUser);
      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
