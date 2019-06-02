import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  final String _URL = 'https://reqres.in/api/users?page=';
  int _pageCount = 0;
  bool endOfUsers = false;

  List<User> _users = [];

  List<User> users() => List.of(_users);

  Future<bool> fetchUsers() async {
    await apiCall();
    await apiCall();
    return true;
  }


  apiCall() async{
    String url = '$_URL${++_pageCount}';

    http.Response response = await http.get(url);
    var res = json.decode(response.body);
    if(res['data'].length > 0){
      for(var i in res['data']){
        _users.add(User.fromJson(i));
      }
    }else{
      endOfUsers = true;
      notifyListeners();
    }
  }
}
