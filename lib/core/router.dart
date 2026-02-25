import 'package:flutter/material.dart';
import '../features/products/view/product_feed_screen.dart';
import '../features/browser/browser_screen.dart';
import '../features/history/history_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const ProductFeedScreen(),
        );
      case '/browser':
        final url = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BrowserScreen(url: url),
        );
      case '/history':
        return MaterialPageRoute(
          builder: (_) => const HistoryScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}