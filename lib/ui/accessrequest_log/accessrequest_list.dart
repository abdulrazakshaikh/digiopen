import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/ui/accessrequest_log/access_request_list_item.dart';
import 'package:xceednet/ui/common_widgets/headToolbar.dart';
import 'package:xceednet/ui/common_widgets/menuDrawer.dart';
import 'package:xceednet/utils/AppUtils.dart';
import 'package:xceednet/view_model/access_request_view_model.dart';

import '../../utils/FsListWithSearchWidget.dart';

class AccessRequestList extends StatefulWidget {
  String? subscriber_id = null;
  String? name = null;

  AccessRequestList({this.subscriber_id, this.name});

  @override
  State<AccessRequestList> createState() => _AccessRequestListState();
}

class _AccessRequestListState extends State<AccessRequestList>
    implements PageLoadSearchListener {
  List invoicesList = [];
  late AccessRequestViewModel accessRequestViewModel;

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
        return AccessRequestListItem(item);
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
    bool status = await accessRequestViewModel.getAccessRequestListData(
        search: searchText,
        nextIndex: next,
        subscriber_id: widget.subscriber_id ?? "0");
    if (status) {
      currentPage = int.parse(cuPage);
      invoicesList = [];
      if (accessRequestViewModel.accessRequestListData!.length == 0) {
        listListner.addListList({
          "current_page": currentPage,
          "last_page": currentPage,
        }, invoicesList);
        setState(() {});
      } else {
        invoicesList.addAll(accessRequestViewModel.accessRequestListData!);
        listListner.addListList({
          "current_page": currentPage,
          "last_page": 1000,
        }, invoicesList);
        setState(() {});
      }
      //subscribersList = subscriberViewModel.subscriberData!;
    }
  }

  Widget? widget1;

  @override
  lastPage(int page) {}

  @override
  loadNextPage(String page) {
    int total = int.parse(page) * 10;
    int cal = total - 10;
    getSubscriberListApi(next: "$cal", cuPage: page);
  }

  @override
  Widget build(BuildContext context) {
    accessRequestViewModel = context.watch<AccessRequestViewModel>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: widget.name == null ? MenuDrawer() : null,
      appBar: AppBar(
        title: Text(
            "Access Request Log ${widget.name == null ? "" : "\nfor ${widget.name}"} "),
        actions: [
          IconButton(
            onPressed: () async {
              bool a = await accessRequestViewModel
                  .getDeleteAllAccessRequestListData(
                      subscriber_id: widget.subscriber_id ?? "0");
              if (a) {
                listListner.clearAllState();
                getSubscriberListApi();
                AppUtils.appToast("Deleted Successfully");
              } else {
                AppUtils.appToast("Failed Delete");
              }
            },
            tooltip: 'Delete All Access Request Log',
            icon: Icon(Icons.delete_forever_outlined),
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(),
              // backgroundColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              foregroundColor: Colors.red,
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
          Flexible(child: widget1!),
        ],
      ),
    );
  }

  @override
  pullRefresh() {}
}
