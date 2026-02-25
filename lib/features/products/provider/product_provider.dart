import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../services/api_service.dart';
import '../model/product_model.dart';

final productProvider = FutureProvider<List<Product>>((ref) async {
  final api = ApiService();
  return api.fetchProducts();
});