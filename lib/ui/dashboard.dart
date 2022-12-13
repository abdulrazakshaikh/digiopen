import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/view_model/dashboard_view_model.dart';

import 'common_widgets/menuDrawer.dart';

class Dashboard extends StatefulWidget {



  
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  late DashboardViewModel dashboardViewModel;
  late Map dashboardData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await dashboardViewModel.getDashboardData();
      if (dashboardViewModel.dashboardData != null) {
        dashboardData = dashboardViewModel.dashboardData;
        // locationList = dashboardViewModel.userlocationAccess;
        accordionList = [
          {
            "id": "001",
            "icon": Icons.person_outlined,
            "title": "Subscribers",
            "content": [
              {
                "id": "001-1",
                "label": "Total :",
                "value": "${dashboardData['all_subscribers_count']}",
              },
              {
                "id": "001-2",
                "label": "Online :",
                "value": "${dashboardData['online_subscribers_count']}",
              },
              {
                "id": "001-3",
                "label": "Active :",
                "value": "${dashboardData['active_subscribers_count']}",
              },
              {
                "id": "001-4",
                "label": "Disabled :",
                "value": "${dashboardData['disabled_subscribers_count']}",
              },
              {
                "id": "001-5",
                "label": "Acts Renewed Today :",
                "value":
                    "${dashboardData['accts_renewed_today_subscribers_count']}",
              },
              {
                "id": "001-6",
                "label": "Total Advance Renewals Scheduled :",
                "value": "${dashboardData['renewed_in_advance']}",
              },
              {
                "id": "001-7",
                "label": "Accts Expired :",
                "value": "${dashboardData["expired_subscribers_count"]}",
              },
              {
                "id": "001-8",
                "label": "Expiring Today:",
                "value": "${dashboardData['expiring_today_subscribers_count']}",
              },
              {
                "id": "001-9",
                "label": "Expiring In Next 4 Days :",
                "value":
                    "${dashboardData['expiring_next_4_days_subscribers_count']}",
              } /*,
              {
                "id": "001-10",
                "label": "Without Adv. Renewal: :",
                "value": "2",
              }*/
              ,
              {
                "id": "001-11",
                "label": "Accts Expired in Last 4 days :",
                "value":
                    "${dashboardData['expiring_last_4_days_subscribers_count']}",
              },
            ],
          },
          {
            "id": "002",
            "icon": Icons.how_to_reg_outlined,
            "title": "Registrations",
            "content": [
              {
                "id": "002-1",
                "label": "Registered Today :",
                "value": "${dashboardData['registered_today']}",
              },
              {
                "id": "002-2",
                "label": "Registered This Month :",
                "value": "${dashboardData['registered_this_month']}",
              },
              {
                "id": "002-3",
                "label": "Registered Last Month :",
                "value": "${dashboardData['registered_last_month']}",
              },
            ],
          },
          {
            "id": "008",
            "icon": Icons.receipt_long_outlined,
            "title": "Reseller Balance",
            "content": [
              {
                "id": "008-1",
                "label": "Balance : ",
                "value": "${dashboardData['reseller_balance']}",
              }
            ],
          },
          {
            "id": "003",
            "icon": Icons.portrait_outlined,
            "title": "Active Leads / Data Required",
            "content": [
              {
                "id": "003-1",
                "label": "All Active Leads :",
                "value": "24",
              },
              {
                "id": "003-2",
                "label": "Registered Today :",
                "value": "24",
              },
              {
                "id": "003-3",
                "label": "Pending Feasibility Check :",
                "value": "24",
              },
              {
                "id": "003-4",
                "label": "Pending Cabling :",
                "value": "24",
              },
              {
                "id": "003-5",
                "label": "Pending Account Activation :",
                "value": "24",
              },
              {
                "id": "003-6",
                "label": "Created by Me :",
                "value": "24",
              },
              {
                "id": "003-7",
                "label": "Assigned to Me :",
                "value": "24",
              },
            ],
          },
          {
            "id": "004",
            "icon": Icons.confirmation_number_outlined,
            "title": "Active Tickets",
            "content": [
              {
                "id": "004-1",
                "label": "All Active Tickets :",
                "value": "${dashboardData['all_active_tickets']}",
              },
              {
                "id": "004-2",
                "label": "Due in Next 4 hours :",
                "value": "${dashboardData['tickets_due_in_next_4_hours']}",
              },
              {
                "id": "004-3",
                "label": "Due in Next 8 hours :",
                "value": "${dashboardData['tickets_due_in_next_8_hours']}",
              },
              {
                "id": "004-4",
                "label": "Due by Today :",
                "value": "${dashboardData['tickets_due_by_today']}",
              },
              {
                "id": "004-5",
                "label": "Overdue :",
                "value": "${dashboardData['tickets_overdue']}",
              },
              {
                "id": "004-6",
                "label": "Created by me :",
                "value": "${dashboardData['tickets_created_by_me']}",
              },
              {
                "id": "004-7",
                "label": "Assigned to me :",
                "value": "${dashboardData['tickets_assigned_to_me']}",
              },
            ],
          },
          {
            "id": "005",
            "icon": Icons.data_usage_outlined,
            "title": "Data Usage / Data Required",
            "content": [
              {
                "id": "005-1",
                "label": "Date :",
                "value": "24",
              },
              {
                "id": "005-2",
                "label": "Downloaded :",
                "value": "24",
              },
              {
                "id": "005-3",
                "label": "Uploaded :",
                "value": "24",
              },
              {
                "id": "005-4",
                "label": "Total :",
                "value": "24",
              },
            ],
          },
          {
            "id": "006",
            "icon": Icons.receipt_long_outlined,
            "title": "Subscriber Billing",
            "content": [
              {
                "id": "006-1",
                "label": "Active Invoices :",
                "value": "${dashboardData['active_invoices_count']}",
              },
              {
                "id": "006-2",
                "label": "Total Active Invoices Amount :",
                "value": "${dashboardData['active_invoices_amount']}",
              },
              {
                "id": "006-3",
                "label": "Active Payments :",
                "value": "${dashboardData['active_payments_count']}",
              },
              {
                "id": "006-4",
                "label": "Total Active Payments Amount :",
                "value": "${dashboardData['active_payments_amount']}",
              },
              {
                "id": "006-5",
                "label": "Total Active Balance Amount Due :",
                "value": "${dashboardData['active_balance_amount_due']}",
              },
              {
                "id": "006-6",
                "label": "Total Balance Amount Due :",
                "value": "${dashboardData['total_balance_amount_due']}",
              },
            ],
          },
          {
            "id": "007",
            "icon": Icons.shopping_basket_outlined,
            "title": "Package Sales",
            "content": [
              {
                "id": "007-1",
                "label": "Packages Sold Today :",
                "value": "${dashboardData['packages_sold_today']}",
              },
              {
                "id": "007-2",
                "label": "Packages Sold Yesterday :",
                "value": "${dashboardData['packages_sold_yesterday']}",
              },
              {
                "id": "007-3",
                "label": "Packages Sold This Month :",
                "value": "${dashboardData['packages_sold_this_month']}",
              },
              {
                "id": "007-4",
                "label": "Packages Sold Last Month :",
                "value": "${dashboardData['packages_sold_last_month']}",
              },
            ],
          },
        ];
        if (dashboardData['reseller'].toString() == "false") {
          accordionList.removeWhere((element) => element['id'] == '008');
        }
        accordionList.removeWhere((element) => element['id'] == '003');
        accordionList.removeWhere((element) => element['id'] == '005');
      }
    });
  }

  List accordionList = [];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    dashboardViewModel = context.watch<DashboardViewModel>();
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [],
      ),
      body : dashboardViewModel.isLoading ? Center(
        child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
      ): ListView(
        padding: EdgeInsets.all(15),
        children: [
        ListView.separated(
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: accordionList == null ? 0 : accordionList.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10);
          },
          itemBuilder: (BuildContext context, int index) {
              Map item = accordionList[index];
              return 
              Card(
                elevation: 5,
                clipBehavior: Clip.hardEdge,
                shadowColor: Theme.of(context).shadowColor.withOpacity(0.35),  
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(width: 1, color: Theme.of(context).colorScheme.outline.withOpacity(0.1))
                ),      
                color: Theme.of(context).colorScheme.background,      
                child: Theme(
                  data: ThemeData(
                    dividerColor: Colors.transparent,
                    expansionTileTheme: ExpansionTileThemeData(
                      collapsedBackgroundColor: Theme.of(context).colorScheme.background,
                      backgroundColor: Theme.of(context).colorScheme.surface
                    ),
                  ),
                  child: ExpansionTile(    
                  initiallyExpanded : index==selected,     
                  tilePadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  iconColor: Theme.of(context).colorScheme.secondary,
                  collapsedIconColor: Theme.of(context).colorScheme.secondary,
                  leading: Container(
                    height: 36, width: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      border: Border.all(width: 1, color: Theme.of(context).colorScheme.primary.withOpacity(0.3))
                    ),
                    child: Icon(item["icon"], color: Theme.of(context).colorScheme.primary),
                  ),
                  
                  title: Text('${item["title"]}',
                  style: GoogleFonts.robotoCondensed(
                    textStyle: Theme.of(context).textTheme.titleMedium,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 15
                  ),
                  ),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        border: Border(
                          top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
                        )
                      ),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        children: 
                          item["content"].map((subitem) =>
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1, 
                                    color: 
                                    item["content"].length -1 == item["content"].indexOf(subitem) ?
                                    Colors.transparent :
                                    Theme.of(context).dividerColor
                                  )
                                )
                              ),
                              child: ListTile(
                                dense: true,
                                // contentPadding: EdgeInsets.zero,
                                horizontalTitleGap: 0,
                                title: Text('${subitem["label"]}',
                                  style: GoogleFonts.robotoCondensed(
                                    textStyle: Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5,
                                    fontSize: 13
                                  ),
                                ),
                                trailing: Text('${subitem["value"]}',
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.titleSmall,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            )
                          ).toList().cast<Widget>(),
                      ),
                    )
                    
                  ],
                  ),
                ),
              )
              ;
            },
          ),

        ],
    ),
    );
  }
}
