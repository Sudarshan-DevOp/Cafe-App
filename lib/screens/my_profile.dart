import 'package:flutter/material.dart';
import 'package:stitch_crave_cafe/theme/app_theme.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeader()),
          SliverToBoxAdapter(child: _buildProfileHeader()),
          SliverToBoxAdapter(child: _buildRecentOrders()),
          SliverToBoxAdapter(child: _buildFavorites()),
          SliverToBoxAdapter(child: _buildSavedAddresses()),
          SliverToBoxAdapter(child: _buildDetails()),
          SliverToBoxAdapter(child: _buildFooter()),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'The Hearth',
            style: TextStyle(
              fontFamily: 'Noto Serif',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.surfaceContainerHighest,
            child: Icon(Icons.person, color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surfaceContainerHighest,
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.person,
                        size: 60,
                        color: AppColors.primary,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.surfaceContainerHighest,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 16,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sarah Jenkins',
                  style: TextStyle(
                    fontFamily: 'Noto Serif',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const Text('Coffee Enthusiast & Gold Member'),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryContainer,
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, size: 14, color: AppColors.tertiary),
                      SizedBox(width: 4),
                      Text(
                        '1,240 Points',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentOrders() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Orders',
                  style: TextStyle(
                    fontFamily: 'Noto Serif',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.tertiary,
                  ),
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildOrderItem(
              'Artisan Latte & Croissant',
              'Oct 24, 2024',
              '\$12.50',
            ),
            const SizedBox(height: 12),
            _buildOrderItem(
              'Single Origin Pour Over',
              'Oct 20, 2024',
              '\$6.00',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String title, String date, String price) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.surfaceContainerHighest,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/ethiopian_coffee.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Text(date, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.tertiary,
                ),
                child: const Text('Reorder', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFavorites() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Favorites',
            style: TextStyle(
              fontFamily: 'Noto Serif',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _FavoriteItem(title: 'Cold Brew Reserve', tag: 'Smooth'),
                SizedBox(width: 12),
                _FavoriteItem(title: 'Ceremonial Matcha', tag: 'Earthy'),
                SizedBox(width: 12),
                _FavoriteItem(title: 'Almond Croissant', tag: 'Buttery'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedAddresses() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Saved Addresses',
                  style: TextStyle(
                    fontFamily: 'Noto Serif',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: AppColors.tertiary),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.home, color: AppColors.tertiary, size: 20),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Home',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '123 Willow Lane, Apt 4B',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Portland, OR 97204',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.work,
                    color: AppColors.onSecondaryContainer,
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Office',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '450 NW Tech Blvd',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Portland, OR 97209',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Details',
              style: TextStyle(
                fontFamily: 'Noto Serif',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 12),
            _detailRow('Email', 'sarah.jenkins@example.com'),
            const SizedBox(height: 8),
            _detailRow('Phone', '(555) 123-4567'),
            const SizedBox(height: 8),
            _detailRow('Birthday', 'October 12'),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.onSecondaryContainer,
          ),
        ),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.all(24),
      color: AppColors.primary,
      child: Column(
        children: [
          const Text(
            'The Hearth',
            style: TextStyle(
              fontFamily: 'Noto Serif',
              fontSize: 20,
              color: AppColors.surface,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '© 2024 The Hearth Cafe.',
            style: TextStyle(color: AppColors.surface, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _FavoriteItem extends StatelessWidget {
  final String title;
  final String tag;

  const _FavoriteItem({required this.title, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                title == 'Almond Croissant'
                    ? 'assets/images/our_story.png'
                    : 'assets/images/ethiopian_coffee.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.secondaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(tag, style: const TextStyle(fontSize: 10)),
          ),
        ],
      ),
    );
  }
}