import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/utils/AppUtils.dart';

import '../../model/storage/shared_prefs.dart';

class PaymentDetailsCard extends StatefulWidget {
  Map subscriberDetail;

  PaymentDetailsCard(this.subscriberDetail, {Key? key}) : super(key: key);

  @override
  State<PaymentDetailsCard> createState() => _PaymentDetailsCardState();
}

class _PaymentDetailsCardState extends State<PaymentDetailsCard>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    //  var string1 = widget.subscriberDetail['invoice_date'].toString().substring(0,10).toString();
    //  String expires_at=DateFormat('dd-MMM-yyyy').format(DateFormat('yyyy-MM-dd').parse(string1));

    return Card(
        elevation: 6,
        shadowColor: Theme.of(context).shadowColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          // height: 200,
          // padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment ID # ${widget.subscriberDetail['paymentid'] ?? ""}',
                            style: GoogleFonts.robotoCondensed(
                              textStyle:
                                  Theme.of(context).textTheme.headlineSmall,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            'Subscriber :${widget.subscriberDetail['subscriber_name'] ?? ""}',
                            style: GoogleFonts.robotoCondensed(
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: 1, color: Theme.of(context).dividerColor))),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.subscriberDetail['amount_human']}',
                            style: GoogleFonts.robotoCondensed(
                              textStyle:
                                  Theme.of(context).textTheme.headlineSmall,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            'Payment Amount ',
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: TextButton(
                          onPressed: () {
                            try {
                              AppUtils.launchURL(
                                  "${SharedPrefs().getDomainUrl()}/subscriber_payments/${widget.subscriberDetail["id"]}.pdf");
                            } catch (e) {
                              AppUtils.appToast(e.toString());
                            }
                            //AppUtils.appToast("Coming soon");
                          },
                          child: Row(
                            children: [
                              Text('Share (PDF)'),
                              SizedBox(width: 3),
                              Icon(
                                Icons.share,
                                size: 18,
                              ),
                            ],
                          ),
                          style: TextButton.styleFrom(
                            textStyle: GoogleFonts.roboto(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                                fontSize: 14),
                            foregroundColor:
                                Theme.of(context).colorScheme.primary,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
