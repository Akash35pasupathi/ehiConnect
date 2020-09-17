import 'dart:io';

import 'package:ehi_connect/core/view_model/login_page_model.dart';
import 'package:ehi_connect/ui/custom_widget/ui_utils.dart';
import 'package:ehi_connect/ui/router.dart';
import 'package:ehi_connect/ui/views/base_view.dart';
import 'package:flutter/material.dart';

import '../colors_and_images.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userIdFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();

  final FocusNode _userIdFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  // our default setting is to login, and we should switch to creating an account when the user chooses to

  @override
  Widget build(BuildContext context) {
    return BaseView<InitialPageModel>(
      builder: (baseContext, model, child) {
        return MaterialApp(
          onGenerateRoute: Router.createRoute,
          home: new Scaffold(
            appBar: _buildBar(context),
            bottomNavigationBar: SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: _buildButtons(model, context),
            )),
            body: Container(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                                height: 100,
                                width: 100,
                                image: AssetImage('assets/logo.png')),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                _buildTextFields(context, model),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("EHI Apps"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields(BuildContext context, InitialPageModel model) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextFormField(
              controller: _userIdFilter,
              textInputAction: TextInputAction.next,
              decoration: new InputDecoration(
                labelText: 'User Id',
              ),
              maxLength: 20,
              focusNode: _userIdFocus,
              onFieldSubmitted: (term) {
                _fieldFocusChange(context, _userIdFocus, _passwordFocus);
              },
            ),
          ),
          new Container(
            child: new TextFormField(
              controller: _passwordFilter,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              maxLength: 20,
              focusNode: _passwordFocus,
              onFieldSubmitted: (value) {
                _passwordFocus.unfocus();
                _loginPressed(model, context);
              },
              decoration: new InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(InitialPageModel model, BuildContext buildContext) {
    return new Row(
      children: <Widget>[
        Expanded(
          child: new RaisedButton(
              color: ColorAndImageData.submitColor,
              child: new Text(
                'Login',
                style: textFontStyle(
                  fontWeight: FontWeight.w500,
                  fontColor: Colors.white,
                ),
              ),
              onPressed: () {
                _loginPressed(model, buildContext);
              }),
        ),
        SizedBox(
          width: 3,
        ),
        Expanded(
          child: new RaisedButton(
              color: ColorAndImageData.rejectedTextColor,
              child: new Text(
                'Cancel',
                style: textFontStyle(
                  fontWeight: FontWeight.w500,
                  fontColor: Colors.white,
                ),
              ),
              onPressed: () {
                exit(0);
              }),
        ),
      ],
    );
  }

  Future<void> _loginPressed(
      InitialPageModel model, BuildContext context) async {
    if ((_userIdFilter.text == 'flutter') &&
        (_passwordFilter.text == 'flutter')) {
      Navigator.pushNamed(context, Router.registration);
    } else {
      WepAppDialog().customDialog(
          "Invalid Input", "PLease enter Valid Data", context, "Okey");
    }
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
