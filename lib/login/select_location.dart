import 'package:xceednet/dashboard.dart';
import 'package:xceednet/login/forgot_password.dart';
import 'package:xceednet/login/login_success.dart';
import 'package:xceednet/login/resend_confirmation.dart';
import 'package:xceednet/login/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> with TickerProviderStateMixin {
  
  bool _showSearch = false;

List locationList = [
  {
    "id": "001",
    "location" : "Airoli",
    "url" : "digiopeners.cablecrm.com"
  },
  {
    "id": "002",
    "location" : "Sanpada",
    "url" : "digiopeners.cablecrm.com"
  },
  {
    "id": "003",
    "location" : "Kopar Khairane",
    "url" : "longlonglonglonglonglong.xyzcrm.com"
  },
  {
    "id": "004",
    "location" : "Turbe",
    "url" : "digiopeners.cablecrm.com"
  },
  {
    "id": "005",
    "location" : "Juinagar",
    "url" : "digiopeners.cablecrm.com"
  },
  {
    "id": "006",
    "location" : "Nerul",
    "url" : "digiopeners.cablecrm.com"
  },
  {
    "id": "007",
    "location" : "Seawood",
    "url" : "digiopeners.cablecrm.com"
  },
  {
    "id": "008",
    "location" : "Belapur",
    "url" : "digiopeners.cablecrm.com"
  },
  {
    "id": "009",
    "location" : "Kharghar",
    "url" : "digiopeners.cablecrm.com"
  },
  {
    "id": "010",
    "location" : "Khandeshwar",
    "url" : "digiopeners.cablecrm.com"
  },
  {
    "id": "011",
    "location" : "Panvel",
    "url" : "digiopeners.cablecrm.com"
  },


];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: 
        _showSearch == false ?
        null :
        IconButton(
          onPressed: (){
            setState(() {
              _showSearch = !_showSearch;
            });
          }, 
          icon: Icon(Icons.arrow_back_outlined),
          style: IconButton.styleFrom(),
        ),
        titleSpacing: 0,
        title: 
        _showSearch == false ?
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(widget.title.toUpperCase()),    
        )
        :
        Container(
          padding: EdgeInsets.only(right: 5),
          child: TextField(
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.bodyMedium,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
            autofocus: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search Location & Select'.toLowerCase(),
              hintStyle: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                letterSpacing: 1.8,
                fontWeight: FontWeight.w300
              ),
            ),
          ),
        ),
        
        
        actions: [
           _showSearch == false ?
          IconButton(
            tooltip: 'Search',
            onPressed: (){
              setState(() {
                _showSearch = !_showSearch;
              });
            }, 
            icon: Icon(Icons.search_outlined), 
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(),
              // backgroundColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              foregroundColor: Theme.of(context).colorScheme.primary,
              minimumSize: Size(54, 54),
              fixedSize: Size(54, 54),
            ),
          ) : Container() 
        ],
      ),
      body: ListView(
          children: [
        
            Padding(
            padding: EdgeInsets.all(15),
            child: ListView.separated(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: locationList == null ? 0 : locationList.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 5);
              },
              itemBuilder: (BuildContext context, int index) {
                Map item = locationList[index];
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1, color: Theme.of(context).dividerColor),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ListTile(
                      
                      dense: true,
                      title: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text('${item["location"]}',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5
                      ),
                      ),
                      ),
                      
                      subtitle: Text('${item["url"]}',
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelMedium,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2
                      ),
                      ),
                      trailing: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) =>
                                FadeTransition(
                                opacity: animation,
                                child: Dashboard(title: 'Dashboard')
                              ),
                            ),
                          );
                        }, 
                        child: Text('Select'),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          surfaceTintColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                );
              }
            ),
            ),
        
          ],
      ),
    );
  }
}
