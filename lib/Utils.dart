import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

class Utils {

  static void toast(message, context) {
    Toast.show(message, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
  }
  static void hideKeyboard(context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}
