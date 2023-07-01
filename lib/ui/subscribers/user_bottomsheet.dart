import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/utils/AppUtils.dart';
import 'package:xceednet/view_model/subscriber_view_model.dart';

import '../../view_model/auth_view_model.dart';

class UserSingleSelectionBottomSheet extends StatefulWidget {
  Map? selectedItem1;
  var takeSelectedItem;

  UserSingleSelectionBottomSheet(this.selectedItem1, this.takeSelectedItem);

  @override
  _UserSingleSelectionBottomSheetState createState() =>
      _UserSingleSelectionBottomSheetState();
}

class _UserSingleSelectionBottomSheetState
    extends State<UserSingleSelectionBottomSheet>
    with TickerProviderStateMixin {
  List<dynamic> helperDataList = [];
  late SubscriberViewModel helperViewModel;
  late AuthViewModel authViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedItem = widget.selectedItem1;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var a = await helperViewModel.getUserListData(
          search: "", nextIndex: "0", perPage: "100");
      setValues();
    });
  }

  Map? selectedItem;

  Future<void> setValues({String search = ""}) async {
    if (helperViewModel.userData != null) {
      helperDataList = helperViewModel.userData!;
      if (selectedItem != null)
        helperDataList.forEach((element) {
          if (selectedItem!['user_id'] == element['user_id']) {
            selectedItem = element;
          }
        });
      helperDataList = helperDataList.where((element) {
        if (search.isEmpty) {
          return true;
        } else {
          return element['name']!.toUpperCase().contains(search.toUpperCase());
        }
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    helperViewModel = context.watch<SubscriberViewModel>();
    authViewModel = context.watch<AuthViewModel>();
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              // color: Theme.of(context).colorScheme.surface,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            setValues();
                          } else {
                            setValues(search: value);
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintText: 'Search for User'.toLowerCase(),
                          hintStyle: GoogleFonts.lato(
                              textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                              letterSpacing: 1.8,
                              fontWeight: FontWeight.w300),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.outline),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1),
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Select an User',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: helperViewModel.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : helperDataList.length == 0
                    ? Center(
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                                "${helperViewModel.error == null || helperViewModel.error!.isEmpty ? "No search record found" : helperViewModel.error}")),
                      )
                    : ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: ListView.builder(
                                primary: false,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: helperDataList == null
                                    ? 0
                                    : helperDataList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Map item = helperDataList[index];
                                  return ListTileTheme(
                                    horizontalTitleGap: 0,
                                    child: RadioListTile<Map>(
                                      dense: true,
                                      title: Text(
                                        "${item['name']}",
                                        style: GoogleFonts.lato(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                      // checkColor: Theme.of(context).colorScheme.onPrimary,
                                      groupValue: selectedItem,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      value: item,
                                      onChanged: (Map? value) {
                                        setState(() {
                                          selectedItem = value;
                                        });
                                      },
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              border: Border(
                top:
                    BorderSide(width: 1, color: Theme.of(context).dividerColor),
              ),
            ),
            padding: EdgeInsets.all(15),
            child: authViewModel.isLoading
                ? CircularProgressIndicator()
                : Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: Theme.of(context).colorScheme.secondary),
                            foregroundColor:
                                Theme.of(context).colorScheme.secondary,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            alignment: Alignment.center,
                          ),
                          child: Text(
                            'Cancel',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (selectedItem != null) {
                              widget.takeSelectedItem(selectedItem);
                              Navigator.pop(context);
                            } else {
                              AppUtils.appToast("Please select user");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            foregroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            alignment: Alignment.center,
                          ),
                          child: Text('Apply'),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
