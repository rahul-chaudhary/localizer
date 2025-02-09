import 'package:flutter/material.dart';
import 'package:localizer/providers/home_page_provider.dart';
import 'package:localizer/utils/constants/app_styles.dart';
import 'package:localizer/widgets/app_text_field.dart';

import '../Models/crud_tab.dart';
import '../utils/constants/text_styles.dart';
import '../utils/helpers/get_screen_width_height.dart';

class DeleteContainer extends StatefulWidget {
  const DeleteContainer({super.key, required HomePageProvider homePageProvider});

  @override
  State<DeleteContainer> createState() => _DeleteContainerState();
}

class _DeleteContainerState extends State<DeleteContainer> {
  final TextEditingController _deleteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: containerPadding,
    decoration: crudBoxDecoration,
    height: getScreenHeight(context) * .6,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CRUDTab.delete.value,
            style: AppTextStyles.titleTextStyle,
          ),
          _gap,
          myTextField(hintText: 'Enter the s.no. to delete', controller: _deleteController),
        ],
      ),

    );
  }
  SizedBox get _gap => const SizedBox(height: 12.0);
}
