import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wonderjoys_app_vendor/firebase_services.dart';
import 'package:wonderjoys_app_vendor/provider/product_provider.dart';


class InventoryTab extends StatefulWidget {
  const InventoryTab({Key? key}) : super(key: key);

  @override
  State<InventoryTab> createState() => _InventoryTabState();
}

class _InventoryTabState extends State<InventoryTab> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive=>true;
  final FirebaseServices _service = FirebaseServices();
  bool? _manageInventory = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<ProductProvider>(builder:(context,provider, _){
     return Padding(
       padding: const EdgeInsets.all(20.0),
       child: ListView(
          children: [
            _service.formField(
                label: 'SKU',
                inputType: TextInputType.text,
                onChanged: (value){
                  provider.getFormData(
                    sku: value,
                  );
                },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Manage Inventory ? ',style: TextStyle(color: Colors.grey),),
                value: _manageInventory,
                onChanged: (value){
                  setState(() {
                    _manageInventory= value;
                    provider.getFormData(
                      manageInventory: value,
                    );
                  });
                }),
            if(_manageInventory==true)
            Column(
              children: [
                _service.formField(
                    label: 'Stock on hand',
                    inputType: TextInputType.number,
                    onChanged: (value){
                      provider.getFormData(
                        soh: int.parse(value),
                      );
                    }
                ),
                _service.formField(
                    label: 'Re-order level',
                    inputType: TextInputType.number,
                    onChanged: (value){
                      provider.getFormData(
                        reOrderLevel: int.parse(value),
                      );
                    }
                ),
              ],
            ),
          ],
        ),
     );
    }, );
  }
}
