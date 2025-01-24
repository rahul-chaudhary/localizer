import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:localizer/utils/constants/app_color.dart';
import 'package:localizer/utils/helpers/get_screen_width_height.dart';
import 'package:localizer/widgets/table_header.dart';
import 'package:localizer/widgets/table_row_widget.dart';
import 'package:data_table_2/data_table_2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldColorLight,
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 1, child: _cRUDContainer(context)),
              const SizedBox(width: 24),
              Expanded(flex: 1, child: _viewContainer(context)),
            ],
          )
        ],
      ),
    );
  }

  Widget _cRUDContainer(BuildContext context) {
    return Container(
      height: getScreenHeight(context) * .9,
      color: AppColor.primaryColor,
    );
  }

  Widget _viewContainer(BuildContext context) {
    return Container(
      height: getScreenHeight(context) * .9,
      decoration: BoxDecoration(
        color: AppColor.scaffoldColorLight,
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const TableHeader(),
          Flexible(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(
                  color: AppColor.lightGrey,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                children: [
                  for(int i = 0; i < 100; i++)
                  buildTableRow(no: 1, keyValue: 'Key', english: 'English', hindi: 'Hindi', marathi: 'Marathi'),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
