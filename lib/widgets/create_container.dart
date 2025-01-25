import 'package:flutter/material.dart';
import 'package:localizer/Models/crud_tab.dart';
import 'package:localizer/utils/helpers/get_screen_width_height.dart';
import 'package:localizer/widgets/app_button.dart';
import 'package:localizer/widgets/app_text_field.dart';

import '../utils/constants/app_color.dart';

class CreateContainer extends StatefulWidget {
  const CreateContainer({super.key});

  @override
  State<CreateContainer> createState() => _CreateContainerState();
}

class _CreateContainerState extends State<CreateContainer> {
  late final TextEditingController keyController;
  late final TextEditingController englishPhaseController;
  late final TextEditingController hindiPhaseController;
  late final TextEditingController marathiPhaseController;

  @override
  void initState() {
    super.initState();
    keyController = TextEditingController();
    englishPhaseController = TextEditingController();
    hindiPhaseController = TextEditingController();
    marathiPhaseController = TextEditingController();
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
                    controller: englishPhaseController),
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
              controller: hindiPhaseController),
          _gap,
          myTextField(
              hintText: 'Enter Marathi Phrases/Words',
              controller: marathiPhaseController),
          _gap,
          _gap,
          Center(child: AppButton(text: 'Save', onPressed: () {})),
        ],
      ),
    );
  }

  SizedBox get _gap => const SizedBox(height: 24);
}
