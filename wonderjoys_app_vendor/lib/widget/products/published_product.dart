import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:wonderjoys_app_vendor/firebase_services.dart';
import 'package:wonderjoys_app_vendor/model/product_model.dart';
import 'package:wonderjoys_app_vendor/widget/products/product_card.dart';


class PublishedProduct extends StatelessWidget {
  const PublishedProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseServices _services = FirebaseServices();
    return FirestoreQueryBuilder<Product>(
      query: productQuery(true),
      builder: (context, snapshot, _) {
        if (snapshot.isFetching) {
          return  Center(child: const CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        }
        if(snapshot.docs.isEmpty){
          return const Center(child: Text('No Products Published yet.'),);
        }
        return ProductCard(snapshot: snapshot,);

      },
    );
  }
}
