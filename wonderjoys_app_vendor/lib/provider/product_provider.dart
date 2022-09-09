import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class  ProductProvider with ChangeNotifier{

  Map<String,dynamic>? productData={
    'approved':false
  };
  final List<XFile>? imageFiles = [];

  getFormData(
      {String? productName,
      int? regularPrice,
      int? salesPrice,
      String? taxStatus,
      double? taxValue,
      String? category,
        String? mainCategory,
      String? subCategory,
      String? description,
      DateTime? scheduleDate,
      String?  sku,
      bool? manageInventory,
      int?  soh,
      int?  reOrderLevel,
      bool? chargeShipping,
      int?  shippingCharge,
      String? brand,
      List? sizeList,
      String? otherDetails,
      String?  unit,
      List? imageUrls,
      Map?   seller,
      }){
   if(productName!=null){
     productData!['productName'] = productName;
   }
   if(regularPrice!=null){
     productData!['regularPrice'] = regularPrice;
   }
   if(salesPrice!=null){
     productData!['salesPrice'] = salesPrice;
   }
   if(taxStatus!=null){
     productData!['taxStatus'] = taxStatus;
   }
   if(taxValue!=null){
     productData!['taxValue'] = taxValue;
   }
   if(category!=null){
     productData!['category'] = category;
   }
   if(mainCategory!=null){
     productData!['mainCategory'] = mainCategory;
   }
   if(subCategory!=null){
     productData!['subCategory'] = subCategory;
   }
   if(description!=null){
     productData!['description'] = description;
   }
   if(scheduleDate!=null){
     productData!['scheduleDate'] = scheduleDate;
   }
   if(sku!=null){
     productData!['sku'] = sku;
   }
   if(manageInventory!=null){
     productData!['manageInventory'] = manageInventory;
   }
   if(soh!=null){
     productData!['soh'] = soh;
   }
   if(reOrderLevel!=null){
     productData!['reOrderLevel'] = reOrderLevel;
   }
   if(chargeShipping!=null){
     productData!['chargeShipping'] = chargeShipping;
   }
   if(shippingCharge!=null){
     productData!['shippingCharge'] = shippingCharge;
   }
   if(brand!=null){
     productData!['brand'] = brand;
   }
   if(sizeList!=null){
     productData!['sizeList'] = sizeList;
   }
   if(otherDetails!=null){
     productData!['otherDetails'] = otherDetails;
   }
   if(unit!=null){
     productData!['unit'] = unit;
   }
   if(imageUrls!=null){
     productData!['imageUrls'] = imageUrls;
   }
   if(seller!=null){
     productData!['seller'] = seller;
   }
    notifyListeners();
  }
  getImageFile(image){
    imageFiles!.add(image);
    notifyListeners();
  }

  clearProductData(){
    productData!.clear();
    imageFiles!.clear();
    productData!['approved']= false;
    notifyListeners();
  }




}