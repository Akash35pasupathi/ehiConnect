import 'package:ehi_connect/ui/colors_and_images.dart';
import 'package:ehi_connect/ui/router.dart';
import 'package:ehi_connect/ui/ui_helpers.dart';
import 'package:ehi_connect/ui/views/login_page.dart';
import 'package:flutter/material.dart';

import 'locator.dart';

void main() async {
  setupLocator();

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  bool isCompleted = false;
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget widget) {
        return widget;
      }, //ThemeSwitcher.of(context).themeData
      title: 'Login',
      theme: ThemeData(
        // Define the default brightness and colors.q
        brightness: Brightness.light,
        primaryColor: ColorAndImageData.initialPrimaryColor,
        accentColor: ColorAndImageData.assignedColor,

        // Define the default font family.
        fontFamily: 'Poppins',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: UIHelper.FontMediumLarge,
          ),
          title: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: UIHelper.FontMediumLarge,
          ),
          body1: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: UIHelper.FontMediumLarge,
          ),
        ),
      ),
      /*ThemeSwitcher.of(context).themeData,*/
      home: MyHomePage(title: 'Login'),
      onGenerateRoute: Router.createRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
