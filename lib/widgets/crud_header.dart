import 'package:flutter/material.dart';
import 'package:localizer/Models/crud_tab.dart';
import 'package:localizer/providers/home_page_provider.dart';
import 'package:localizer/utils/constants/app_styles.dart';
import 'package:localizer/utils/helpers/get_screen_width_height.dart';
import 'package:provider/provider.dart';
import '../utils/constants/app_color.dart';

class CRUDHeader extends StatelessWidget {
  const CRUDHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final homePageProvider = Provider.of<HomePageProvider>(context, listen: false);
    return Container(
      height: crudHeaderHeight,
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
              onPressed: () => homePageProvider.setSelectedTab(CRUDTab.create),
              tooltip: 'Add a New Record',
              icon: const Icon(
                Icons.add_rounded,
                color: AppColor.scaffoldColorLight,
              )),
          IconButton(
              onPressed: () => homePageProvider.setSelectedTab(CRUDTab.read),
              tooltip: 'Search a Record',
              icon: const Icon(Icons.search_rounded,
                  color: AppColor.scaffoldColorLight)),
          IconButton(
              onPressed: () => homePageProvider.setSelectedTab(CRUDTab.update),
              tooltip: 'Update a Record',
              icon: const Icon(Icons.update_rounded,
                  color: AppColor.scaffoldColorLight)),
          IconButton(
              onPressed: () => homePageProvider.setSelectedTab(CRUDTab.delete),
              tooltip: 'Delete a Record',
              icon: const Icon(Icons.delete_rounded,
                  color: AppColor.scaffoldColorLight)),
        ],
      ),
    );
  }
}
