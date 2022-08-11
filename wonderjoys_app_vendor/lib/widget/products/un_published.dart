import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:wonderjoys_app_vendor/firebase_services.dart';
import 'package:wonderjoys_app_vendor/model/product_model.dart';
import 'package:wonderjoys_app_vendor/widget/products/product_card.dart';


class UnPublishedProduct extends StatelessWidget {
  const UnPublishedProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseServices services = FirebaseServices();
    final FirestoreQueryBuilderSnapshot snapshot;
    return FirestoreQueryBuilder<Product>(
      query: productQuery(false),
      builder: (context, snapshot, _) {
        if (snapshot.isFetching) {
          return  const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        }
        if(snapshot.docs.isEmpty) {
         return const Center(child: Text('No Un Published Products.'),);
    }
        return ProductCard(snapshot: snapshot,services: services,);

      },
    );
  }
}


