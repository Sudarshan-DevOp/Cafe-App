import 'package:flutter/material.dart';
import 'package:stitch_crave_cafe/theme/app_theme.dart';

class MenuShowcasePage extends StatelessWidget {
  const MenuShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeader()),
          SliverToBoxAdapter(child: _buildSearchBar()),
          SliverToBoxAdapter(child: _buildPizzaSection()),
          SliverToBoxAdapter(child: _buildCoffeeSection()),
          SliverToBoxAdapter(child: _buildMaggieSection()),
          SliverToBoxAdapter(child: _buildFooter()),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.menu, size: 28),
              color: AppColors.primary,
              onPressed: () {},
            ),
            const Text(
              'The Hearth',
              style: TextStyle(
                fontFamily: 'Noto Serif',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.surfaceContainerHighest,
              child: Icon(Icons.person, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for a craving...',
          prefixIcon: Icon(Icons.search, color: AppColors.primary),
        ),
      ),
    );
  }

  Widget _buildPizzaSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Wood-Fired Pizza',
              style: TextStyle(
                fontFamily: 'Noto Serif',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 600;
              return Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                children: [
                  Expanded(
                    flex: isMobile ? 0 : 2,
                    child: _buildFeaturedPizza(),
                  ),
                  SizedBox(width: isMobile ? 0 : 16, height: isMobile ? 16 : 0),
                  Expanded(
                    flex: isMobile ? 0 : 1,
                    child: Column(
                      children: [
                        _buildSmallPizzaItem('Truffle Mushroom', '\$22.00'),
                        const SizedBox(height: 12),
                        _buildSmallPizzaItem('Hot Honey Pepperoni', '\$20.00'),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedPizza() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              color: AppColors.surfaceContainerHighest,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              child: Image.asset(
                'assets/images/featured_pizza.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.local_pizza, size: 60));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryContainer,
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: const Text(
                    'Bestseller',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Classic Margherita',
                  style: TextStyle(
                    fontFamily: 'Noto Serif',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'San Marzano tomato sauce, fresh mozzarella di bufala, basil.',
                  style: TextStyle(color: AppColors.onSecondaryContainer, fontSize: 13),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '\$18.00',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add_shopping_cart, size: 18),
                      label: const Text('Add'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.tertiary,
                        foregroundColor: AppColors.onTertiary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallPizzaItem(String title, String price) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.surfaceContainerHighest,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/featured_pizza.png',
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
                Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            color: AppColors.tertiary,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCoffeeSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'The Roastery',
              style: TextStyle(
                fontFamily: 'Noto Serif',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _CoffeeItem(title: 'Pour Over', subtitle: 'Single Origin Ethiopia', price: '\$5.50'),
                SizedBox(width: 12),
                _CoffeeItem(title: 'Oat Flat White', subtitle: 'Velvety micro-foam', price: '\$4.75'),
                SizedBox(width: 12),
                _CoffeeItem(title: 'Hearth Cold Brew', subtitle: 'Steeped 24 hours', price: '\$5.00'),
                SizedBox(width: 12),
                _CoffeeItem(title: 'Signature Espresso', subtitle: 'Notes of chocolate', price: '\$3.50'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMaggieSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Comfort Bowls (Maggie)',
              style: TextStyle(
                fontFamily: 'Noto Serif',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: const [
              _MaggieItem(title: 'Classic Masala', description: 'The nostalgia recipe', price: '\$6.00'),
              _MaggieItem(title: 'Cheese & Corn', description: 'Creamy cheddar', price: '\$7.50'),
              _MaggieItem(title: 'Spicy Chili Garlic', description: 'Fiery chili oil', price: '\$7.00'),
              _MaggieItem(title: 'Egg Drop Maggie', description: 'Savory broth', price: '\$7.50'),
            ],
          ),
        ],
      ),
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

class _CoffeeItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;

  const _CoffeeItem({
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.surfaceContainerHighest,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/ethiopian_coffee.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          Text(subtitle, style: const TextStyle(fontSize: 11)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.add, color: AppColors.onPrimary, size: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MaggieItem extends StatelessWidget {
  final String title;
  final String description;
  final String price;

  const _MaggieItem({
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.surfaceContainerHighest,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://images.unsplash.com/photo-1569562211093-4ed0d0758f12?w=400',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.ramen_dining, size: 40, color: AppColors.primary),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          Text(description, style: const TextStyle(fontSize: 11)),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}