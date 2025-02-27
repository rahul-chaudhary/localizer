import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../utils/constants/app_color.dart';

class TableHeader extends StatelessWidget {
  final VoidCallback onExportPressed;
  const TableHeader({super.key, required this.onExportPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Icon(
              Icons.map,
              color: AppColor.textColorLight,
            ),
            const Text(
              'Map View',
              style: TextStyle(color: AppColor.textColorLight),
            ),
            const Spacer(),
            IconButton(
                onPressed: onExportPressed,
                tooltip: 'Export JSON File',
                icon: Icon(MdiIcons.export, color: AppColor.textColorLight)),
          ],
        ),

      );
  }
}
