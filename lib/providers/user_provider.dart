import 'package:flutter/foundation.dart';

import '../models/user.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void removeUser(User user) {
    _users.remove(user);
    notifyListeners();
  }

  void updateUser(User oldUser, User newUser) {
    int index = _users.indexOf(oldUser);
    if (index != -1) {
      _users[index] = newUser;
      notifyListeners();
    }
  }
}