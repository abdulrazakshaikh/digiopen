import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xceednet/ui/common_widgets/filter_bottomsheet.dart';
import 'package:xceednet/ui/dashboard.dart';
import 'package:xceednet/main.dart';
import 'package:xceednet/ui/profile/profile.dart';

class HeadToolbar extends StatefulWidget {
  @override
  State<HeadToolbar> createState() => _HeadToolbarState();
}

class _HeadToolbarState extends State<HeadToolbar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border(
          top: BorderSide(width: 1, color: Theme.of(context).dividerColor),
          bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor),
        ),
      ),
      
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: TextField(
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: 'Search'.toLowerCase(),
                  hintStyle: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    letterSpacing: 1.8,
                    fontWeight: FontWeight.w300
                  ),
                  prefixIcon: Icon(Icons.search_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              border: Border.all(width: 1, color: Theme.of(context).colorScheme.outline),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
                topLeft: Radius.circular(0),
                bottomLeft: Radius.circular(0),
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.tune_outlined),
              tooltip: 'Filter',
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                    topLeft: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                  ),
                )
              ),
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
                    return FilterBottomSheet();
                  }, 
                );
              }, 
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              border: Border.all(width: 1, color: Theme.of(context).colorScheme.outline),
              borderRadius: BorderRadius.circular(4)
            ),
            child: PopupMenuButton<String>(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
              ),
              icon: Icon(Icons.shortcut_outlined),
              // onSelected: choiceAction,
              color: Theme.of(context).colorScheme.surface,
              position: PopupMenuPosition.under,
              tooltip: 'Export',
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
    );
  }
}


class Constants {
  static const String FirstItem = 'PDF';
  static const String SecondItem = 'Excel';
  static const String ThirdItem = 'Email';
  static const String FourthItem = 'Print';
  static const List<String> choices = <String>[FirstItem, SecondItem, ThirdItem, FourthItem];
}

