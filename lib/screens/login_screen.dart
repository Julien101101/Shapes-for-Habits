import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vs/util/constants.dart';
import 'package:vs/util/validators.dart';
import 'package:vs/view%20model/user_view_model.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _nameState();
}

class _nameState extends State<LoginScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    UserViewModel _userViewModel = context.read<UserViewModel>();
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Center(child: SvgPicture.asset(Constant.IMG_4)),
            color: Colors.green,
            height: MediaQuery.of(context).size.height * 0.42,
          ),
          Form(
            key: _signUpFormKey,
            child: Column(
              children: [
                Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _userViewModel.emailTextEditingController,
                  validator: Validators().validateEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _userViewModel.passwordTextEditingController,
                  validator: Validators().validateNotEmpty,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _userViewModel.loading
                    ? Center(child: CircularProgressIndicator())
                    : InkWell(
                        onTap: () async {
                          if (_signUpFormKey.currentState!.validate()) {
                            var response = await _userViewModel.loginUser();
                            if (response == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.green,
                                      duration: Duration(milliseconds: 2500),
                                      content: Text('Login Successful',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0))));
                              Navigator.pushNamedAndRemoveUntil(
                                  context, "home", (route) => false);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.red,
                                      duration: Duration(milliseconds: 2500),
                                      content: Text('$response',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0))));
                            }
                          }
                        },
                        child: Text('Login',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            )),
                      ),
                ListTile(
                  leading: Text("Don't have an account?"),
                  trailing: Text('Sign Up'),
                  onTap: () {
                    Navigator.pushNamed(context, 'sign_up');
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
