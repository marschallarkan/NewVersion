import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wonderjoys_app_vendor/model/vendor_model.dart';
import 'package:wonderjoys_app_vendor/provider/vendor_provider.dart';
import 'package:wonderjoys_app_vendor/widget/custom_drawer.dart';



class HomeScreen extends StatelessWidget {
  static const String id = 'home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _vendorData = Provider.of<VendorProvider>(context);
    if(_vendorData.doc==null){
      _vendorData.getVendorData();
    }

    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Dashboard'),
      ),
      drawer: CustomDrawer(),
      body: Center(child: Text('Dashboard',style: TextStyle(fontSize: 22,),),),
    );
  }
}
