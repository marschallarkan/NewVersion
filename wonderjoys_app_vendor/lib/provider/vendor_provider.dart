

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wonderjoys_app_vendor/firebase_services.dart';
import 'package:wonderjoys_app_vendor/model/vendor_model.dart';

class VendorProvider with ChangeNotifier{
  FirebaseServices services = FirebaseServices();
  DocumentSnapshot? doc ;
   Vendor vendor= Vendor();

  getVendorData(){
    services.vendor.doc(services.user!.uid).get().then((document){
      doc=document;
      if(document.data()!=null) {
        vendor = Vendor.fromJson(document.data() as Map<String,dynamic> );
      }
      notifyListeners();

    });

  }

}