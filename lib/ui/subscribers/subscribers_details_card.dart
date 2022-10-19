import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/ui/common_widgets/menuDrawer.dart';

class SubscribersDetailsCard extends StatefulWidget {
  const SubscribersDetailsCard({Key? key}) : super(key: key);

  @override
  State<SubscribersDetailsCard> createState() => _SubscribersDetailsCardState();
}

class _SubscribersDetailsCardState extends State<SubscribersDetailsCard> with TickerProviderStateMixin {
 
  bool _isPlanActive = true;

 @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Theme.of(context).shadowColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
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
                      _isPlanActive ?
                      Text('50Mbps plan',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.headlineSmall,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                        ),
                      )
                      :
                      Text('No Plan Active',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.headlineSmall,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      _isPlanActive ?
                      Text('Active Package',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        letterSpacing: 1,
                      ),
                      ) : Container(),
                    ],
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: PopupMenuButton<String>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    icon: Icon(Icons.more_vert_outlined),
                    onSelected: (choice) {},
                    color: Theme.of(context).colorScheme.surface,
                    position: PopupMenuPosition.over,
                    tooltip: 'Options',
                    itemBuilder: (BuildContext context) {
                      return Details.choices.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice,
                          style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
                      
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: 
                  _isPlanActive ?
                  RichText(
                    text: TextSpan(
                      text: 'Plan Validity till ',
                      style: GoogleFonts.robotoCondensed(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        letterSpacing: 1,
                      ),
                      children: [
                        TextSpan(text: '16 Dec, 2022')
                      ]
                    ),
                  )
                  :
                  RichText(
                    text: TextSpan(
                      text: 'Plan Expired on ',
                      style: GoogleFonts.robotoCondensed(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        letterSpacing: 1,
                        color: Colors.red,
                      ),
                      children: [
                        TextSpan(text: '11 Sep, 2022')
                      ]
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: Size(74, 42),
                    textStyle: GoogleFonts.roboto(
                      textStyle: TextStyle( fontSize: 14, letterSpacing: 1.25, fontWeight: FontWeight.w600),
                    ),
                  ),
                  child: Text('Recharge Now'),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: Theme.of(context).dividerColor)
              )
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('₹5000',
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.headlineSmall,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 1,
                        ),
                      ),
                      Text('Balance ',
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
                    onPressed: (){}, 
                    child: Row(
                      children: [
                        Text('Previous Recharges'),
                        SizedBox(width: 3),
                        Icon(Icons.arrow_forward_outlined, size: 18,), 
                      ],
                    ),
                    style: TextButton.styleFrom(
                      textStyle: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                        fontSize: 14
                      ),
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    )
                  ),
                ),
                
              ],
            ),
          ),

        ],
      ),
      )
    );
    
  
  }
}


class Details {
  static const String FirstItem = 'Add Invoices';
  static const String SecondItem = 'View Payments';
  static const String ThirdItem = 'Receive Payments';
  static const String FourthItem = 'Add Ticket';
  static const List<String> choices = <String>[FirstItem, SecondItem, ThirdItem, FourthItem];
}