import 'package:flutter/material.dart';
import 'package:tqniaapp/Core/constans/const.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/styles.dart';

Widget defaultButton({
  required VoidCallback fun,
  required textWidget,
  required Color c,
  double radius = 10,
  double height = 63,
  double width = double.infinity,
}) =>
    InkWell(
      onTap: () {
        fun();
      },
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: c,
          borderRadius: BorderRadius.circular(
            radius,
          ),
          border: Border.all(
            color: kMainColor, //                   <--- border color
          ),
        ),
        child: Center(
          child: textWidget,
        ),
      ),
    );

Widget customTextFiled(
        {required TextEditingController controller,
        TextInputType type = TextInputType.name,
        Widget? prefixIcon,
        var ontapFun,
        String? hintText,
        bool enabled = true,
        double rad = 10,
        int maxLines = 1}) =>
    TextField(
      enabled: enabled,
      controller: controller,
      onTap: ontapFun,
      onSubmitted: (v) {
        ontapFun;
      },
      maxLines: maxLines,
      keyboardType: type,
      style: StylesData.font14.copyWith(color: kMainColor),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: StylesData.font14.copyWith(color: const Color(0x330D223F)),

        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: kMainColor),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        // labelText: 'Password',
      ),
    );
Widget customTextFormedFiled({
  required controller,
  TextInputType type = TextInputType.name,
  Widget? preicon,
  bool obscureText = false,
  bool enabled = true,
  String val = "",
  Widget? sufficon,
  String? hintText,
  Function(String)? onChanged,
  Function()? onTap,
  var sufFunction,
  double rad = 10,
  maxLines = 1,
  // required void Function()? onPressed,
}) =>
    TextFormField(
      onChanged: onChanged,
      enabled: enabled,
      onTap: onTap,
      controller: controller,
      obscureText: obscureText,
      keyboardType: type,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return '';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      style: StylesData.font14.copyWith(color: kMainColor),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintText: hintText,
        prefixIcon: preicon,
        suffixIcon: sufficon,
        hintStyle: StylesData.font14.copyWith(color: const Color(0x330D223F)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: kMainColor),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Color(0xFFEAEAEA)),
          borderRadius: BorderRadius.all(
            Radius.circular(rad),
          ),
        ),

        // labelText: 'Password',
      ),
    );

// void showToast({
//   required msg,
// }) =>
//     Fluttertoast.showToast(
//         msg: msg,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: kMainColor,
//         textColor: Colors.white,
//         fontSize: 16.0);

NavegatorPush(context, page) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (builder) => page),
  );
}

Nav(context, page) {
  return Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (builder) => page), (route) => false);
}

Color colorHex(String color) {
  print(color);
  if (color == '' || color =='null') {
    return kMainColor;
  }
  return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
}

String showImageFun({required String image}) {
  print(image);
  if (image != 'null') {
    String str = image.toString();
    // print('image is $image');
    // print(str);
    const start = ':"_';
    const end = '";}';

    final startIndex = str.indexOf(start);
    final endIndex = str.indexOf(end, startIndex + start.length);

    return ('${showImageurl}_${str.substring(startIndex + start.length, endIndex)}');
  } else {
    return 'https://system.tqnia.me/assets/images/avatar.jpg';
  }
}