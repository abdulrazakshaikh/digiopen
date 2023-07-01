import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/AppUtils.dart';

class HelperMultipleSelectionBottomSheet extends StatefulWidget {
  List<String> selectedItem;
  var takeSelectedItem;
  List<dynamic> helperDataList = [];

  HelperMultipleSelectionBottomSheet(
      this.helperDataList, this.selectedItem, this.takeSelectedItem);

  @override
  _HelperMultipleSelectionBottomSheetState createState() =>
      _HelperMultipleSelectionBottomSheetState();
}

class _HelperMultipleSelectionBottomSheetState
    extends State<HelperMultipleSelectionBottomSheet>
    with TickerProviderStateMixin {
  //bool _value = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                      true
                          ? Container()
                          : TextField(
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.bodyMedium,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                              onChanged: (value) {
                                /*if (value.isEmpty) {
                            setValues();
                          } else {
                            setValues(search: value);
                          }*/
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                hintText: 'Search for subscriber'.toLowerCase(),
                                hintStyle: GoogleFonts.lato(
                                    textStyle:
                                        Theme.of(context).textTheme.labelMedium,
                                    letterSpacing: 1.8,
                                    fontWeight: FontWeight.w300),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .outline),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1),
                                ),
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Select status',
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
                      itemCount: widget.helperDataList == null
                          ? 0
                          : widget.helperDataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        List item = widget.helperDataList[index];
                        return ListTileTheme(
                          horizontalTitleGap: 0,
                          child: CheckboxListTile(
                            title: Text(
                              item[0]!,
                              style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w600),
                            ),
                            activeColor: Theme.of(context).colorScheme.primary,
                            checkColor: Theme.of(context).colorScheme.onPrimary,
                            selected: widget.selectedItem.contains(item[1]),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: widget.selectedItem.contains(item[1]),
                            onChanged: (value) {
                              setState(() {
                                if (value!) {
                                  widget.selectedItem.add(item[1]);
                                } else {
                                  widget.selectedItem.removeWhere(
                                      (element) => element == item[1]);
                                }
                                //item.isSelected = value!;
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
                      /*var selectedItem = helperDataList.where((element) {
                              return element.isSelected;
                            }).toList();*/
                      if (widget.selectedItem.length == 0) {
                        AppUtils.appToast("Please select at least one option");
                        return;
                      } else {
                        if (widget.selectedItem.length ==
                            widget.helperDataList.length) {
                          widget.takeSelectedItem([]);
                        } else {
                          widget.takeSelectedItem(widget.selectedItem);
                        }
                      }
                      Navigator.pop(context);
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
