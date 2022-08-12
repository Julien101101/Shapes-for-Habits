import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:swipe/swipe.dart';
import 'package:vs/screens/home_page.dart';
import 'package:vs/util/validators.dart';
import 'package:vs/view%20model/shape_view_model.dart';
import 'package:vs/widgets/color_on_select.dart';
import 'package:vs/widgets/input_field.dart';
import 'package:vs/widgets/polygon.dart';
import 'package:vs/widgets/shapes.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateState();
}

class _CreateState extends State<CreateScreen> {
  String name = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Consumer<ShapeViewModel>(builder: (context, shape, child) {
      return Swipe(
        onSwipeDown: () {
          setState(() {
            print('drag');
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                    child: RoundedInputField(
                  hintText: 'Name',
                  labelText: 'Name',
                  textEditingController: shape.nameTextEditingController,
                  validator: Validators().validateNotEmpty,
                )),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () async {
                      shape.incrementCounter();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Polygon(sides: shape.counter, color: shape.color),
                    ),
                  ),
                ),
                Flexible(
                    child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await shape.saveHabits(shape.name, shape.counter);
                    }
                    pushNewScreen(context, screen: MyHomePage(title: 'Home'));
                  },
                  child: Text('Create'),
                )),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
