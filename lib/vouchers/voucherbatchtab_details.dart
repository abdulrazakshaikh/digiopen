import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VoucherBatchTabDetails extends StatefulWidget {
  @override
  _VoucherBatchTabDetailsState createState() => new _VoucherBatchTabDetailsState();
}

class _VoucherBatchTabDetailsState extends State<VoucherBatchTabDetails> {


List detailsList = [
  {
    "id": "001",
    "label" : "ID",
    "value" : "#12346579"
  },
  {
    "id": "002",
    "label" : "Package",
    "value" : "100"
  },
  {
    "id": "003",
    "label" : "Price per voucher",
    "value" : "₹100"
  },
  {
    "id": "004",
    "label" : "No. of Vouchers",
    "value" : "2"
  },
  {
    "id": "005",
    "label" : "Voucher Type",
    "value" : "Pin"
  },
  {
    "id": "006",
    "label" : "Voucher Valid Till",
    "value" : "23-Sep-2022"
  },
];

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                    child: Text('${item["label"]} : ',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelMedium,
                      letterSpacing: 1.5
                    ),
                  ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 65,
                    child: Text('${item["value"]}',
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                  )
                ],
              ),
            );
          }
        ),
        ),
      ],
    );   
  }
}