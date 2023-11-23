import 'package:flutter/material.dart';
import 'package:sfh/util/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .025,
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text('Home',
                style: TextStyle(
                  color: AppColors.textcolor(),
                  fontFamily: 'Quicksand',
                )),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('create');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded),
            title: const Text('Settings'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
