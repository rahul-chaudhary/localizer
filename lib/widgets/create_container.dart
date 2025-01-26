import 'package:flutter/material.dart';
import 'package:localizer/Models/crud_tab.dart';
import 'package:localizer/providers/home_page_provider.dart';
import 'package:localizer/utils/helpers/get_screen_width_height.dart';
import 'package:localizer/widgets/app_button.dart';
import 'package:localizer/widgets/app_text_field.dart';
import '../Models/TableRowItem.dart';
import '../utils/constants/app_color.dart';

class CreateContainer extends StatefulWidget {
  final HomePageProvider homepageProvider;

  const CreateContainer({super.key, required this.homepageProvider});

  @override
  State<CreateContainer> createState() => _CreateContainerState();
}

class _CreateContainerState extends State<CreateContainer> {
  late final TextEditingController keyController;
  late final TextEditingController englishPhraseController;
  late final TextEditingController hindiPhraseController;
  late final TextEditingController marathiPhraseController;

  @override
  void initState() {
    super.initState();
    keyController = TextEditingController();
    englishPhraseController = TextEditingController();
    hindiPhraseController = TextEditingController();
    marathiPhraseController = TextEditingController();
  }

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
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.lightGrey),
      ),
      height: getScreenHeight(context) * .55,
      width: getScreenWidth(context) * .5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CRUDTab.create.value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
                    controller: englishPhraseController),
              ),
              Flexible(
                  child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppButton(
                    text: 'Auto Translate',
                    onPressed: () {},
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
          _gap,
          Center(
            child: AppButton(
              text: 'Save',
              onPressed: () {
                widget.homepageProvider.addTableRowItem(
                  TableRowItem(
                    key: keyController.text,
                    englishItem: englishPhraseController.text,
                    hindiItem: hindiPhraseController.text,
                    marathiItem: marathiPhraseController.text,
                  ),
                );
                _clearFields();
              },
            ),
          ),
        ],
      ),
    );
  }

  SizedBox get _gap => const SizedBox(height: 24);

  void _clearFields() {
    keyController.clear();
    englishPhraseController.clear();
    hindiPhraseController.clear();
    marathiPhraseController.clear();
  }
}
