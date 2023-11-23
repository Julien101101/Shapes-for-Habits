import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfh/util/app_colors.dart';
import 'package:sfh/util/dimensions.dart';

class RoundedInputField extends StatefulWidget {
  final String? hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final bool obscureText;
  final TextInputType textInputType;
  final Function? validator;
  final bool? enable;
  final String? labelText;
  final TextEditingController? textEditingController;
  final bool autofocus;
  final Color? color;

  const RoundedInputField({
    Key? key,
    this.hintText,
    this.color,
    this.icon = Icons.person,
    this.onChanged,
    this.autofocus = false,
    this.onSaved,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.validator,
    this.enable,
    this.textEditingController,
    this.labelText,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    DeviceDimension.init(context: context);
    return Column(
      children: [
        SizedBox(
          height: DeviceDimension.sizedBoxHeight,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.labelText!,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColors.textcolor(),
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.normal,
              fontSize: DeviceDimension.smallTextSize,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          style: TextStyle(
            color: widget.color,
          ),
          autofocus: widget.autofocus,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          obscureText: _obscureText,
          keyboardType: widget.textInputType,
          validator: widget.validator as String? Function(String?)?,
          enabled: widget.enable,
          controller: widget.textEditingController,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: DeviceDimension.appTwentyPadding,
              horizontal: DeviceDimension.appTwentyPadding,
            ),
            border: const OutlineInputBorder(),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: _obscureText
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    })
                : const SizedBox(
                    height: 0.1,
                  ),
            labelText: widget.labelText,
          ),
        ),
      ],
    );
  }
}
