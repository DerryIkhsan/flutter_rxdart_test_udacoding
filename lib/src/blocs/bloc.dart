import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
  final _emailController      = BehaviorSubject<String>();
  final _passwordController   = BehaviorSubject<String>();

  // Add data to stream
  Stream<String> get email    => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (String e, String p) => true);

  // Change data
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  void submit(){
    final validEmail      = _emailController.value;
    final validPassword   = _passwordController.value;

    print('Email is $validEmail, and password is $validPassword');
  }

  void dispose(){
    _emailController.close();
    _passwordController.close();
  }
}