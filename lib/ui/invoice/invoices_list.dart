import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xceednet/ui/common_widgets/headToolbar.dart';
import 'package:xceednet/ui/common_widgets/menuDrawer.dart';
import 'package:xceednet/ui/invoice/invoice_add.dart';
import 'package:xceednet/view_model/invoice_view_model.dart';

import '../../utils/FsListWithSearchWidget.dart';
import 'invoice_list_item.dart';

class InvoicesList extends StatefulWidget {
  @override
  State<InvoicesList> createState() => _InvoicesListState();
}

class _InvoicesListState extends State<InvoicesList>
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
  List invoicesList = [];
  late InvoiceViewModel invoiceViewModel;

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
        return InvoiceListItem(item);
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
    bool status = await invoiceViewModel.getInvoiceListData(
        search: searchText, nextIndex: next);
    if (status) {
      currentPage = int.parse(cuPage);
      invoicesList = [];
      if (invoiceViewModel.invoiceListData!.length == 0) {
        listListner.addListList({
          "current_page": currentPage,
          "last_page": currentPage,
        }, invoicesList);
        setState(() {});
      } else {
        invoicesList.addAll(invoiceViewModel.invoiceListData!);
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
    invoiceViewModel = context.watch<InvoiceViewModel>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MenuDrawer(),
      appBar: AppBar(
        title: Text("Invoices \n count :${invoiceViewModel.incoiceCount}"),
        actions: [
          true
              ? Container()
              : IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FadeTransition(
                                opacity: animation, child: InvoiceAdd()),
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
                  itemCount: invoicesList == null ? 0 : invoicesList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 5);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    Map item = invoicesList[index];
                    return InvoiceListItem(item);
                  }),
        ],
      ),
    );
  }

  @override
  pullRefresh() {
    listListner.clearAllState();
    getSubscriberListApi();
  }
}
