import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:wonderjoys_app_vendor/firebase_services.dart';
import 'package:wonderjoys_app_vendor/model/product_model.dart';
import 'package:wonderjoys_app_vendor/widget/products/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, this.services,this.snapshot}): super(key:key) ;

  final FirebaseServices? services;
  final FirestoreQueryBuilderSnapshot? snapshot;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: snapshot!.docs.length,
          itemBuilder: (context, index) {
            Product product = snapshot!.docs[index].data();
            String id = snapshot!.docs[index].id;
            var discount = (product.regularPrice! - product.salesPrice!) /
                product.regularPrice! *
                100;
            return Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    flex: 1,
                    onPressed: (context){
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    flex: 1,
                    onPressed: (context){
                        services!.products.doc(id).update({
                        'approved': product.approved==false ? true : false,
                       });

                    },
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.approval,
                    label: product.approved==false ?'Approve':  'Inactive',
                  ),
                ],
              ),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ProductDetailsScreen(
                            product: product,
                            productId: id,
                          ),
                      ),
                     );
                     },
                child: Card(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(imageUrl: product.imageUrls![0]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.productName!),

                            Row(
                              children: [
                                if(product.salesPrice !=null)
                                  Text(services!.formattedNumber(product.salesPrice),),
                                const SizedBox(width: 10,),
                                Text(
                                  services!.formattedNumber(product.regularPrice),
                                  style: TextStyle(
                                    decoration: product.salesPrice != null
                                        ? TextDecoration.lineThrough
                                        :null,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text('${discount.toInt()}%',style: const TextStyle(color: Colors.red),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}