import 'package:ehi_connect/core/view_model/login_page_model.dart';
import 'package:ehi_connect/ui/custom_widget/ui_utils.dart';
import 'package:ehi_connect/ui/router.dart';
import 'package:ehi_connect/ui/views/base_view.dart';
import 'package:flutter/material.dart';

import '../colors_and_images.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _userIdFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
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
              child: _buildButtons(model),
            )),
            body: Center(
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
                            _buildTextFields(),
                          ],
                        ),
                      ),
                    ),
                  ],
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
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _userIdFilter,
              maxLength: 6,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: new InputDecoration(
                labelText: 'Pin',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(InitialPageModel model) {
    return new Row(
      children: <Widget>[
        Expanded(
          child: new RaisedButton(
              color: ColorAndImageData.submitColor,
              child: new Text(
                'Register',
                style: textFontStyle(
                  fontWeight: FontWeight.w500,
                  fontColor: Colors.white,
                ),
              ),
              onPressed: () {
                _loginPressed(model);
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
                Navigator.pop(context);
              }),
        ),
      ],
    );
  }

  Future<void> _loginPressed(InitialPageModel model) async {
    Navigator.pushNamed(context, Router.dashboard);
  }
}
