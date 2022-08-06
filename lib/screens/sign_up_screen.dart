import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vs/view%20model/user_view_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    UserViewModel _userViewModel = context.read<UserViewModel>();
    return Column(
      children: [
        Container(
          color: Colors.green,
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        Form(
          key: _signUpFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: _userViewModel.nameTextEditingController,
                decoration: InputDecoration(
                  labelText: 'User Name',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              TextFormField(
                controller: _userViewModel.emailTextEditingController,
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
                      onTap: () {
                        if (_signUpFormKey.currentState!.validate()) {
                          var response = _userViewModel.createUser();
                          if (response == true) {
                            Navigator.pushNamed(context, 'home');
                          }
                          else{
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(response),
                            ));
                          }
                        }
                      },
                      child: Text('Sign up',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          )),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
