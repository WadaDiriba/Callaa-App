import 'package:callaa_app/features/auth/data/model/user_model.dart';
import 'package:callaa_app/features/auth/data/repository/auth_repository.dart';
import 'package:callaa_app/features/auth/domain/user_entity.dart';
import 'package:flutter/material.dart';


class AuthProvider with ChangeNotifier{
  
  
  final AuthRepository _repository;
  // oo trach loading how app state.
  bool _isloading=true;

  UserEntity? _currentuser;
  String?_error;
 

  AuthProvider(
    this._repository,
    );

    bool get isloading =>_isloading;
    String? get error =>_error;

    UserEntity? get currentuser => _currentuser;
Future<void> login(String username,String password) async{

_isloading = true;
_error = null;
notifyListeners();
try{
 final UserModel user = await _repository.login(username,password);
 _currentuser = UserEntity(
      id: user.id,
      username: user.username,
      fullName: user.fullName,
      referralCode: user.referralCode,
      amount: user.amount,
      totalReffered:user.totalReffered,
      totalEarned: user.totalEarned
    );


 _error = null;
}
catch (e){
_error = e.toString();
}

finally {

  _isloading = false;
  notifyListeners();
}

}


Future<void> register(String fristName,String lastName,String confirmpassword,String password,String email) async{


_isloading = true;
_error = null;
notifyListeners();
try{
 final UserModel user = await AuthRepositoryR().register(fristName,lastName,confirmpassword,password,email);
// _currentuser = UserEntity(username:user.username);
 _error = null;
}
catch (e){


  _error = e.toString();
  notifyListeners();


}


finally {

  _isloading = false;
  notifyListeners();
}



}

}