import 'package:ehi_connect/ui/views/dashboard.dart';
import 'package:ehi_connect/ui/views/login_page.dart';
import 'package:ehi_connect/ui/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static const String homeLogin = '/';
  static const String registration = '/registration';
  static const String dashboard = '/Dashboard';

  static pushNavigationAndRemoveUntil(
      BuildContext context, String pathURI, dynamic nextPage) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return nextPage;
    }), ModalRoute.withName(pathURI));
  }

  static pushNavigation(BuildContext context, dynamic nextPage) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return nextPage;
      },
    ));
  }

  static Route<dynamic> createRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeLogin:
        return MaterialPageRoute(builder: (_) {
          return LoginPage();
        });

      case registration:
        return MaterialPageRoute(builder: (_) {
          return RegistrationPage();
        });

      case dashboard:
        return MaterialPageRoute(builder: (_) {
          return Dashboard(
            title: "Dashboard",
          );
        });

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
