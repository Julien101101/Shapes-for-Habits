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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.2,
                        vertical: MediaQuery.of(context).size.height * 0.05),
                    child: Center(
                      child: TextFormField(
                        controller: shape.nameTextEditingController,
                        validator: Validators().validateNotEmpty,
                        decoration: InputDecoration(
                          labelText: 'Habit Name',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            color: Colors.black,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.2,
                        vertical: MediaQuery.of(context).size.height * 0.05),
                    child: Center(
                      child: TextFormField(
                        controller: shape.descriptionTextEditingController,
                        validator: Validators().validateNotEmpty,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            color: Colors.black,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: shape.colors.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            shape.setColor(shape.colors[index]);
                          },
                          child: GridTile(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: shape.colors[index],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(25.0),
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: size.height * 0.5,
                      child: InkWell(
                        onTap: () async {
                          shape.incrementCounter();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Polygon(sides: shape.counter, color: shape.color),
                        ),
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
        ),
      );
    }));
  }
}
