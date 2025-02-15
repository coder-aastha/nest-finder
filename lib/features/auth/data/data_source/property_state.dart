// lib/features/home/data/providers/property_state.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nest_finder/features/property/presentation/view/property_listing_page_view.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class PropertyState extends ChangeNotifier {
  final List<Property> _wishlist = [];
  final List<Property> _createdListings = [];

  List<Property> get wishlist => _wishlist;
  List<Property> get createdListings => _createdListings;

  void addToWishlist(Property property) {
    if (!_wishlist.contains(property)) {
      property.isInWishlist = true;
      _wishlist.add(property);
      notifyListeners();
    }
  }

  void removeFromWishlist(Property property) {
    property.isInWishlist = false;
    _wishlist.remove(property);
    notifyListeners();
  }

  void addToCreatedListings(Property property) {
    if (!_createdListings.contains(property)) {
      property.isInCreatedListings = true;
      _createdListings.add(property);
      notifyListeners();
    }
  }

  void removeFromCreatedListings(Property property) {
    property.isInCreatedListings = false;
    _createdListings.remove(property);
    notifyListeners();
  }
}



class ProfilePageView extends StatefulWidget {
  const ProfilePageView({super.key});

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  final String _profileImageUrl = 'assets/images/default_avatar.jpg';
  File? _profileImageFile;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PropertyState>(
      builder: (context, propertyState, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue.shade700,
                          Colors.blue.shade500,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildProfileSection(),
                      const SizedBox(height: 24),
                      _buildStatsSection(propertyState),
                      const SizedBox(height: 24),
                      _buildCreatedListingsSection(propertyState),
                      const SizedBox(height: 24),
                      _buildWishlistSection(propertyState),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfileSection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                spreadRadius: 8,
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 65),
              const Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Real Estate Enthusiast',
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton.icon(
                onPressed: _pickImage,
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 20,
                  color: Colors.blue.shade700,
                ),
                label: Text(
                  'Update Photo',
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  backgroundColor: Colors.blue.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 56,
              backgroundImage: _profileImageFile != null
                  ? FileImage(_profileImageFile!) as ImageProvider
                  : AssetImage(_profileImageUrl),
              backgroundColor: Colors.grey.shade100,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsSection(PropertyState propertyState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatCard('Listings', propertyState.createdListings.length.toString()),
        _buildStatCard('Wishlist', propertyState.wishlist.length.toString()),
        _buildStatCard('Views', '124'),
      ],
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreatedListingsSection(PropertyState propertyState) {
    return _buildSection(
      'Created Listings',
      propertyState.createdListings,
      (Property property) => _buildPropertyCard(
        property,
        onDelete: () => propertyState.removeFromCreatedListings(property),
        actionIcon: Icons.delete_outline,
      ),
    );
  }

  Widget _buildWishlistSection(PropertyState propertyState) {
    return _buildSection(
      'Wishlist',
      propertyState.wishlist,
      (Property property) => _buildPropertyCard(
        property,
        onDelete: () => propertyState.removeFromWishlist(property),
        actionIcon: Icons.favorite,
        actionColor: Colors.red,
      ),
    );
  }

  Widget _buildSection(
    String title,
    List<Property> items,
    Widget Function(Property) itemBuilder,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        if (items.isEmpty)
          Center(
            child: Column(
              children: [
                Icon(
                  title == 'Wishlist' ? Icons.favorite_border : Icons.home_outlined,
                  size: 48,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: 8),
                Text(
                  'No ${title.toLowerCase()} yet',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) => itemBuilder(items[index]),
          ),
      ],
    );
  }

  Widget _buildPropertyCard(
    Property property, {
    required VoidCallback onDelete,
    required IconData actionIcon,
    Color actionColor = Colors.grey,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.home,
            color: Colors.blue.shade700,
            size: 30,
          ),
        ),
        title: Text(
          property.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              property.address,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            actionIcon,
            color: actionColor,
          ),
          onPressed: onDelete,
        ),
      ),
    );
  }
}