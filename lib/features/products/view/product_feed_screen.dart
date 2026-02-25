import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/product_provider.dart';
import '../provider/preference_provider.dart';

class ProductFeedScreen extends ConsumerWidget {
  const ProductFeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
  IconButton(
    icon: const Icon(Icons.history),
    onPressed: () {
      Navigator.pushNamed(context, '/history');
    },
  ),
],
        title: const Text('Beespoke Store'),
        centerTitle: true,
      ),
      body: productsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('Error: $error')),
        data: (products) {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Card(
  margin: const EdgeInsets.all(12),
  child: ListTile(
    leading: Image.network(
      product.image,
      width: 50,
      height: 50,
    ),
    title: Text(product.title),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("\$${product.price}"),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.thumb_up,
                color: ref
                            .watch(preferenceProvider)[product.id] ==
                        true
                    ? Colors.green
                    : Colors.grey,
              ),
              onPressed: () {
                ref
                    .read(preferenceProvider.notifier)
                    .setPreference(product.id, true);
              },
            ),

            IconButton(
              icon: const Icon(Icons.open_in_browser),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/browser',
                  arguments: "https://example.com",
                );
              },
            ),

            IconButton(
              icon: Icon(
                Icons.thumb_down,
                color: ref
                            .watch(preferenceProvider)[product.id] ==
                        false
                    ? Colors.red
                    : Colors.grey,
              ),
              onPressed: () {
                ref
                    .read(preferenceProvider.notifier)
                    .setPreference(product.id, false);
              },
            ),
          ],
        ),
      ],
    ),
  ),
);
            },
          );
        },
      ),
    );
  }
}