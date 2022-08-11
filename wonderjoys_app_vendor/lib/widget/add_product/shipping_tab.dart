import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wonderjoys_app_vendor/firebase_services.dart';
import 'package:wonderjoys_app_vendor/provider/product_provider.dart';



class ShippingTab extends StatefulWidget {
  const ShippingTab({Key? key}) : super(key: key);

  @override
  State<ShippingTab> createState() => _ShippingTabState();
}

class _ShippingTabState extends State<ShippingTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive=>true;
  bool? _chargeShipping = false;
  FirebaseServices _services = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<ProductProvider>(
        builder: (context,provider,child){
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Charge Shipping ? ',style: TextStyle(color: Colors.grey),),
                  value: _chargeShipping,
                  onChanged: (value){
                    setState(() {
                      _chargeShipping = value;
                      provider.getFormData(
                        chargeShipping: value,
                      );
                    });
                  },
                ),
                if(_chargeShipping==true)
                 _services.formField(
                   label: 'Shipping charge',
                   inputType: TextInputType.number,
                   onChanged: (value){
                     setState(() {
                       provider.getFormData(
                         shippingCharge: int.parse(value),
                       );
                     });
                   }
                 ),
              ],
            ),
          );
        });
  }
}
