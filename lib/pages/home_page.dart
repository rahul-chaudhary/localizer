import 'package:flutter/material.dart';
import 'package:localizer/Models/crud_tab.dart';
import 'package:localizer/providers/home_page_provider.dart';
import 'package:localizer/utils/constants/app_color.dart';
import 'package:localizer/utils/helpers/export_json_files.dart';
import 'package:localizer/widgets/create_container.dart';
import 'package:localizer/widgets/table_header.dart';
import 'package:localizer/widgets/table_row_widget.dart';
import 'package:provider/provider.dart';
import '../utils/constants/app_styles.dart';
import '../widgets/crud_header.dart';
import '../widgets/delete_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, homePageProvider, child) {
        return Scaffold(
          backgroundColor: AppColor.scaffoldColorLight,
          body: _buildUI(context, homePageProvider),
        );
      },
    );
  }

  Widget _buildUI(BuildContext context, HomePageProvider homePageProvider) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 1, child: _cRUDContainer(context, homePageProvider)),
              const SizedBox(width: 24),
              Expanded(flex: 1, child: _viewContainer(homePageProvider)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cRUDContainer(BuildContext context, HomePageProvider homePageProvider) {
    return Container(
      color: AppColor.scaffoldColorLight,
      child: Column(
        children: [
          const CRUDHeader(),
          const SizedBox(height: 12),
          getSelectedTab(homePageProvider),
        ],
      ),
    );
  }

  Widget getSelectedTab(HomePageProvider homePageProvider) {
    switch (homePageProvider.selectedTab) {
      case CRUDTab.create:
        return CreateContainer(homepageProvider: homePageProvider);
      case CRUDTab.read:
        return Container(); // Implement read functionality
      case CRUDTab.update:
        return Container(); // Implement update functionality
      case CRUDTab.delete:
        return DeleteContainer(homePageProvider: homePageProvider);
      default:
        return const Text('No Tab Selected');
    }
  }

  Widget _viewContainer(HomePageProvider homePageProvider) {
    final tableRowItems = homePageProvider.tableRowItems;

    return Container(
      height: viewContainerHeight(context),
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
          TableHeader(
            onExportPressed: () => exportJSONFiles(context),
          ),
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
                  buildTableRow(
                    isHeader: true,
                    no: -1,
                    keyValue: 'Key',
                    english: 'English',
                    hindi: 'Hindi',
                    marathi: 'Marathi',
                  ),
                  for (int i = 0; i < tableRowItems.length; i++)
                    buildTableRow(
                      no: i,
                      keyValue: tableRowItems[i].key,
                      english: tableRowItems[i].englishItem,
                      hindi: tableRowItems[i].hindiItem,
                      marathi: tableRowItems[i].marathiItem,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
