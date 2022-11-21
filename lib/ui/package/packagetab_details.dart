import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../view_model/package_view_model.dart';

class PackageTabDetails extends StatefulWidget {
  @override
  _PackageTabDetailsState createState() => new _PackageTabDetailsState();
}

class _PackageTabDetailsState extends State<PackageTabDetails> {
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
        {"id": "001", "label": "Name", "value": "${packageDetail['name']}"},
        {
          "id": "002",
          "label": "Type",
          "value": "${packageDetail['package_type'] ?? ""}"
        },
        {
          "id": "003",
          "label": "Valid for",
          "value":
              "${packageDetail['valid_for']} ${packageDetail['validity_unit']}"
        },
        {
          "id": "004",
          "label": "Price to Subscriber",
          "value": "${packageDetail['price_to_subscriber_human']}"
        },
        {
          "id": "007",
          "label": "Tax",
          "value": "${packageDetail['do_not_charge_tax']}"
        },
        {
          "id": "005",
          "label": "Bandwidth (Upload)",
          "value": "${packageDetail['phone1'] ?? "Key Required"}"
        },
        {
          "id": "006",
          "label": "Bandwidth (Download)",
          "value": "${packageDetail['mobile1'] ?? "Key Required"}"
        },
        {
          "id": "008",
          "label": "Description",
          "value": "${packageDetail['description']}"
        },
        {
          "id": "009",
          "label": "Hotspot Subscribers",
          "value": "${packageDetail['available_for_hotspot_subscribers'] ?? ""}"
        },
        {
          "id": "010",
          "label": "Online Payment",
          "value": "${packageDetail['available_for_online_payment']}"
        },
        {
          "id": "011",
          "label": "Bind IP Pool",
          "value": "${packageDetail['bind_ip_pool']}"
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
