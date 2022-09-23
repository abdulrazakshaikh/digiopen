import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscribersDetails extends StatefulWidget {
  const SubscribersDetails({Key? key, required this.title}) : super(key: key);

  final String title;
  
  @override
  State<SubscribersDetails> createState() => _SubscribersDetailsState();
}

class _SubscribersDetailsState extends State<SubscribersDetails> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {   
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        // title: Text(widget.title.toUpperCase()),
        title: Container(
          child: Row(
            children: [
              Container(
                width: 36, height: 36,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/default.jpg'),
                  radius: 60,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Elaina Hutton',
                    style: GoogleFonts.roboto(textStyle: Theme.of(context).appBarTheme.titleTextStyle),
                  ),
                  SizedBox(height: 3),
                  Text('9876543210',
                    style: GoogleFonts.roboto(textStyle: Theme.of(context).appBarTheme.titleTextStyle, 
                      fontSize: 12, color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Instant SMS',
            onPressed: (){}, 
            icon: Icon(Icons.sms_outlined), 
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(),
              foregroundColor: Theme.of(context).colorScheme.primary,
              minimumSize: Size(54, 54),
              fixedSize: Size(54, 54),

            ),
          ),
        ],
      ),
      body: Container(
        
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.blueGrey,
              height: 150,
              child: Text(
                'TICKETS DETAILS', textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            // Scaffold(
            //     appBar: AppBar(
            //       bottom: TabBar(
            //         indicatorColor: Theme.of(context).colorScheme.primary,
            //         unselectedLabelColor: Theme.of(context).colorScheme.secondary,
            //         unselectedLabelStyle: GoogleFonts.robotoCondensed(
            //           textStyle: Theme.of(context).textTheme.bodyMedium,
            //           letterSpacing: 1.2,
            //           fontWeight: FontWeight.w600,
            //         ),
            //         labelColor: Theme.of(context).colorScheme.primary,
            //         labelStyle: GoogleFonts.robotoCondensed(
            //           textStyle: Theme.of(context).textTheme.bodyMedium,
            //           letterSpacing: 1.2,
            //           fontWeight: FontWeight.w600
            //         ),
            //         controller: _tabController,
            //         isScrollable: true,
            //         onTap: (int value) {
            //           setState(() {
            //             _tabController.index = value;
            //           });
            //         },
            //         tabs: [
            //           Tab(text: 'Lorem One'),
            //           Tab(text: 'Lorem Two'),
            //           Tab(text: 'Lorem Three'),
            //           Tab(text: 'Lorem Four'),
            //         ]
            //       ),
            //     ),
            //     body: TabBarView(
            //       viewportFraction: 550,
            //       physics: NeverScrollableScrollPhysics(), 
            //       controller: _tabController,
            //       children: [
                    
            //         Container(
            //           child: Text(
            //             'Subscribers Details 1', textAlign: TextAlign.center,
            //             style: Theme.of(context).textTheme.displayMedium,
            //           ),
            //         ),
            //         Container(
            //           child: Text(
            //             'Subscribers Details 2', textAlign: TextAlign.center,
            //             style: Theme.of(context).textTheme.displayMedium,
            //           ),
            //         ),
            //         Container(
            //           child: Text(
            //             'Subscribers Details 3', textAlign: TextAlign.center,
            //             style: Theme.of(context).textTheme.displayMedium,
            //           ),
            //         ),
            //         Container(
            //           child: Text(
            //             'Subscribers Details 4', textAlign: TextAlign.center,
            //             style: Theme.of(context).textTheme.displayMedium,
            //           ),
            //         ),

                    
                    
            //       ],
            //     ),
                
            //   ),
            
          ],
        ),
      ),
    );
  }
}
