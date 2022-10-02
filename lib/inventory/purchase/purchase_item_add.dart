import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/AppDatePickerTextField.dart';
import 'package:xceednet/common_widgets/AppDropDown.dart';
import 'package:xceednet/common_widgets/AppRupeeTextField.dart';
import 'package:xceednet/common_widgets/AppTextField.dart';
import 'package:xceednet/common_widgets/headToolbar.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/inventory/purchase/purchase_list.dart';
import 'package:xceednet/subscribers/subscribers_list.dart';

class PurchaseItemAdd extends StatefulWidget {

  @override
  State<PurchaseItemAdd> createState() => _PurchaseItemAddState();
}

class _PurchaseItemAddState extends State<PurchaseItemAdd> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Add Purchase Item"),
        actions: [],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4)
          )
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                 Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  alignment: Alignment.center,
                ),
                child: Text('Create'),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          AppDropDown("Supplier Name", "Select Supplier Name", ["Suppler 1","Suppler 2","Suppler 3"], (onChange){}),
          AppDropDown("Product Name", "Select Product Name", ["Product 1","Product 2","Product 3"], (onChange){}),
          AppTextField("Purchase no", "Enter Purchase No",onChange: (value){},),
          AppDatePickerTextField("Purchase Date", "Select Purchase Date"),
          AppTextField("Quantity", "Enter Quantity",onChange: (value){},),
          AppRupeeTextField("Unit Price", "Enter Unit Price")
        ],
      ),
    );
  }
}
