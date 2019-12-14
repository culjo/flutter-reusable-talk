import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resuable_components_talk/ui/screens/foodlist/food_list_screen.dart';
import 'package:resuable_components_talk/ui/views/uimixins/ui_steroids.dart';

class NavigatorDirector with UiSteroids {

  BuildContext context;

  NavigatorDirector(this.context);

  static NavigatorDirector of(BuildContext context) {
    return NavigatorDirector(context);
  }

  navigateTo(BuildContext context, Widget newScreen) {
    hapticSelectionFeedback();
    Navigator.push(context, CupertinoPageRoute(builder: (context) => newScreen));

  }

  openFoodList() {
    navigateTo(context, FoodListScreen());
  }

}