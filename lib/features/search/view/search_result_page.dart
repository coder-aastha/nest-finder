import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/search_result_view_model.dart';

class SearchResultPage extends StatelessWidget {
  final String minPrice;
  final String maxPrice;
  final String location;

  const SearchResultPage({
    super.key,
    required this.minPrice,
    required this.maxPrice,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchResultViewModel()..fetchFilteredResults(minPrice, maxPrice, location),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search Results"),
        ),
        body: Consumer<SearchResultViewModel>(
          builder: (context, viewModel, _) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.error != null) {
              return Center(child: Text('Error: ${viewModel.error}'));
            }

            if (viewModel.results.isEmpty) {
              return const Center(child: Text('No results found.'));
            }

            return ListView.builder(
              itemCount: viewModel.results.length,
              itemBuilder: (context, index) {
                final result = viewModel.results[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.home, size: 32),
                    title: Text(result['name'] ?? 'No name'),
                    subtitle: Text('Price: \$${result['price']} | Location: ${result['location']}'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
