import 'package:diabetic_maternal_care/common.dart';
import 'package:diabetic_maternal_care/common/common.dart';
import 'package:diabetic_maternal_care/common/widgets/app_button.dart';
import 'package:diabetic_maternal_care/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  void login() async {
    try {
      if (!_loginFormKey.currentState.validate()) {
        return;
      }

      setState(() {
        _isLoading = true;
      });

      _loginFormKey.currentState.save();

      if (_usernameTextController.text == 'mary' &&
          _passwordTextController.text == '123') {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        SweetAlert.show(context,
            style: SweetAlertStyle.error, subtitle: 'Invalid Credintials');

        setState(() {
          _isLoading = false;
        });
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        primary: false,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 60)),
                      Center(
                        child: Text(
                          'Diabetic Maternal Care',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 30)),
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: MediaQuery.of(context).size.height * 0.25,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Form(
                            key: _loginFormKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Username',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextFormField(
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (val) {
                                    FocusScope.of(context).unfocus();
                                    _passwordFocusNode.requestFocus();
                                  },
                                  validator: (val) =>
                                      formValidator(val, 'text', context),
                                  focusNode: _usernameFocusNode,
                                  controller: _usernameTextController,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025),
                                      border: authFormFieldDeco(context),
                                      hintText: 'User name',
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Password',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextFormField(
                                        validator: (val) =>
                                            formValidator(val, 'text', context),
                                        obscureText: true,
                                        focusNode: _passwordFocusNode,
                                        controller: _passwordTextController,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.025),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Colors.blue)),
                                            hintText: 'Password',
                                            hintStyle:
                                                TextStyle(color: Colors.grey)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                      ),
                      AppButton(
                          onPressed: _isLoading ? null : login,
                          isLoading: _isLoading,
                          text: 'Login'),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () =>
                                  {} /* Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordScreen())) */
                              ,
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  {} /* Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen())) */
                              ,
                              child: Text('Register',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
