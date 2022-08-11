import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:wonderjoys_app_vendor/firebase_services.dart';
import 'package:wonderjoys_app_vendor/provider/product_provider.dart';
import 'package:wonderjoys_app_vendor/provider/vendor_provider.dart';
import 'package:wonderjoys_app_vendor/widget/add_product/attribute_tab.dart';
import 'package:wonderjoys_app_vendor/widget/add_product/general_tab.dart';
import 'package:wonderjoys_app_vendor/widget/add_product/images_tab.dart';
import 'package:wonderjoys_app_vendor/widget/add_product/inventory_tab.dart';
import 'package:wonderjoys_app_vendor/widget/add_product/shipping_tab.dart';
import 'package:wonderjoys_app_vendor/widget/custom_drawer.dart';


class AddProductScreen extends StatelessWidget {
  static const String id = 'add-add_product-screen';
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<ProductProvider>(context);
    final _vendor = Provider.of<VendorProvider>(context);
    final _formKey = GlobalKey<FormState>();
    FirebaseServices _services = FirebaseServices();
    return Form(
      key: _formKey ,
      child: DefaultTabController(
        length: 6,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Add New products'),
            bottom: const TabBar(
              isScrollable: true,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 4,
                  color: Colors.cyan,
                ),
              ),
              tabs: [
                Tab(
                  child: Text('General'),
                ),
                Tab(
                  child: Text('Inventory'),
                ),
                Tab(
                  child: Text('Shipping'),
                ),
                Tab(
                  child: Text('Attributes'),
                ),
                Tab(
                  child: Text('Linked Products'),
                ),
                Tab(
                  child: Text('Images'),
                ),
              ],
            ),
          ),
          drawer: const CustomDrawer(),
          body: const TabBarView(
            children: [
              GeneralTab(),
              InventoryTab(),
              ShippingTab(),
              AttributeTab(),
              Center(child: Text('Linked Products Tab'),),
              ImagesTab(),
            ],
          ),
          persistentFooterButtons: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Save Product'),
                onPressed: (){
                if(_provider.imageFiles!.isEmpty){
                  _services.scaffold(context, 'Image not selected');
                  return;
                }
                if(_formKey.currentState!.validate()){
                  EasyLoading.show(status: 'Please wait ....');
                  _provider.getFormData(
                    seller: {
                      'name' : _vendor.vendor!.businessName,
                      'uid' : _services.user!.uid,
                    },
                  );
                _services.uploadFiles(
                  images: _provider.imageFiles,
                  ref: 'products/${_vendor.vendor!.businessName}/${_provider.productData!['productName']}',
                  provider: _provider,
                ).then((value){
                  if(value.isNotEmpty){
                  _services.saveToDb(
                    data: _provider.productData,
                    context: context,
                  ).then((value) {
                    EasyLoading.dismiss();
                    _provider.clearProductData();
                    });
                    }
                  });
                  }
                },
               ),
              ),
          ],
        ),
      ),
    );
  }
}
