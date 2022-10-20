import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common_widgets/menuDrawer.dart';
import 'dashboard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xceednet/ui/accessrequest_log/accessrequest_list.dart';
import 'package:xceednet/ui/dashboard.dart';
import 'package:xceednet/ui/inventory/logs/log_list.dart';
import 'package:xceednet/ui/inventory/products/product_list.dart';
import 'package:xceednet/ui/inventory/purchase/purchase_list.dart';
import 'package:xceednet/ui/inventory/sales/sales_list.dart';
import 'package:xceednet/ui/inventory/suppliers/supplier_list.dart';
import 'package:xceednet/ui/invoice/invoices_list.dart';
import 'package:xceednet/ui/leads/leads_list.dart';
import 'package:xceednet/main.dart';
import 'package:xceednet/ui/new_update.dart';
import 'package:xceednet/ui/nodes/nodes_list.dart';
import 'package:xceednet/ui/online_subscribers/onlinesubscribers_list.dart';
import 'package:xceednet/ui/package/package_list.dart';
import 'package:xceednet/ui/package/package_sales_list.dart';
import 'package:xceednet/ui/payment/payments_list.dart';
import 'package:xceednet/ui/profile/profile.dart';
import 'package:xceednet/ui/reports/reports.dart';
import 'package:xceednet/ui/subscribers/subscribers_list.dart';
import 'package:xceednet/ui/theme/color_schemes.g.dart';
import 'package:xceednet/ui/tickets/tickets_list.dart';
import 'package:xceednet/ui/vouchers/vouchers_batches_list.dart';
import 'package:xceednet/ui/vouchers/vouchers_list.dart';
import 'package:xceednet/ui/zones/zones_list.dart';
class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }

}
class HomeScreenState extends State<HomeScreen>{
   Widget widget1=Container();
   String title="Dashboard";
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget1 =Dashboard();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(onChange: (Map item){
        callPage(context, item);
      }),
      appBar: AppBar(
        title: Text(title),
        actions: [],
      ),
      body : Container(
        child: widget1,
      ),
    );
  }
  void callPage(BuildContext context, Map<dynamic, dynamic> item) {
    print(item['title']);
    title=item['title'];
    item["id"] == "001" ?
    widget1 =Dashboard()
        :
    item["id"] == "002" ?
    widget1 = SubscribersList()
        :
    item["id"] == "003" ?
    widget1 =OnlineSubscribersList()
        :
    item["id"] == "004" ?
    widget1 =AccessRequestList()
        :
    item["id"] == "005" ?
    widget1 = Reports()
        :
    item["id"] == "006" ?
    widget1 =TicketsList()
        :
    item["id"] == "007" ?
    widget1 =LeadsList()
        :item["id"] == "008" ?
    widget1 = PackageSalesList()
        :item["id"] == "009" ?
    widget1 =  InvoicesList()
        :item["id"] == "010" ?
    widget1 = PaymentList()
        :item["id"] == "011-1" ?
    widget1 =SalesList()
        :item["id"] == "011-2" ?
    widget1 =PurchaseList()
        :item["id"] == "011-3" ?
    widget1 = ProductList()
        :item["id"] == "011-4" ?
    widget1 =SupplierList()
        :item["id"] == "011-5" ?
    widget1 = LogList()
        :item["id"] == "012" ?
    widget1 =ZonesList()
        :item["id"] == "013" ?
    widget1 =NodesList()
        :item["id"] == "014" ?
    widget1 =PackageList()
        :item["id"] == "015" ?
    widget1 =VouchersList()
        :item["id"] == "016" ?
    widget1 = VouchersBatchesList()
        :item["id"] == "017" ?
    widget1 =NewUpdateScreen()
        :
    widget1 =Dashboard();


    setState(() {

    });
  }
}