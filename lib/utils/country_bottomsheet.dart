import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/utils/AppUtils.dart';

class CountrySingleSelectionBottomSheet extends StatefulWidget {
  Map? selectedItem1;
  var takeSelectedItem;

  CountrySingleSelectionBottomSheet(this.selectedItem1, this.takeSelectedItem);

  @override
  _SubscriberSingleSelectionBottomSheetState createState() =>
      _SubscriberSingleSelectionBottomSheetState();
}

class _SubscriberSingleSelectionBottomSheetState
    extends State<CountrySingleSelectionBottomSheet>
    with TickerProviderStateMixin {
  List<dynamic> helperDataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedItem = widget.selectedItem1;
    helperDataList = AppUtils.countries;
    print("sdvsdvdsvdsvds");
  }

  Map? selectedItem;

  @override
  Widget build(BuildContext context) {
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
                          helperDataList = AppUtils.countries
                              .where((element) =>
                                  element['name'].toString().contains(value))
                              .toList();
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintText: 'Search for Country'.toLowerCase(),
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
                          'Select a Country',
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
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ListView.builder(
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          helperDataList == null ? 0 : helperDataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map item = helperDataList[index];
                        print("sdvdsvdsvsvdsvsdvs");
                        return ListTileTheme(
                          horizontalTitleGap: 0,
                          child: RadioListTile<Map>(
                            dense: true,
                            title: Text(
                              "${item['name']}",
                              style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w600),
                            ),
                            activeColor: Theme.of(context).colorScheme.primary,
                            // checkColor: Theme.of(context).colorScheme.onPrimary,
                            groupValue: selectedItem,
                            controlAffinity: ListTileControlAffinity.leading,
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
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                      foregroundColor: Theme.of(context).colorScheme.secondary,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                        AppUtils.appToast("Please select country");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
