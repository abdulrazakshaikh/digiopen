import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/ui/common_widgets/AppDatePickerTextField.dart';
import 'package:xceednet/ui/common_widgets/AppDropDown.dart';
import 'package:xceednet/ui/common_widgets/AppRupeeTextField.dart';
import 'package:xceednet/ui/common_widgets/AppTextField.dart';
import 'package:xceednet/ui/common_widgets/headToolbar.dart';
import 'package:xceednet/ui/common_widgets/menuDrawer.dart';
import 'package:xceednet/ui/subscribers/subscribers_list.dart';

class SaleItemAdd extends StatefulWidget {

  @override
  State<SaleItemAdd> createState() => _SaleItemAddState();
}

class _SaleItemAddState extends State<SaleItemAdd> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Add Sale Item"),
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
                  Navigator.pushReplacement<void, void>(
                    context, MaterialPageRoute(
                      builder: (BuildContext context) => SubscribersList()
                    )
                  );
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
          AppDropDown("Product", "Select Product", ["Prodcut 1","Product 2"], (onChangeVaslue){}),
          AppDropDown("Sale Type", "Select Sale Type", ["Sale","Rent"], (onChangeVaslue){}),
          AppDropDown("Subscriber", "Select Subscriber", ["Subscriber 1","Subscriber 2","Subscriber 3"], (onChangeVaslue){}),
          AppTextField("Sale Number","Enter Sale Number"),
          AppDatePickerTextField("Sale Date", "Select Sale Date"),
          AppRupeeTextField("Price ", "Enter Price"),
          AppTextField("Note", "Enter note"),









        ],
      ),
    );
  }
}
