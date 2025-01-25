import 'package:flutter/material.dart';
import 'package:localizer/utils/helpers/get_screen_width_height.dart';

import '../utils/constants/app_color.dart';

class CRUDHeader extends StatelessWidget {
  const CRUDHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(context) * .05,
      width: getScreenWidth(context) * .5,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {},
              tooltip: 'Add a New Record',
              icon: const Icon(
                Icons.add_rounded,
                color: AppColor.scaffoldColorLight,
              )),
          IconButton(
              onPressed: () {},
              tooltip: 'Search a Record',
              icon: const Icon(Icons.search_rounded,
                  color: AppColor.scaffoldColorLight)),
          IconButton(
              onPressed: () {},
              tooltip: 'Update a Record',
              icon: const Icon(Icons.update_rounded,
                  color: AppColor.scaffoldColorLight)),
          IconButton(
              onPressed: () {},
              tooltip: 'Delete a Record',
              icon: const Icon(Icons.delete_rounded,
                  color: AppColor.scaffoldColorLight)),
        ],
      ),
    );
  }
}
