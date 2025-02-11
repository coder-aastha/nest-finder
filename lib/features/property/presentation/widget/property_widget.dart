import 'package:flutter/material.dart';
import 'package:nest_finder/features/property/data/data_source/remote_datasource/property_remote_datasource.dart';
import 'package:nest_finder/features/property/domain/usecase/property_usecase.dart';
import 'package:nest_finder/features/property/presentation/view_model/property_view_model.dart';
import 'package:provider/provider.dart';

class PropertyListingPage extends StatelessWidget {
  const PropertyListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PropertyViewModel(
        getProperties: GetProperties(
            repository: PropertyRepositoryImpl(
          remoteDataSource: PropertyRemoteDataSource(client: http.Client()),
        )),
        addProperty: AddProperty(
            repository: PropertyRepositoryImpl(
          remoteDataSource: PropertyRemoteDataSource(client: http.Client()),
        )),
      ),
      child: _PropertyListingView(),
    );
  }
}

class _PropertyListingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PropertyViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Property Listings'),
      ),
      body: FutureBuilder(
        future: viewModel.loadProperties(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading properties'));
          } else {
            return ListView.builder(
              itemCount: viewModel.properties.length,
              itemBuilder: (context, index) {
                final property = viewModel.properties[index];
                return ListTile(
                  title: Text(property.title),
                  subtitle: Text(property.address),
                  trailing: Text('\$${property.price}'),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add property page
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
