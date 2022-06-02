import 'package:flutter/material.dart';
import 'package:fluttercrud/models/user.dart';
import 'package:fluttercrud/data/dummy_users.dart';

class Users with ChangeNotifier {
  Map<String, User> _items = {
    ...DUMMY_USERS
  };

  List<User> get all {
    return [
      ..._items.values
    ];
  }

  int get count {
    return _items.length;
  }
}
