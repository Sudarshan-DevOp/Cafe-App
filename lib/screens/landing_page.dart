import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:stitch_crave_cafe/theme/app_theme.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _buildHeader(context),
          ),
          SliverToBoxAdapter(
            child: _buildHeroSection(context),
          ),
          SliverToBoxAdapter(
            child: _buildOurStorySection(),
          ),
          SliverToBoxAdapter(
            child: _buildFeaturedMenu(),
          ),
SliverToBoxAdapter(
            child: _buildFooter(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          color: AppColors.surface.withValues(alpha: 0.8),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      color: AppColors.primary,
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.surfaceContainerHighest,
                    child: const Icon(Icons.person, color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.surfaceContainerHighest,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/images/landing_hero.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.surfaceContainerLow,
                    child: const Center(
                      child: Icon(Icons.local_cafe, size: 80, color: AppColors.primary),
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withValues(alpha: 0.6),
                    AppColors.surfaceContainerHighest.withValues(alpha: 0.2),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Warmth in\nevery cup.',
                    style: TextStyle(
                      fontFamily: 'Noto Serif',
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: AppColors.surface,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'A sanctuary for the senses. Freshly roasted coffee and hand-crafted comfort in the heart of the city.',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.surface,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/book');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.tertiary,
                      foregroundColor: AppColors.onTertiary,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Book a Table'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOurStorySection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(24),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;
            return Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              children: [
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.tertiary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'OUR STORY',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: AppColors.tertiary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Crafted with intention.',
                        style: TextStyle(
                          fontFamily: 'Noto Serif',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'The Hearth was born from a simple desire: to create a space that feels like returning home. We source our beans ethically, roast them meticulously, and bake our pastries fresh daily.',
                        style: TextStyle(
                          color: AppColors.onSecondaryContainer,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: isMobile ? 0 : 16, height: isMobile ? 24 : 0),
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.surfaceContainerHighest,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/our_story.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(Icons.coffee, size: 60, color: AppColors.primary),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeaturedMenu() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Curated Comforts',
                      style: TextStyle(
                        fontFamily: 'Noto Serif',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Selections to warm your soul.',
                      style: TextStyle(color: AppColors.onSecondaryContainer),
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward, size: 18),
                label: const Text('Full Menu'),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 340,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _MenuItemCard(
                  title: 'Ethiopian Yirgacheffe',
                  description: 'A delicate pour-over with notes of jasmine and bergamot.',
                  price: '\$6.00',
                  tags: ['Floral', 'Bright'],
                  imagePath: 'assets/images/ethiopian_coffee.png',
                ),
                SizedBox(width: 16),
                _MenuItemCard(
                  title: 'Hearth Margherita',
                  description: 'San Marzano tomatoes, fresh mozzarella, basil.',
                  price: '\$18.00',
                  tags: ['Savory', 'Shareable'],
                  imagePath: 'assets/images/featured_pizza.png',
                ),
                SizedBox(width: 16),
                _MenuItemCard(
                  title: 'Almond Croissant',
                  description: 'Twice-baked with rich frangipane filling.',
                  price: '\$5.50',
                  tags: ['Sweet', 'Flaky'],
                  imagePath: 'assets/images/our_story.png',
                ),
              ],
            ),
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
              fontStyle: FontStyle.italic,
              color: AppColors.surface,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '© 2024 The Hearth Cafe. Brewed with passion.',
            style: TextStyle(color: AppColors.surface, fontSize: 14),
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 12,
            children: [
              _footerLink('Sourcing'),
              _footerLink('Privacy'),
              _footerLink('Careers'),
              _footerLink('Contact'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        text,
        style: const TextStyle(color: AppColors.surface, fontSize: 14),
      ),
    );
  }
}

class _MenuItemCard extends StatelessWidget {
  final String imagePath;
  final List<String> tags;
  final String title;
  final String description;
  final String price;

  const _MenuItemCard({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.surfaceContainerHighest,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.coffee, size: 40, color: AppColors.primary),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: tags.map((tag) => _TagChip(text: tag)).toList(),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Noto Serif',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(fontSize: 12, color: AppColors.onSecondaryContainer),
            maxLines: 2,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: AppColors.onPrimary, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final String text;

  const _TagChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.secondaryContainer,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          color: AppColors.onSecondaryContainer,
        ),
      ),
    );
  }
}