import 'package:flutter/material.dart';
import 'package:stitch_crave_cafe/theme/app_theme.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Row(
        children: [
          _buildSideNav(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _buildHeader()),
                SliverToBoxAdapter(child: _buildMetrics()),
                SliverToBoxAdapter(child: _buildRecentOrders()),
                SliverToBoxAdapter(child: _buildQuickLinks()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSideNav() {
    return Container(
      width: 240,
      color: AppColors.surface,
      child: Column(
        children: [
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Icon(Icons.person, color: AppColors.onPrimary),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cafe Manager',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'The Hearth - Downtown',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Admin Access',
                        style: TextStyle(
                          fontSize: 10,
                          color: AppColors.tertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _sideNavItem(Icons.dashboard, 'Dashboard', isActive: true),
          _sideNavItem(Icons.receipt_long, 'Order History'),
          _sideNavItem(Icons.edit_note, 'Menu Manager'),
          _sideNavItem(Icons.groups, 'Staff'),
          _sideNavItem(Icons.settings, 'Settings'),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'The Hearth',
              style: TextStyle(
                fontFamily: 'Noto Serif',
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sideNavItem(IconData icon, String label, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Icon(
          icon,
          color: isActive ? AppColors.onPrimary : AppColors.primary,
        ),
        title: Text(
          label,
          style: TextStyle(
            color: isActive ? AppColors.onPrimary : AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: isActive ? AppColors.primary : Colors.transparent,
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Overview',
                style: TextStyle(
                  fontFamily: 'Noto Serif',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Today's snapshot for Downtown location.",
                style: TextStyle(color: AppColors.onSecondaryContainer),
              ),
            ],
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  backgroundColor: AppColors.surfaceContainerHighest,
                ),
                child: const Text('Export Report'),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 18),
                label: const Text('New Order'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.tertiary,
                  foregroundColor: AppColors.onTertiary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetrics() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
        children: const [
          _MetricItem(icon: Icons.point_of_sale, title: 'Daily Sales', value: '\$2,450', change: '+12%'),
          _MetricItem(icon: Icons.event_seat, title: 'Active Bookings', value: '18', change: '+4'),
          _MetricItem(icon: Icons.local_cafe, title: 'Orders Pending', value: '12'),
          _MetricItem(icon: Icons.group, title: 'Staff On Shift', value: '5'),
        ],
      ),
    );
  }

  Widget _buildRecentOrders() {
    return Padding(
      padding: const EdgeInsets.all(24),
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
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(foregroundColor: AppColors.primary),
                child: const Text('View All'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _orderCard(
            '#42',
            '2x Pour Over, 1x Croissant',
            'Table 4 • 10:42 AM',
            'Preparing',
            '\$18.50',
          ),
          const SizedBox(height: 12),
          _orderCard(
            '#43',
            '1x Latte, 1x Avocado Toast',
            'Takeaway • 10:45 AM',
            'Pending',
            '\$14.00',
          ),
          const SizedBox(height: 12),
          _orderCard(
            '#41',
            '3x Espresso, 1x Scone',
            'Table 12 • 10:35 AM',
            'Ready',
            '\$22.00',
          ),
        ],
      ),
    );
  }

  Widget _orderCard(String number, String item, String time, String status, String price) {
    Color statusColor;
    switch (status) {
      case 'Preparing':
        statusColor = AppColors.tertiary;
        break;
      case 'Ready':
        statusColor = AppColors.primary;
        break;
      default:
        statusColor = AppColors.primary.withValues(alpha: 0.3);
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Text(time, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            price,
            style: const TextStyle(
              fontFamily: 'Noto Serif',
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickLinks() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Links',
            style: TextStyle(
              fontFamily: 'Noto Serif',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, Color(0xFF6f4e37)],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Manage Menu',
                  style: TextStyle(
                    fontFamily: 'Noto Serif',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.onPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Update seasonal items, pricing, and availability.',
                  style: TextStyle(color: AppColors.onPrimary, fontSize: 13),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.surfaceContainerLowest,
                    foregroundColor: AppColors.primary,
                  ),
                  child: const Text('Go to Menu'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(9999),
                      ),
                      child: const Icon(Icons.groups, color: AppColors.primary),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Staff Roster',
                      style: TextStyle(
                        fontFamily: 'Noto Serif',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  '5 staff members currently on shift.',
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.tertiary,
                  ),
                  child: const Text('Manage Staff'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String? change;

  const _MetricItem({
    required this.icon,
    required this.title,
    required this.value,
    this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 20),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: AppColors.onSecondaryContainer),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Noto Serif',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          if (change != null)
            Text(
              change!,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}