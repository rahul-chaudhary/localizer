import 'package:flutter/material.dart';
import 'package:localizer/providers/home_page_provider.dart';
import 'package:localizer/utils/constants/app_styles.dart';
import 'package:localizer/utils/helpers/debug_print.dart';
import 'package:localizer/widgets/app_text_field.dart';

import '../Models/crud_tab.dart';
import '../utils/constants/text_styles.dart';
import '../utils/helpers/get_screen_width_height.dart';
import 'app_button.dart';

class DeleteContainer extends StatefulWidget {
  final HomePageProvider homePageProvider;
  const DeleteContainer(
      {super.key, required this.homePageProvider});

  @override
  State<DeleteContainer> createState() => _DeleteContainerState();
}

class _DeleteContainerState extends State<DeleteContainer> {
  final TextEditingController _deleteController = TextEditingController();
  int _enteredIndex = -1;
  String _warningText = '';
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
            myTextField(
                hintText: 'Enter the s.no. to delete',
                controller: _deleteController),
            _gap,
            Text(_warningText, style: AppTextStyles.errorTextStyle),
            Center(
                child: AppButton(
              text: 'Save',
              onPressed: () {

                if (!_validateFields()) return;
                widget.homePageProvider.removeAnItem(_enteredIndex);
                _clearFields();
              },
            )),
          ],
        ),
    );
  }

  SizedBox get _gap => const SizedBox(height: 12.0);

  bool _validateFields() {
    try{
      _enteredIndex = int.parse(_deleteController.text);
    } catch(e) {
      setState(() {
        _warningText = '*Enter a valid s.no\n$e';
      });
      return false;
    }

    if(_deleteController.text.isEmpty){
      setState(() {
        _warningText = '*Field(s) cannot be empty';
      });
      return false;
    } else if(!widget.homePageProvider.isIndexExist(_enteredIndex)){
      dbPrint(_enteredIndex);
      setState(() {
        _warningText = '*Index not found';
      });
      return false;
    }
    _warningText = '';
    return true;
  }

  void _clearFields() {
    setState(() {
      _deleteController.text = '';
    });
  }
}
