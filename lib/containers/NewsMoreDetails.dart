import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsMoreDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter WebView Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/widget': (_) => new WebviewScaffold(
          url: 'google.com',
          appBar: new AppBar(
            title: const Text('Widget webview'),
          ),
          withZoom: true,
          withLocalStorage: true,
        )
      },
    );
  }
}


