import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class DetailsProvider extends ChangeNotifier {
  User _user;

  User get user => _user;

  Future<User> fetchUser(int id) async {
    String url = 'https://reqres.in/api/users/$id';
    http.Response response = await http.get(url);
    var res = json.decode(response.body);
    _user = User.fromJson(res['data']);
    return _user;
  }
}
