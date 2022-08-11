import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wonderjoys_app_vendor/model/product_model.dart';



class ProductDetailsScreen extends StatelessWidget {
 final  Product? product;
 final  String? productId;
  const  ProductDetailsScreen({this.product,this.productId,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(product!.productName!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: product!.imageUrls!.map((e){
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CachedNetworkImage(imageUrl: e),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 10,),
            Text(product!.productName!,style: TextStyle(fontSize: 20,),),
          ],
        ),
      ),
    );
  }
}
