import 'package:xceednet/common_widgets/menuDrawer.dart';
import 'package:xceednet/profile/changepassword_bottomsheet.dart';
import 'package:xceednet/profile/confirmation.dart';
import 'package:xceednet/profile/editaddress_bottomsheet.dart';
import 'package:xceednet/profile/editemail_bottomsheet.dart';
import 'package:xceednet/profile/editphone_bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        elevation: 0,        
        // scrolledUnderElevation: 0,        
        title: Text(widget.title.toUpperCase()),
        actions: [],
      ),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Stack(children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/default.jpg'),
                      radius: 60,
                    ),
                    Positioned(
                      right: 4, bottom: 4,
                      child: IconButton(
                        onPressed: (){}, 
                        icon: Icon(Icons.edit_outlined, size: 20),
                        style: IconButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      
                    )
                  ]),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text('Augustus Harrell',
                      style: GoogleFonts.robotoCondensed(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w500
                      ),
                      
                    ),
                  ),
                ],
              ),
            ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  borderOnForeground: true,                 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)
                  ),                 
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  surfaceTintColor: Theme.of(context).colorScheme.surfaceVariant,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Text('Phone Number'.toUpperCase(), textAlign: TextAlign.left,
                              style: GoogleFonts.robotoCondensed(
                                textStyle: Theme.of(context).textTheme.labelMedium,
                                letterSpacing: 1.75,
                                fontWeight: FontWeight.w400,
                              ),
                              ),
                            ),
                            ListTile(
                              horizontalTitleGap: 0,
                              leading: Icon(Icons.phone_android_outlined),
                              title: Text('9876543210',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                          
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 48, 
                        height: 48,
                        child: IconButton(
                          onPressed: (){
                            showModalBottomSheet(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              context: context, builder: (BuildContext context) { 
                                return EditPhoneBottomSheet();
                              }, 
                            );
                          }, 
                          icon: Icon(Icons.edit_outlined),
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                        ),
                      )

                    ],
                  )
                ),

                Card(
                  borderOnForeground: true,                 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)
                  ),                 
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  surfaceTintColor: Theme.of(context).colorScheme.surfaceVariant,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Text('Email Address'.toUpperCase(), textAlign: TextAlign.left,
                              style: GoogleFonts.robotoCondensed(
                                textStyle: Theme.of(context).textTheme.labelMedium,
                                letterSpacing: 1.75,
                                fontWeight: FontWeight.w400,
                              ),
                              ),
                            ),
                            ListTile(
                              horizontalTitleGap: 0,
                              leading: Icon(Icons.alternate_email_outlined),
                              title: Text('augustusharrell05454@gmail.com', overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                          
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 48, 
                        height: 48,
                        child: IconButton(
                          onPressed: (){
                            showModalBottomSheet(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              context: context, builder: (BuildContext context) { 
                                return EditEmailBottomSheet();
                              }, 
                            );
                          }, 
                          icon: Icon(Icons.edit_outlined),
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                        ),
                      )

                    ],
                  )
                ),

                Card(
                  borderOnForeground: true,                 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)
                  ),                 
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  surfaceTintColor: Theme.of(context).colorScheme.surfaceVariant,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Text('Postal Address'.toUpperCase(), textAlign: TextAlign.left,
                              style: GoogleFonts.robotoCondensed(
                                textStyle: Theme.of(context).textTheme.labelMedium,
                                letterSpacing: 1.75,
                                fontWeight: FontWeight.w400,
                              ),
                              ),
                            ),
                            ListTile(
                              horizontalTitleGap: 0,
                              leading: Icon(Icons.map_outlined),
                              title: Text('Shop No. 102, lorem ipsum tower, ipsum dolor street, sit amet Navi Mumbai India - 400704 ',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            SizedBox(height: 5)
                          ],
                        ),
                      ),
                      Container(
                        width: 48, 
                        height: 48,
                        child: IconButton(
                          onPressed: (){
                            showModalBottomSheet(
                              elevation: 2,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              context: context, builder: (BuildContext context) { 
                                return EditAddressBottomSheet();
                              }, 
                            );
                          }, 
                          icon: Icon(Icons.edit_outlined),
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                        ),
                      )
                    ],
                  )
                ),


                Card(
                  borderOnForeground: true,                 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)
                  ),                 
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  surfaceTintColor: Theme.of(context).colorScheme.surfaceVariant,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Text('Change Password'.toUpperCase(), textAlign: TextAlign.left,
                              style: GoogleFonts.robotoCondensed(
                                textStyle: Theme.of(context).textTheme.labelMedium,
                                letterSpacing: 1.75,
                                fontWeight: FontWeight.w400,
                              ),
                              ),
                            ),
                            ListTile(
                              horizontalTitleGap: 0,
                              leading: Icon(Icons.password),
                              title: Text('********************',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 48, 
                        height: 48,
                        child: IconButton(
                          onPressed: (){
                            showModalBottomSheet(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              context: context, builder: (BuildContext context) { 
                                return ChangePasswordBottomSheet();
                              }, 
                            );
                          }, 
                          icon: Icon(Icons.edit_outlined),
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                        ),
                      )
                    ],
                  )
                ),

                Card(
                  borderOnForeground: true,                 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),                 
                  elevation: 0,
                  clipBehavior: Clip.antiAlias,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  surfaceTintColor: Theme.of(context).colorScheme.surfaceVariant,
                  child: ListTile(
                    horizontalTitleGap: 0,
                    minVerticalPadding: 15,
                    leading: Icon(Icons.logout_outlined),
                    trailing: Icon(Icons.chevron_right_outlined),
                    title: Text('Logout',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onTap: (){
                      confirmationAlertDialog(context);
                    },
                  ),
                ),

                
                

              ],
            ),
          ),
          

        ],
      )
    );
  }
}
