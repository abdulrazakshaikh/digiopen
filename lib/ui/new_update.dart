import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewUpdateScreen extends StatefulWidget{
  @override
  State<NewUpdateScreen> createState() {
   return NewUpdateScreenState();
  }

}
class NewUpdateScreenState extends State<NewUpdateScreen>{
  @override
  Widget build(BuildContext context) {
    var loadRequest = WebViewController();
    loadRequest.loadRequest(Uri.parse('https://www.xceednet.com/'));
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("New Updated"),
        actions: [],
      ),
      body: Container(
          child: WebViewWidget(
        controller: loadRequest,
      )),
    );
  }

}