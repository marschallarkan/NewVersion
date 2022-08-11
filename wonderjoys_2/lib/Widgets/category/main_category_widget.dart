import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:wonderjoys_2/Widgets/category/sub_category_widget.dart';
import 'package:wonderjoys_2/models/main_category_model.dart';
import 'package:wonderjoys_2/models/sub_category_model.dart';





class MainCategoryWidget extends StatefulWidget {
  final String? selectedCat;
  const MainCategoryWidget({this.selectedCat,Key? key}) : super(key: key);

  @override
  State<MainCategoryWidget> createState() => _MainCategoryWidgetState();
}

class _MainCategoryWidgetState extends State<MainCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FirestoreListView<MainCategory>(
        query: mainCategoryCollection(widget.selectedCat),
        itemBuilder: (context, snapshot) {
          MainCategory mainCategory = snapshot.data();
          return ExpansionTile(
              title: Text(mainCategory.mainCategory!),
            children: [
              SubCategoryWidget(
                selectedSubCat: mainCategory.mainCategory,
              ),
            ],
          );
        },
      ),
    );
  }
}
