import 'package:flutter/material.dart';
import 'package:geek/Core/presentation/pages/pages.dart';
import 'package:geek/Core/presentation/screens/auth/auth_screens.dart';

class RouteGenerator {
  static Route<dynamic> generatedRote(RouteSettings settings) {
    switch (settings.name) {
      case '?':
        return MaterialPageRoute(builder: (_) => SignUp());

      case '/login':
        return MaterialPageRoute(builder: (_) => Login());

      case '/land':
        return MaterialPageRoute(builder: (_) => Landing());

        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        backgroundColor: Colors.red,
        // appBar: AppBar(
        //   title: Text('Error'),
        // ),
        body: Center(
          child: Text(
            "ERROR",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
      );
    });
  }
}
