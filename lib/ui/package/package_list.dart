import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/ui/common_widgets/headToolbar.dart';
import 'package:xceednet/ui/common_widgets/menuDrawer.dart';
import 'package:xceednet/ui/package/package_add.dart';
import 'package:xceednet/ui/package/package_details.dart';

import '../../view_model/package_view_model.dart';

class PackageList extends StatefulWidget {
  @override
  State<PackageList> createState() => _PackageListState();
}

class _PackageListState extends State<PackageList> {
  List packageList = [];
  late PackageViewModel packageViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await callAPIs();
    });
  }

  Future<void> callAPIs() async {
    bool a = await packageViewModel.getPackageListData();
    if (a) {
      packageList = packageViewModel.packageListData!;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    packageViewModel = context.watch<PackageViewModel>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text("Packages\n count :${packageViewModel.incoiceCount}"),
        actions: [
          packageViewModel.isLoading
              ? Container()
              : IconButton(
                  onPressed: () async {
                    await Navigator.of(context)
                        .push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    FadeTransition(
                                        opacity: animation,
                                        child: PackageAdd(
                                          onChange: () {
                                            callAPIs();
                                          },
                                        )),
                          ),
                        )
                        .then((value) => {callAPIs()});
                  },
                  icon: Icon(Icons.add),
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: Size(54, 54),
                    fixedSize: Size(54, 54),
                  ),
                ),
        ],
      ),
      body: packageViewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                HeadToolbar(onChange: (value) {
                  if (value.toString().isEmpty) {
                    packageList = packageViewModel.packageListData!;
                    setState(() {});
                  } else {
                    packageList =
                        packageViewModel.packageListData!.where((element) {
                      print(element['name'].toString());
                      return element['name']
                          .toString()
                          .toUpperCase()
                          .contains(value.toString().toUpperCase());
                    }).toList();
                    setState(() {});
                  }
                }),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ListView.separated(
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: packageList == null ? 0 : packageList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 5);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        Map item = packageList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        FadeTransition(
                                            opacity: animation,
                                            child: PackageDetails(item, () {
                                              callAPIs();
                                            })),
                                  ),
                                )
                                .then((value) => {callAPIs()});
                          },
                          child: Card(
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1,
                                      color: Theme.of(context).dividerColor)),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Theme.of(context)
                                                      .dividerColor))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Name : ',
                                                  style: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelMedium,
                                                      letterSpacing: 1.5),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  '${item["name"]}',
                                                  style: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.2),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Price for Subscriber : ',
                                                  style: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelMedium,
                                                      letterSpacing: 1.5),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  '${item["price_to_subscriber_human"]}',
                                                  style: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.2),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Data Limited : ',
                                                  style: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelMedium,
                                                      letterSpacing: 1.5),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  item["data_limited"] == "true"
                                                      ? 'Yes'
                                                      : 'No',
                                                  style: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.2),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Time Limited : ',
                                                  style: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelMedium,
                                                      letterSpacing: 1.5),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  item["time_limited"] == "true"
                                                      ? 'Yes'
                                                      : 'No',
                                                  style: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.2),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Hotspot Subscriber : ',
                                                  style: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelMedium,
                                                      letterSpacing: 1.5),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  item["available_for_hotspot_subscribers"] ==
                                                          "true"
                                                      ? 'Yes'
                                                      : 'No',
                                                  style: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.2),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Online Payment: ',
                                                  style: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelMedium,
                                                      letterSpacing: 1.5),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  item["available_for_online_payment"] ==
                                                          "true"
                                                      ? 'Yes'
                                                      : 'No',
                                                  style: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.2),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Status : ',
                                                  style: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelMedium,
                                                      letterSpacing: 1.5),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  "${item['status']}",
                                                  style: GoogleFonts.roboto(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.2,
                                                      color: item['status'] ==
                                                              'enabled'
                                                          ? Colors.green
                                                          : Colors.redAccent),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
