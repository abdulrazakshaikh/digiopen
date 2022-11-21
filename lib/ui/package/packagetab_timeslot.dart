import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../view_model/package_view_model.dart';

class PackageTabTimeslot extends StatefulWidget {
  @override
  _PackageTabTimeslotState createState() => new _PackageTabTimeslotState();
}

class _PackageTabTimeslotState extends State<PackageTabTimeslot> {
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
          "label": "Has Time Slot",
          "value": "${packageDetail['has_time_slot']}"
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