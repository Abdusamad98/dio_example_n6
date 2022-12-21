import 'package:dio_example_n6/data/models/tranfer/data_model.dart';
import 'package:dio_example_n6/data/models/tranfer/transaction_model.dart';
import 'package:dio_example_n6/transactions_view_model.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SimpleUsage extends StatefulWidget {
  const SimpleUsage({Key? key}) : super(key: key);

  @override
  State<SimpleUsage> createState() => _SimpleUsageState();
}

class _SimpleUsageState extends State<SimpleUsage> {
  late WebViewController webViewController;

  @override
  void initState() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Transactions"),
        ),
        body: Consumer<TransactionsViewModel>(
          builder: (context, viewModel, child) {
            return viewModel.transactions.isEmpty
                ? Center(child: Text(viewModel.transactions.length.toString()))
                : ListView(
                    children:
                        List.generate(viewModel.transactions.length, (index) {
                      TransactionModel upperListItem =
                          viewModel.transactions[index];
                      return ListView(
                        shrinkWrap: true,
                        children: [
                          Text(
                            upperListItem.transferDate,
                            style: TextStyle(color: Colors.red, fontSize: 40),
                          ),
                          ...List.generate(upperListItem.data.length, (index) {
                            DataModel innerList = upperListItem.data[index];
                            return Padding(
                                padding: EdgeInsets.all(24),
                                child: Text(innerList.receiver.name));
                          })
                        ],
                      );
                    }),
                  );
          },
        ),
      ),
    );
  }
}
