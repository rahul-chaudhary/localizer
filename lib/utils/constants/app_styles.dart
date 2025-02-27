import 'package:flutter/cupertino.dart';

import '../helpers/get_screen_width_height.dart';
import 'app_color.dart';

BoxDecoration get crudBoxDecoration => BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  border: Border.all(color: AppColor.lightGrey),
);

EdgeInsets get containerPadding => const EdgeInsets.all(12.0);

double crudContainerHeight(BuildContext context) => getScreenHeight(context) * .8;

double crudContainerWidth(BuildContext context) => getScreenWidth(context) * .5;

double get crudHeaderHeight => 50;

double viewContainerHeight(BuildContext context) => getScreenHeight(context) * .9;

double viewContainerWidth(BuildContext context) => getScreenWidth(context) * .5;
