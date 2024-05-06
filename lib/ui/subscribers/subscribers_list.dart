import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/ui/common_widgets/headToolbar.dart';
import 'package:xceednet/ui/common_widgets/menuDrawer.dart';
import 'package:xceednet/ui/subscribers/subscriber_list_item.dart';
import 'package:xceednet/ui/subscribers/subscribers_add.dart';
import 'package:xceednet/view_model/subscriber_view_model.dart';

import '../../utils/FsListWithSearchWidget.dart';
import 'helper_multiple_selection_bottomsheet.dart';

class SubscribersList extends StatefulWidget {
  @override
  State<SubscribersList> createState() => _SubscribersListState();
}

class _SubscribersListState extends State<SubscribersList>
    implements PageLoadSearchListener {
  List subscribersList = [];
  late SubscriberViewModel subscriberViewModel;

  late FsListWithSearchState listListner;
  String searchText = "";
  int currentPage = 1;

  @override
  pullRefresh() {
    listListner.clearAllState();
    getSubscriberListApi();
  }

  @override
  void initState() {
    widget1 = FsListWithSearchWidget(
      pageLoadListner: this,
      title: false,
      message: null,
      itemBuilder: (BuildContext context, int index, var item) {
        return SubscriberListItem(item);
      },
      afterView: (FsListWithSearchState v) {
        listListner = v;
      },
      showError: false,
      // errorWidget: errorWidget(),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getSubscriberListApi();
    });
  }

  Future<void> getSubscriberListApi(
      {String next = "0", String cuPage = "1"}) async {
    var string = subscriberViewModel.columnsData
        ?.indexWhere((element) => element.containsKey("subscribers.status"))!
        .toString();

    bool status = await subscriberViewModel.getSubscriberListData(
        search: searchText,
        nextIndex: next,
        filter: selectedFilter,
        columIndex: string);
    if (status) {
      currentPage = int.parse(cuPage);
      subscribersList = [];
      if (subscriberViewModel.subscriberData!.length == 0) {
        listListner.addListList({
          "current_page": currentPage,
          "last_page": currentPage,
        }, subscribersList);
        setState(() {});
      } else {
        subscribersList.addAll(subscriberViewModel.subscriberData!);
        var ceil =
            (subscriberViewModel.apiCompleteResult!['recordsFiltered'] / 10)
                .ceil();
        listListner.addListList({
          "current_page": currentPage,
          "last_page": ceil,
          "total_item_count":
              subscriberViewModel.apiCompleteResult!['recordsFiltered']
        }, subscribersList);
        setState(() {});
      }
      //subscribersList = subscriberViewModel.subscriberData!;
    }
  }

  Widget? widget1;
  List<String> selectedFilter = [];

  @override
  Widget build(BuildContext context) {
    subscriberViewModel = context.watch<SubscriberViewModel>();
    return Scaffold(
      bottomNavigationBar: subscriberViewModel.isLoading
          ? Container(
              color: Theme.of(context).colorScheme.surface,
              height: 50,
              padding: EdgeInsets.only(right: 10),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : null,
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text(
            "Subscribers List \ncount :${subscriberViewModel.incoiceCount}"),
        actions: subscriberViewModel.isLoading
            ? []
            : [
                IconButton(
                  onPressed: () async {
                    var a = await Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FadeTransition(
                                opacity: animation,
                                child: SubscribersAdd(title: 'Subscriber Add')),
                      ),
                    );
                    if (a != null) {
                      listListner.clearAllState();
                      getSubscriberListApi();
                    }
                  },
                  icon: Icon(Icons.add),
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    // backgroundColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: Size(54, 54),
                    fixedSize: Size(54, 54),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    showModalBottomSheet(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        var list = subscriberViewModel.columnsData
                            ?.where(
                              (element) =>
                                  element.containsKey('subscribers.status'),
                            )
                            .toList();
                        var helperDataList = list![0]['subscribers.status']
                            ['select_options'] as List;
                        print(helperDataList);
                        print(selectedFilter);
                        if (selectedFilter.length == 0) {
                          helperDataList.forEach((element) {
                            selectedFilter.add(element[1]);
                          });
                        }

                        return HelperMultipleSelectionBottomSheet(
                            helperDataList, selectedFilter, (selectedFilter1) {
                          selectedFilter = selectedFilter1;
                          listListner.clearAllState();
                          getSubscriberListApi();
                        });
                      },
                    );
                    // listListner.clearAllState();
                    // getSubscriberListApi();
                  },
                  icon: Icon(Icons.filter_alt),
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    // backgroundColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    minimumSize: Size(54, 54),
                    fixedSize: Size(54, 54),
                  ),
                ),
              ],
      ),
      body: Column(
        children: [
          HeadToolbar(onChange: (value) {
            setState(() {
              searchText = value;
              listListner.clearAllState();
              getSubscriberListApi(next: "0");
            });
          }),
          true
              ? Flexible(child: widget1!)
              : ListView.separated(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      subscribersList == null ? 0 : subscribersList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 5);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    Map item = subscribersList[index];
                    return SubscriberListItem(item);
                  }),
        ],
      ),
    );
  }

  @override
  lastPage(int page) {}

  @override
  loadNextPage(String page) {
    print("$page");
    int total = int.parse(page) * 10;
    int cal = total - 10;
    getSubscriberListApi(next: "$cal", cuPage: page);
  }
}
