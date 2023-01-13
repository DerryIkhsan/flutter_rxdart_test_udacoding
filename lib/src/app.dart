import 'package:flutter/material.dart';
import 'blocs/provider.dart';
import 'package:udacoding_rxdart_flutter_pattern/src/screens/login_screen.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}