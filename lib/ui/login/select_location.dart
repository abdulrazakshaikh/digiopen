import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/data/user_location_access.dart';
import 'package:xceednet/model/storage/shared_prefs.dart';
import 'package:xceednet/ui/dashboard.dart';

import '../../view_model/auth_view_model.dart';

class SelectLocation extends StatefulWidget {
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation>
    with TickerProviderStateMixin {
  bool _showSearch = false;

  List<UserLocationAccess> locationList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await authUserDataNotifier.getUserLocationAccess();
      if (authUserDataNotifier.userlocationAccess != null) {
        locationList = authUserDataNotifier.userlocationAccess;
      }
    });
  }

  late AuthViewModel authUserDataNotifier;

  @override
  Widget build(BuildContext context) {
    authUserDataNotifier = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(
        leading: _showSearch == false
            ? null
            : IconButton(
                onPressed: () {
                  if (locationList.length == 0) {
                    if (authUserDataNotifier.userlocationAccess != null) {
                      locationList = authUserDataNotifier.userlocationAccess;
                    }
                  }
                  setState(() {
                    _showSearch = !_showSearch;
                  });
                },
                icon: Icon(Icons.arrow_back_outlined),
                style: IconButton.styleFrom(),
              ),
        titleSpacing: 0,
        title: _showSearch == false
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Select Location'.toUpperCase()),
              )
            : Container(
                padding: EdgeInsets.only(right: 5),
                child: TextField(
                  onChanged: (value) {
                    if (authUserDataNotifier.userlocationAccess != null) {
                      locationList = authUserDataNotifier.userlocationAccess
                          .where((element) {
                        return (element.domain!.contains(value) ||
                            element.subdomain!.contains(value));
                      }).toList();
                      setState(() {});
                    }
                  },
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
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
        actions: [
          _showSearch == false
              ? IconButton(
                  tooltip: 'Search',
                  onPressed: () {
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
                )
              : Container()
        ],
      ),
      body: authUserDataNotifier.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : locationList.length == 0
              ? Center(
                  child: Text(
                    "No search result found ",
                    style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                )
              : ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: ListView.separated(
                          primary: false,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              locationList == null ? 0 : locationList.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 5);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            UserLocationAccess item = locationList[index];
                            return Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    width: 1,
                                    color: Theme.of(context).dividerColor),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: ListTile(
                                  dense: true,
                                  title: Padding(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      '${item.subdomain}',
                                      style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5),
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${item.subdomain}/${item.domain}',
                                    style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2),
                                  ),
                                  trailing: ElevatedButton(
                                    onPressed: () {
                                      SharedPrefs().selectedUserLocation=item;
                                      SharedPrefs().isLogin=true;
                                      Navigator.of(context).pushAndRemoveUntil(
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              FadeTransition(
                                                  opacity: animation,
                                                  child: Dashboard()),
                                        ),
                                        (Route<dynamic> route) => false,
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
                          }),
                    ),
                  ],
                ),
    );
  }
}
