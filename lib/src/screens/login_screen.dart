import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      height: 1000,
      margin: EdgeInsets.only(
        top: 250,
        right: 10,
        left: 10,
      ),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              emailField(bloc),
              SizedBox(
                height: 20,
              ),
              passwordField(bloc),
              SizedBox(
                height: 70,
              ),
              submitButton(bloc),
            ],
          ),
        ],
      ),
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          onPressed: snapshot.hasData ? bloc.submit : null,
          child: Text('Login'),
          color: Colors.blue,
        );
      },
    );
  }
}

Widget emailField(Bloc bloc) {
  return StreamBuilder(
    stream: bloc.email,
    builder: (context, snapshot) {
      return TextField(
        onChanged: bloc.changeEmail,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'tahu@gmail.com',
          labelText: 'Email Address',
          errorText: snapshot.error,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    },
  );
}

Widget passwordField(Bloc bloc) {
  return StreamBuilder(
    stream: bloc.password,
    builder: (context, snapshot) {
      return TextField(
        obscureText: true,
        onChanged: bloc.changePassword,
        decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          errorText: snapshot.error,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    },
  );
}
