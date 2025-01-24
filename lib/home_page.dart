import 'package:flutter/material.dart';
import 'package:localizer/utils/app_color.dart';

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
    return Column(
      children: [
        Row(
          children: [
            _cRUDContainer(context),
            _viewContainer(context),
          ],
        )
      ],
    );
  }

  Widget _cRUDContainer(BuildContext context) {
    return Container();
  }

  Widget _viewContainer(BuildContext context) {
    return Container();
  }
}

