import 'package:flutter/material.dart';
import 'package:json_example/data/model/user_model.dart';
import 'package:json_example/data/repository/user_repository.dart';

enum States{loading,initial,loaded}
class UserProvider extends ChangeNotifier{
  final UserRepository _userRepository;
  UserProvider(this._userRepository);
  States states =States.initial;
  List<User>? _user=[];
  get isEmptyPage=>_user==null||_user!.isEmpty;
  get userList=>_user;

  getUser()async{
    states=States.loading;
    notifyListeners();
    _user=await _userRepository.getUser();
    states=States.loaded;
    notifyListeners();
  }

  addUser(User newUser)async{
    states=States.loading;
    notifyListeners();
    _user=await _userRepository.addUser(_user??[], newUser);
    states=States.loaded;
    notifyListeners();
  }

  removeUser(User removeUser)async{
    states=States.loading;
    notifyListeners();
    _user=await _userRepository.removeUser(_user??[], removeUser);
    states=States.loaded;
    notifyListeners();
  }

}