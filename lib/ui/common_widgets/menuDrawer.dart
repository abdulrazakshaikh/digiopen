import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

class MenuDrawer extends StatefulWidget {
  var onChange;

  MenuDrawer({this.onChange});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  // Check this for M3 Components
  // https://m3.material.io/components/cards/overview

  // Navigation Rail on Hover Open Close
  // https://github.com/Luckey-Elijah/auto_expanding_navigation_rail

  List adminmenuList = [
    {
      "id": "001",
      "title": "Users",
    },
    {
      "id": "002",
      "title": "Subscribers Alert",
    },
    {
      "id": "003",
      "title": "Ticket Templates",
    },
    {
      "id": "004",
      "title": "NAS Devices",
    },
    {
      "id": "005",
      "title": "IP Pools",
    },
    {
      "id": "006",
      "title": "Settings",
    }
  ];

  List menuList = [
    {
      "id": "001",
      "icon": Icons.dashboard_outlined,
      "title": "Dashboard",
      "submenu": "",
    },
    {
      "id": "002",
      "icon": Icons.person_outlined,
      "title": "Subscribers",
      "submenu": "",
    },
    {
      "id": "003",
      "icon": Icons.account_circle_outlined,
      "title": "Online Subscribers",
      "submenu": "",
    },
    {
      "id": "014",
      "icon": Icons.inventory_outlined,
      "title": "Packages",
      "submenu": "",
    },
    {
      "id": "009",
      "icon": Icons.receipt_outlined,
      "title": "Invoices",
      "submenu": "",
    },
    {
      "id": "010",
      "icon": Icons.payments_outlined,
      "title": "Payments",
      "submenu": "",
    },
    {
      "id": "004",
      "icon": Icons.description_outlined,
      "title": "Access Request Log",
      "submenu": "",
    },
    {
      "id": "005",
      "icon": Icons.article_outlined,
      "title": "Reports",
      "submenu": "",
    },
    {
      "id": "006",
      "icon": Icons.confirmation_number_outlined,
      "title": "Tickets",
      "submenu": "",
    },
    {
      "id": "007",
      "icon": Icons.portrait_outlined,
      "title": "Leads",
      "submenu": "",
    },
    {
      "id": "008",
      "icon": Icons.shopping_basket_outlined,
      "title": "Package Sales",
      "submenu": "",
    },
    {
      "id": "011",
      "icon": Icons.inventory_2_outlined,
      "title": "Inventory",
      "submenu": [
        {
          "id": "011-1",
          "title": "Sales",
        },
        {
          "id": "011-2",
          "title": "Purchase",
        },
        {
          "id": "011-3",
          "title": "Products",
        },
        {
          "id": "011-4",
          "title": "Suppliers",
        },
        {
          "id": "011-5",
          "title": "Logs",
        },
      ],
    },
    {
      "id": "012",
      "icon": Icons.lan_outlined,
      "title": "Zones",
      "submenu": "",
    },
    {
      "id": "013",
      "icon": Icons.location_on_outlined,
      "title": "Nodes",
      "submenu": "",
    },
    {
      "id": "015",
      "icon": Icons.percent_outlined,
      "title": "Vouchers",
      "submenu": "",
    },
    {
      "id": "016",
      "icon": Icons.local_activity_outlined,
      "title": "Voucher Batches",
      "submenu": "",
    },
    {
      "id": "017",
      "icon": Icons.campaign_outlined,
      "title": "New Updates",
      "submenu": "",
    },
  ];

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    print("IsDark$value");
    themeNotifier.setIsDarkTheme(value);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(10, 15, 5, 15),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 54,
                          height: 54,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/default.jpg'),
                            radius: 60,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Augustus Harrell',
                                style: GoogleFonts.roboto(
                                  textStyle:
                                      Theme.of(context).textTheme.titleLarge,
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(height: 5),
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            FadeTransition(
                                                opacity: animation,
                                                child:
                                                    Profile(title: 'Profile')),
                                      ));
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  alignment: Alignment.center,
                                  side:
                                      BorderSide(width: 1, color: Colors.white),
                                ),
                                child: Text(
                                  'View Profile',
                                  style: GoogleFonts.roboto(
                                    textStyle:
                                        Theme.of(context).textTheme.labelSmall,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ],
                )),
            Container(
              child: ExpansionTile(
                collapsedBackgroundColor: Theme.of(context).colorScheme.surface,
                backgroundColor: Theme.of(context).colorScheme.surface,
                leading: Icon(Icons.admin_panel_settings_outlined),
                title: Text(
                  'Admin',
                  style: GoogleFonts.robotoCondensed(
                    textStyle: Theme.of(context).textTheme.titleSmall,
                    letterSpacing: 1.5,
                  ),
                ),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      top: BorderSide(
                          width: 1, color: Theme.of(context).dividerColor),
                      // bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor),
                    )),
                    child: ListView.builder(
                      primary: false,
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          adminmenuList == null ? 0 : adminmenuList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map item = adminmenuList[index];
                        return ListTile(
                          trailing: Icon(Icons.chevron_right_outlined),
                          title: Text(
                            '${item["title"]}',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.titleSmall,
                              letterSpacing: 1.5,
                            ),
                          ),
                          onTap: () {},
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'Navigation'.toUpperCase(),
                style: GoogleFonts.robotoCondensed(
                  textStyle: Theme.of(context).textTheme.labelMedium,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.5,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                primary: false,
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: menuList == null ? 0 : menuList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(height: 1);
                },
                itemBuilder: (BuildContext context, int index) {
                  Map item = menuList[index];
                  return item["submenu"] == ""
                      ? ListTile(
                          leading: Icon(item["icon"],
                              size: 24,
                              color: Theme.of(context)
                                  .iconTheme
                                  .color!
                                  .withOpacity(0.75)),
                          horizontalTitleGap: 0,
                          trailing: Icon(Icons.chevron_right_outlined),
                          title: Text(
                            '${item["title"]}',
                            style: GoogleFonts.robotoCondensed(
                              textStyle: Theme.of(context).textTheme.titleSmall,
                              letterSpacing: 1.5,
                            ),
                          ),
                          onTap: () {
                            //if(widget.onChange!=null) widget.onChange(item);
                            // Navigator.pop(context);
                            callPage(context, item);
                          },
                        )
                      : ExpansionTile(
                          // childrenPadding: EdgeInsets.only(left: 15),
                          leading: Icon(item["icon"],
                              size: 24,
                              color: Theme.of(context)
                                  .iconTheme
                                  .color!
                                  .withOpacity(0.75)),
                          title: Align(
                            alignment: Alignment(-1.25, 0),
                            child: Text(
                              '${item["title"]}',
                              style: GoogleFonts.robotoCondensed(
                                textStyle:
                                    Theme.of(context).textTheme.titleSmall,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                          children: item["submenu"]
                              .map(
                                (subitem) => ListTile(
                                  trailing: Icon(
                                    Icons.chevron_right_outlined,
                                  ),
                                  horizontalTitleGap: 0,
                                  contentPadding:
                                      EdgeInsets.only(left: 55, right: 15),
                                  title: Text(
                                    '${subitem["title"]}',
                                    style: GoogleFonts.robotoCondensed(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  onTap: () {
                                    print(subitem['title']);
                                    //if(widget.onChange!=null)  widget.onChange(subitem);
                                    //Navigator.pop(context);
                                    callPage(context, subitem);
                                  },
                                ),
                              )
                              .toList()
                              .cast<Widget>(),
                        );
                  // return ListTile(
                  //   trailing: Icon(Icons.chevron_right_outlined),
                  //   title: Text(
                  //     '${item["title"]}',
                  //     style: GoogleFonts.robotoCondensed(
                  //       textStyle: Theme.of(context).textTheme.titleSmall,
                  //       letterSpacing: 1.5,
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     Navigator.of(context).push(
                  //       PageRouteBuilder(
                  //         pageBuilder: (context, animation, secondaryAnimation) =>
                  //           FadeTransition(
                  //           opacity: animation,
                  //           child: Dashboard(title: 'Dashboard'),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(255, 255, 255, 0.2)))),
              child: ListTile(
                tileColor: Theme.of(context).colorScheme.surface,
                horizontalTitleGap: 0,
                trailing: Icon(themeNotifier.darkTheme
                    ? Icons.dark_mode
                    : Icons.light_mode),
                title: Text(
                  themeNotifier.darkTheme ? 'Dark Mode' : 'Light Mode',
                  style: GoogleFonts.robotoCondensed(
                      textStyle: Theme.of(context).textTheme.titleSmall,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  onThemeChanged(!themeNotifier.darkTheme, themeNotifier);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void callPage(BuildContext context, Map<dynamic, dynamic> item) {
    print(item['id']);
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
          opacity: animation,
          child: item["id"] == "001"
              ? Dashboard()
              : item["id"] == "002"
                  ? SubscribersList()
                  : item["id"] == "003"
                      ? OnlineSubscribersList()
                      : item["id"] == "004"
                          ? AccessRequestList()
                          : item["id"] == "005"
                              ? Reports()
                              : item["id"] == "006"
                                  ? TicketsList()
                                  : item["id"] == "007"
                                      ? LeadsList()
                                      : item["id"] == "008"
                                          ? PackageSalesList()
                                          : item["id"] == "009"
                                              ? InvoicesList()
                                              : item["id"] == "010"
                                                  ? PaymentList()
                                                  : item["id"] == "011-1"
                                                      ? SalesList()
                                                      : item["id"] == "011-2"
                                                          ? PurchaseList()
                                                          : item["id"] ==
                                                                  "011-3"
                                                              ? ProductList()
                                                              : item["id"] ==
                                                                      "011-4"
                                                                  ? SupplierList()
                                                                  : item["id"] ==
                                                                          "011-5"
                                                                      ? LogList()
                                                                      : item["id"] ==
                                                                              "012"
                                                                          ? ZonesList()
                                                                          : item["id"] == "013"
                                                                              ? NodesList()
                                                                              : item["id"] == "014"
                                                                                  ? PackageList()
                                                                                  : item["id"] == "015"
                                                                                      ? VouchersList()
                                                                                      : item["id"] == "016"
                                                                                          ? VouchersBatchesList()
                                                                                          : item["id"] == "017"
                                                                                              ? NewUpdateScreen()
                                                                                              : Dashboard(),
        ),
      ),
      (Route<dynamic> route) => false,
    );
  }
}
