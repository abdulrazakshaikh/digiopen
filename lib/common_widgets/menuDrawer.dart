import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/accessrequest_log/accessrequest_list.dart';
import 'package:xceednet/dashboard.dart';
import 'package:xceednet/main.dart';
import 'package:xceednet/online_subscribers/onlinesubscribers_list.dart';
import 'package:xceednet/profile/profile.dart';
import 'package:xceednet/reports/reports.dart';
import 'package:xceednet/subscribers/subscribers_list.dart';
import 'package:xceednet/tickets/tickets_list.dart';

class MenuDrawer extends StatefulWidget {
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
      "title": "Dashboard",
      "submenu" : "",
    },
    {
      "id": "002",
      "title": "Subcribers",
      "submenu" : "",
    },
    {
      "id": "003",
      "title": "Online Subcribers",
      "submenu" : "",
    },
    {
      "id": "004",
      "title": "Access Request Log",
      "submenu" : "",
    },
    {
      "id": "005",
      "title": "Reports",
      "submenu" : "",
    },
    {
      "id": "006",
      "title": "Tickets",
      "submenu" : "",
    },
    {
      "id": "007",
      "title": "Leads",
      "submenu" : "",
    },
    {
      "id": "008",
      "title": "Package Sales",
      "submenu" : "",
    },
    {
      "id": "009",
      "title": "Invoices",
      "submenu" : "",
    },
    {
      "id": "010",
      "title": "Payments",
      "submenu" : "",
    },
    {
      "id": "011",
      "title": "Inventory",
      "submenu" : [
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
      "title": "Zones",
      "submenu" : "",
    },
    {
      "id": "013",
      "title": "Nodes",
      "submenu" : "",
    },
    {
      "id": "014",
      "title": "Packages",
      "submenu" : "",
    },
    {
      "id": "015",
      "title": "Vouchers",
      "submenu" : "",
    },
    {
      "id": "016",
      "title": "Voucher Batches",
      "submenu" : "",
    },
    {
      "id": "017",
      "title": "New Updates",
      "submenu" : "",
    },
  ];

  void _themeChange() {
    MyApp.themeNotifier.value = MyApp.themeNotifier.value == ThemeMode.light
    ? ThemeMode.dark
    : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                        width: 54, height: 54,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/default.jpg'),
                          radius: 60,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Augustus Harrell',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.titleLarge,
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                            ),
                            SizedBox(height: 5),
                            OutlinedButton(
                              onPressed: (){
                                Navigator.pushReplacement(context, 
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => Profile(title: 'Profile')
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                ),                 
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                alignment: Alignment.center,
                                side: BorderSide(width: 1, color: Colors.white),
                              ),
                              child: Text('View Profile',
                                style: GoogleFonts.roboto(
                                  textStyle: Theme.of(context).textTheme.labelSmall,
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close, color: Colors.white,)
                      ),
                    ],
                  ),
                ],
              )
          ),
          Container(
              child: ExpansionTile(
              collapsedBackgroundColor: Theme.of(context).colorScheme.surface,
              backgroundColor: Theme.of(context).colorScheme.surface,
              leading: Icon(Icons.admin_panel_settings_outlined),               
              title: Text('Admin',
                style: GoogleFonts.robotoCondensed(
                  textStyle: Theme.of(context).textTheme.titleSmall,
                  letterSpacing: 1.5,
                ),
              ),
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1, color: Theme.of(context).dividerColor),
                      // bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor),
                    )
                  ),
                  child: ListView.builder(
                  primary: false,
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: adminmenuList == null ? 0 : adminmenuList.length,
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
            child: Text('Navigation'.toUpperCase(),
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
                return 
                item["submenu"] == "" ? 
                ListTile(
                  trailing: Icon(Icons.chevron_right_outlined),
                  title: Text(
                    '${item["title"]}',
                    style: GoogleFonts.robotoCondensed(
                      textStyle: Theme.of(context).textTheme.titleSmall,
                      letterSpacing: 1.5,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                          FadeTransition(
                          opacity: animation,
                          child:
                          
                          item["id"] == "001" ?
                          Dashboard(title: 'Dashboard')
                          :
                          item["id"] == "002" ?
                          SubscribersList(title: 'Subscribers List')
                          :
                          item["id"] == "003" ?
                          OnlineSubscribersList(title: 'Online Subscribers List')
                          : 
                          item["id"] == "004" ?
                          AccessRequestList(title: 'Access Request Log')
                          : 
                          item["id"] == "005" ?
                          Reports(title: 'Report')
                          : 
                          item["id"] == "006" ?
                          TicketsList(title: 'Tickets List')
                          : 
                          null,

                        ),
                      ),
                    );
                  },
                ) 
                :
                ExpansionTile(
                  childrenPadding: EdgeInsets.only(left: 15),
                  title: Text(
                    '${item["title"]}',
                    style: GoogleFonts.robotoCondensed(
                      textStyle: Theme.of(context).textTheme.titleSmall,
                      fontSize: 14, 
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                    ),
                  ),
                  children: 
                  item["submenu"].map((subitem) => 
                    ListTile(
                      trailing: Icon(Icons.chevron_right_outlined),
                      title: Text('${subitem["title"]}',
                      style: GoogleFonts.robotoCondensed(
                        textStyle: Theme.of(context).textTheme.titleSmall,
                        letterSpacing: 1.5,
                      ),
                      ),
                      onTap: (){
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) =>
                              FadeTransition(
                              opacity: animation,
                              child: Dashboard(title: 'Dashboard'),
                            ),
                          ),
                        );
                      },
                    ),
                  ).toList().cast<Widget>(),
                )
                ;
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
              border: Border(top: BorderSide(width: 1, color: Color.fromRGBO(255, 255, 255, 0.2)))
            ),
            child: ListTile(
              tileColor: Theme.of(context).colorScheme.surface,
              horizontalTitleGap: 0,
              trailing: Icon(MyApp.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              title: Text(
                MyApp.themeNotifier.value == ThemeMode.light
                    ? 'Dark Mode'
                    : 'Light Mode',
                style: GoogleFonts.robotoCondensed(
                    textStyle: Theme.of(context).textTheme.titleSmall,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold),
              ),
              onTap: _themeChange,
            ),
          )
        ],
      ),
    );
  }




}



