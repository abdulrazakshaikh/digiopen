import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/subscribers/subscribers_details_card.dart';

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
      length: 3,
      vsync: this,
    );
  }

  bool _isPlanActive = true;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        // title: Text(widget.title.toUpperCase()), 
        scrolledUnderElevation: 0,
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
              // foregroundColor: Theme.of(context).colorScheme.primary,
              minimumSize: Size(54, 54),
              fixedSize: Size(54, 54),
            ),
          ),

          Container(
            width: 54,
            height: 54,
            child: PopupMenuButton<String>(
              shape: RoundedRectangleBorder(),
              icon: Icon(Icons.more_vert_outlined),
              onSelected: (choice) {},
              color: Theme.of(context).colorScheme.surface,
              position: PopupMenuPosition.under,
              tooltip: 'Options',
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
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
      body: 
      
      NestedScrollView(
        floatHeaderSlivers: false,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                // color: Theme.of(context).colorScheme.tertiary.withOpacity(0.2),
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                child: SubscribersDetailsCard(),
              ),
            ),
            SliverAppBar(
              pinned: true,
              toolbarHeight: 0,
              bottom: TabBar(
                indicatorColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Theme.of(context).colorScheme.secondary,
                unselectedLabelStyle: GoogleFonts.robotoCondensed(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
                labelColor: Theme.of(context).colorScheme.primary,
                labelStyle: GoogleFonts.robotoCondensed(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600
                ),
                controller: _tabController,
                // isScrollable: true,
                onTap: (int value) {
                  setState(() {
                    _tabController.index = value;
                  });
                },
                tabs: [
                  Tab(text: 'Details'),
                  Tab(text: 'Connection'),
                  Tab(text: 'Audit Trail'),
                ]
              ),
            ),
          ];
        },
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(), 
          controller: _tabController,
          children: [
            
            SingleChildScrollView(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Subscribers Details 1', textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              )
            ),
            SingleChildScrollView(
              child: Text(
                'Subscribers Details 2', textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SingleChildScrollView(
              child: Text(
                'Subscribers Details 3', textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
      

      // CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       backgroundColor: Colors.white,

      //       actions: <Widget>[
      //         IconButton(icon: Icon(Icons.share), onPressed: () {})
      //       ],
      //       floating: false,
      //       pinned: false,

      //       //title: Text("Flexible space title"),
      //       expandedHeight: 281,
      //       flexibleSpace: Stack(
      //         children: [
      //           Positioned.fill(
      //             child: Container(
      //               width: double.infinity,
      //               height: 250,
      //               color: Colors.grey,
      //               child: Text('Lorem Ipsum Solor SIt amet s opojsiosdoio'),
      //             )
      //           ),
      //           Positioned(
      //             child: Container(
      //               height: 33,
      //               decoration: const BoxDecoration(
      //                 color: Colors.white,
      //                 borderRadius: BorderRadius.vertical(
      //                   top: Radius.circular(40),
      //                 ),
      //               ),
      //             ),
      //             bottom: -7,
      //             left: 0,
      //             right: 0,
      //           )
      //         ],
      //       ),
      //     ),
      //     SliverList(
      //         delegate: SliverChildBuilderDelegate((context, index) {
      //       return ListTile(
      //         tileColor: Colors.white,
      //         title: Text('sassa'),
      //       );
      //     }, childCount: 55))
      //   ],
      // ),
          
      
      
      
    );
  }
}


class Constants {
  static const String FirstItem = 'Reset Mac Address';
  static const String SecondItem = 'Disable Subscribers';
  static const String ThirdItem = 'Change Password';
  static const String FourthItem = 'Data Usage';
  static const List<String> choices = <String>[FirstItem, SecondItem, ThirdItem, FourthItem];
}