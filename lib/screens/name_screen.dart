import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vs/util/validators.dart';
import 'package:vs/view%20model/user_view_model.dart';
import 'package:vs/widgets/input_field.dart';

class NameScreen extends StatefulWidget {
  NameScreen({Key? key}) : super(key: key);
  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final _formKey = GlobalKey<FormState>();

  late SharedPreferences pref;

  @override
  void initState() {
    initSharedPref();
    super.initState();
  }

  initSharedPref() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.read<UserViewModel>();
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Center(
                child: RoundedInputField(
              hintText: 'Name',
              labelText: 'Name',
              textEditingController: userViewModel.nameTextEditingController,
              validator: Validators().validateNotEmpty,
            )),
            ElevatedButton(
              onPressed: () {
                var response = userViewModel.createUser();
                pref.setString('id', response);
                Navigator.pop(context);
              },
              child: Text('Save'),
            )
          ],
        ));
  }
}
