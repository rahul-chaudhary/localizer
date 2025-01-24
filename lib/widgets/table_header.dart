import 'package:flutter/material.dart';

import '../utils/constants/app_color.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.map,
              color: AppColor.textColorLight,
            ),
            Text(
              'Map View',
              style: TextStyle(color: AppColor.textColorLight),
            ),
          ],
        ),

      );
  }
}
