import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../view_model/package_view_model.dart';

class PackageTabLimit extends StatefulWidget {
  @override
  _PackageTabLimitState createState() => new _PackageTabLimitState();
}

class _PackageTabLimitState extends State<PackageTabLimit> {
  Map packageDetail = {};
  List detailsList = [];
  late PackageViewModel packageViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      packageDetail = packageViewModel.packageDetail!;
      detailsList = [
        {
          "id": "001",
          "label": "Data Limited",
          "value": "${packageDetail['data_limited']}"
        },
        {
          "id": "001",
          "label": "Time Limited",
          "value": "${packageDetail['time_limited']}"
        },
        {
          "id": "001",
          "label": "Has Daily Limit",
          "value": "${packageDetail['has_daily_limit']}"
        },
        {
          "id": "001",
          "label": "Has Monthly Limit",
          "value": "${packageDetail['has_monthly_limit']}"
        },
        {
          "id": "001",
          "label": "Fair Usage Policy",
          "value": "${packageDetail['fair_usage_policy']}"
        },
      ];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    packageViewModel = context.watch<PackageViewModel>();
    return packageViewModel.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: ListView.separated(
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: detailsList == null ? 0 : detailsList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 20);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      Map item = detailsList[index];
                      return Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 35,
                              child: Text(
                                '${item["label"]} : ',
                                textAlign: TextAlign.end,
                                style: GoogleFonts.roboto(
                                    textStyle:
                                        Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.5),
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              flex: 65,
                              child: Text(
                                item["value"] == "false"
                                    ? 'No'
                                    : item["value"] == "true"
                                        ? 'Yes'
                                        : '${item["value"]}',
                                style: GoogleFonts.roboto(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                  color: item["value"] == false
                                      ? Colors.red
                                      : item["value"] == true
                                          ? Colors.green.shade700
                                          : null,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          );
  }
}
