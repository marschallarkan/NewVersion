import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:wonderjoys_2/Widgets/home_productList.dart';
import 'package:wonderjoys_2/models/category_model.dart';
import 'package:wonderjoys_2/screens/main_screen.dart';


class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text(
                  'Products per te',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 20,
                  ),
                ),
                TextButton(
                    child: Text('View all...',style: TextStyle(fontSize: 12,),),
                    onPressed: (){
                    },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8,0,8,8),
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                      child: FirestoreListView<Category>(
                        scrollDirection: Axis.horizontal,
                        query: categoryCollection,
                        itemBuilder: (context, snapshot) {
                          Category category = snapshot.data();
                          return Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: ActionChip(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)
                              ),
                             backgroundColor: _selectedCategory == category.catName ? Colors.pink.shade900: Colors.grey,
                              label: Text(
                               category.catName!
                              ,style:   TextStyle(
                                fontSize: 12,
                                color:  _selectedCategory==category.catName ? Colors.white : Colors.black,
                              ),
                              ),
                              onPressed: (){
                                setState(() {

                                _selectedCategory = category.catName;
                                });
                              },
                            ),
                          );
                        },
                      ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: Colors.grey.shade400),),
                    ),
                    child: IconButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context)=>const MainScreen(
                                    index: 1,
                          ),
                          ),
                          );
                        },
                        icon: const Icon(IconlyLight.arrowDown),
                    ),
                  ),
                ],
              ),
            ),
          ),
          HomeProductList(
            category: _selectedCategory,
          ),
        ],
      ),

    );
  }
}
