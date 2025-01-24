import 'package:flutter/material.dart';
import 'package:localizer/utils/constants/app_color.dart';
import 'package:localizer/utils/helpers/get_screen_width_height.dart';

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
              Expanded(
                  flex:1 ,
                  child: _cRUDContainer(context)),
              Expanded(
                  flex:1 ,
                  child: _viewContainer(context)),
            ],
          )
        ],
      ),
    );
  }

  Widget _cRUDContainer(BuildContext context) {
    return Container();
  }

  Widget _viewContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.scaffoldColorLight,
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
        children: [
          Container(
            width: getScreenWidth(context),
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: AppColor.primaryColor,
            ),
            child: const Text('Map View', style: TextStyle(color: AppColor.textColorLight),),
          )
        ],
      ),
    );
  }
}

