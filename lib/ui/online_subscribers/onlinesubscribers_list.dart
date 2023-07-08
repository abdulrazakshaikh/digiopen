import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/ui/common_widgets/headToolbar.dart';
import 'package:xceednet/ui/common_widgets/menuDrawer.dart';
import 'package:xceednet/ui/online_subscribers/online_subscriber_list_item.dart';
import 'package:xceednet/ui/subscribers/subscriber_list_item.dart';
import 'package:xceednet/ui/subscribers/subscribers_add.dart';
import 'package:xceednet/view_model/subscriber_view_model.dart';

import '../../utils/FsListWithSearchWidget.dart';

class OnlineSubscribersList extends StatefulWidget {
  @override
  State<OnlineSubscribersList> createState() => _OnlineSubscribersListState();
}

class _OnlineSubscribersListState extends State<OnlineSubscribersList>
    implements PageLoadSearchListener {
  List subscribersList = [];
  late SubscriberViewModel subscriberViewModel;

  late FsListWithSearchState listListner;
  String searchText = "";
  int currentPage = 1;

  @override
  void initState() {
    widget1 = FsListWithSearchWidget(
      pageLoadListner: this,
      title: false,
      message: null,
      itemBuilder: (BuildContext context, int index, var item) {
        return OnlineSubscriberListItem(item);
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

  @override
  pullRefresh() {
    listListner.clearAllState();
    getSubscriberListApi();
  }

  Future<void> getSubscriberListApi(
      {String next = "0", String cuPage = "1"}) async {
    bool status = await subscriberViewModel.getOnlineSubscriberListData(
        search: searchText, nextIndex: next);
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
        listListner.addListList({
          "current_page": currentPage,
          "last_page": 1000,
        }, subscribersList);
        setState(() {});
      }
      //subscribersList = subscriberViewModel.subscriberData!;
    }
  }

  Widget? widget1;

  @override
  Widget build(BuildContext context) {
    subscriberViewModel = context.watch<SubscriberViewModel>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text(
            "Online Subscribers\n count :${subscriberViewModel.incoiceCount}"),
        actions: [
          true
              ? Container()
              : subscriberViewModel.isLoading
                  ? Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) =>
                            FadeTransition(
                                opacity: animation,
                                child: SubscribersAdd(title: 'Subscriber Add')),
                      ),
                    );
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
    int total = int.parse(page) * 10;
    int cal = total - 10;
    getSubscriberListApi(next: "$cal", cuPage: page);
  }
}
