import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:hive/hive.dart';

class BrowserScreen extends StatefulWidget {
  final String url;

  const BrowserScreen({super.key, required this.url});

  @override
  State<BrowserScreen> createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            final box = Hive.box('history');
            final List<String> history =
                List<String>.from(box.get('urls', defaultValue: []));

            if (history.isEmpty || history.last != url) {
              history.add(url);
              box.put('urls', history);
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Browser')),
      body: WebViewWidget(controller: _controller),
    );
  }
}