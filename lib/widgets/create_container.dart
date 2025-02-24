import 'package:flutter/material.dart';
import 'package:localizer/Models/crud_tab.dart';
import 'package:localizer/providers/home_page_provider.dart';
import 'package:localizer/services/api_service.dart';
import 'package:localizer/utils/constants/text_styles.dart';
import 'package:localizer/utils/helpers/get_screen_width_height.dart';
import 'package:localizer/utils/helpers/validators.dart';
import 'package:localizer/widgets/app_button.dart';
import 'package:localizer/widgets/app_text_field.dart';
import '../Models/table_row_item.dart';
import '../utils/constants/app_styles.dart';

class CreateContainer extends StatefulWidget {
  final HomePageProvider homepageProvider;

  const CreateContainer({super.key, required this.homepageProvider});

  @override
  State<CreateContainer> createState() => _CreateContainerState();
}

class _CreateContainerState extends State<CreateContainer> {
  final TextEditingController keyController = TextEditingController();
  final TextEditingController englishPhraseController = TextEditingController();
  final TextEditingController hindiPhraseController = TextEditingController();
  final TextEditingController marathiPhraseController = TextEditingController();
  String _warningText = '';
  bool isLoading = false;

  @override
  void dispose() {
    keyController.dispose();
    englishPhraseController.dispose();
    hindiPhraseController.dispose();
    marathiPhraseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: containerPadding,
      decoration: crudBoxDecoration,
      height: crudContainerHeight(context),
      width: crudContainerWidth(context),
      child: SingleChildScrollView(
        child: isLoading ?
        const Center(child: CircularProgressIndicator())
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              CRUDTab.create.value,
              style: AppTextStyles.titleTextStyle,
            ),
            _gap,
            myTextField(hintText: 'Enter key', controller: keyController),
            _gap,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 3,
                  child: myTextField(
                      hintText: 'Enter English Phrase/Word',
                      autocorrect: true,
                      controller: englishPhraseController),
                ),
                Flexible(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppButton(
                      text: 'Auto Translate',
                      onPressed: onPressAutoTranslate,
                    ),
                  ),
                )),
              ],
            ),
            _gap,
            myTextField(
                hintText: 'Enter Hindi Phrases/Words',
                controller: hindiPhraseController),
            _gap,
            myTextField(
                hintText: 'Enter Marathi Phrases/Words',
                controller: marathiPhraseController),
            _gap,
            Text(_warningText, style: AppTextStyles.errorTextStyle),
            _gap,
            Center(
              child: AppButton(
                text: 'Save',
                onPressed: () {
                  if (!_validateFields()) return;
                  widget.homepageProvider.addTableRowItem(
                    TableRowItem(
                      key: keyController.text,
                      englishItem: englishPhraseController.text,
                      hindiItem: hindiPhraseController.text,
                      marathiItem: marathiPhraseController.text,
                    ),
                  );
                  // _clearFields();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateFields() {
    if (keyController.text.isEmpty ||
        englishPhraseController.text.isEmpty ||
        hindiPhraseController.text.isEmpty ||
        marathiPhraseController.text.isEmpty) {
      setState(() {
        _warningText = '*All fields are mandatory';
      });
      return false;
    } else if (!isAlphanumericAndStartsWithLowercase(keyController.text)) {
      setState(() {
        _warningText =
            '*Key should: \n1. Only start with lowercase alphabet \n2. Be alphanumeric';
      });
      return false;
    } else if(widget.homepageProvider.isKeyAlreadyPresent(keyController.text)) {
      setState(() {
        _warningText = '*Key already exists';
      });
      return false;
    }
    _warningText = '';
    return true;
  }

  SizedBox get _gap => const SizedBox(height: 24);

  void _clearFields() {
    keyController.clear();
    englishPhraseController.clear();
    hindiPhraseController.clear();
    marathiPhraseController.clear();
  }

   void onPressAutoTranslate() async {
    if(englishPhraseController.text.isEmpty) {
      setState(() {
        _warningText = '*Enter English Phrase/Word';
      });
      return;
    } else {
      setState(() {
        _warningText = '';
      });
    }

    setState(() {
      isLoading = true;
    });

    marathiPhraseController.text = await fetchTranslateText(targetLang: 'mr', text: englishPhraseController.text) ?? '';

    hindiPhraseController.text = await fetchTranslateText(targetLang: 'hi', text: englishPhraseController.text) ?? '';

    setState(() {
      isLoading = false;
    });
  }
}
