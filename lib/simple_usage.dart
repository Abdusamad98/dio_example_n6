import 'package:dio_example_n6/album_view_model.dart';
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
          title: Text("Simple usage"),
        ),
        body: Consumer<AlbumViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.errorForUI.isNotEmpty) {
              return Center(
                child: Text(viewModel.errorForUI),
              );
            }

            return viewModel.album != null
                ? Column(
                    children: [
                      TextField(),
                      Text(viewModel.album!.title),
                      Text(viewModel.album!.id.toString()),
                      Text(viewModel.album!.userId.toString()),
                      SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: WebViewWidget(
                          controller: webViewController,
                        ),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      context.read<AlbumViewModel>().fetchAlbum(5);
                    },
                    child: Text("Get Data"),
                  );
          },
        ),
      ),
    );
  }
}
