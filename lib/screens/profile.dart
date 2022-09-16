import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vs/view%20model/shape_view_model.dart';
import 'package:vs/view%20model/user_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<ShapeViewModel>().getHabit());

    Future.microtask(() => context.read<UserViewModel>().getUser());
  }
  @override
  

  Widget build(BuildContext context) {
    UserViewModel _userViewModel = context.read<UserViewModel>();
    ShapeViewModel _shapeViewModel = context.read<ShapeViewModel>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(_userViewModel.appUser.name?? "", style: TextStyle(fontSize: 30, color: Colors.grey),textAlign: TextAlign.center,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Habits: ', style: TextStyle(fontSize: 20, color: Colors.grey),textAlign: TextAlign.left,),
              ),
            ],
          ),
          ListView.builder(
            itemCount: _shapeViewModel.habits.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(_shapeViewModel.habits[index].objectName, style: TextStyle(fontSize: 20, color: Colors.grey),textAlign: TextAlign.left,),
              );
            },
          ),
        ]
      ),
    );
  }
}
