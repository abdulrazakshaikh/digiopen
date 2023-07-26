import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/ui/common_widgets/headToolbar.dart';
import 'package:xceednet/ui/common_widgets/menuDrawer.dart';
import 'package:xceednet/ui/payment/payment_add.dart';
import 'package:xceednet/ui/payment/payment_list_item.dart';
import 'package:xceednet/view_model/payment_view_model.dart';

import '../../utils/FsListWithSearchWidget.dart';
import '../subscribers/helper_multiple_selection_bottomsheet.dart';

class PaymentList extends StatefulWidget {
  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList>
    implements PageLoadSearchListener {
/*List subscribersList = [
  {
    "id": "101",
    "status" : "John Doe",

    "name" : "John Doe",
    "mobile" : "9876543210",

    "createdon" : "01 Sep, 2022",
    "assignedto" : "Johnson Doe",

    "ticket" : "-",

  },
  {
    "id": "102",
    "name" : "John Doe",
    "mobile" : "9876543210",
    "createdon" : "01 Sep, 2022",
    "assignedto" : "Johnson Doe",
    "ticket" : "-",
    "status" : "John Doe",
  },
  {
    "id": "103",
    "name" : "John Doe",
    "mobile" : "9876543210",
    "createdon" : "01 Sep, 2022",
    "assignedto" : "Johnson Doe",
    "ticket" : "-",
    "status" : "John Doe",
  },

];*/
  List<String> selectedFilter = [];

  List invoicesList = [];
  late PaymentViewModel paymentViewModel;

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
        return PaymentListItem(item);
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

  List<Map<String, dynamic>>? columnsData;

  Future<void> getSubscriberListApi({
    String next = "0",
    String cuPage = "1",
  }) async {
    var string = paymentViewModel.columnsData
        ?.indexWhere(
            (element) => element.containsKey("subscriber_payments.status"))!
        .toString();
    bool status = await paymentViewModel.getPaymentListData(
        search: searchText,
        nextIndex: next,
        filter: selectedFilter,
        columIndex: string);
    if (status) {
      currentPage = int.parse(cuPage);

      invoicesList = [];
      if (paymentViewModel.paymentListData!.length == 0) {
        listListner.addListList({
          "current_page": currentPage,
          "last_page": currentPage,
        }, invoicesList);
        setState(() {});
      } else {
        invoicesList.addAll(paymentViewModel.paymentListData!);
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
    paymentViewModel = context.watch<PaymentViewModel>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text("Payment \n count :${paymentViewModel.incoiceCount}"),
        actions: [
          true
              ? Container()
              : IconButton(
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      FadeTransition(
                                opacity: animation, child: PaymentAdd()),
                      ),
                    );
                  },
                  icon: Icon(Icons.add),
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(),
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
                  var list = paymentViewModel.columnsData
                      ?.where(
                        (element) =>
                            element.containsKey('subscriber_payments.status'),
                      )
                      .toList();
                  var helperDataList = list![0]['subscriber_payments.status']
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
          Flexible(child: widget1!),
        ],
      ),
    );
  }
}
