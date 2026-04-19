import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:stitch_crave_cafe/theme/app_theme.dart';

class BookATablePage extends StatefulWidget {
  const BookATablePage({super.key});

  @override
  State<BookATablePage> createState() => _BookATablePageState();
}

class _BookATablePageState extends State<BookATablePage> {
  int _guests = 2;
  int _selectedDay = 12;
  String _selectedTime = '10:00 AM';
  String _selectedSeating = 'standard';

  final List<String> _timeSlots = [
    '08:00 AM', '09:30 AM', '10:00 AM', '12:30 PM', '01:00 PM', '02:30 PM'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeader()),
          SliverToBoxAdapter(child: _buildDateGuestsSection()),
          SliverToBoxAdapter(child: _buildTimeSection()),
          SliverToBoxAdapter(child: _buildSeatingSection()),
          SliverToBoxAdapter(child: _buildConfirmButton()),
SliverToBoxAdapter(child: _buildFooter()),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              color: AppColors.surface.withValues(alpha: 0.8),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu),
                    color: AppColors.primary,
                    onPressed: () {},
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.surfaceContainerHighest,
                    child: Icon(Icons.person, size: 16, color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            constraints: const BoxConstraints(minHeight: 200),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Opacity(
                      opacity: 0.4,
                      child: Image.asset(
                        'assets/images/book_table_hero.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.transparent, AppColors.surface],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Reserve \nYour Seat',
                        style: TextStyle(
                          fontFamily: 'Noto Serif',
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Join us for a slow morning or a lively evening.',
                        style: TextStyle(color: AppColors.onSecondaryContainer),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateGuestsSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(child: _buildDatePicker()),
          const SizedBox(width: 8),
          Expanded(child: _buildGuestPicker()),
        ],
      ),
    );
  }

  Widget _buildDatePicker() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.secondaryContainer,
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: const Icon(Icons.calendar_month, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 8),
              const Text(
                'Select Date',
                style: TextStyle(
                  fontFamily: 'Noto Serif',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [12, 13, 14, 15].map((day) {
                final isSelected = day == _selectedDay;
                return GestureDetector(
                  onTap: () => setState(() => _selectedDay = day),
                  child: Container(
                    width: 56,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ['Thu', 'Fri', 'Sat', 'Sun'][day - 12],
                          style: TextStyle(
                            fontSize: 10,
                            color: isSelected ? AppColors.onPrimary : AppColors.onSecondaryContainer,
                          ),
                        ),
                        Text(
                          '$day',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? AppColors.onPrimary : AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuestPicker() {
    return Container(
      padding: const EdgeInsets.all(12),
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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: const Icon(Icons.group, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 8),
              const Text(
                'Party Size',
                style: TextStyle(
                  fontFamily: 'Noto Serif',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => setState(() => _guests = (_guests > 1) ? _guests - 1 : 1),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.remove, color: AppColors.primary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Text(
                      '$_guests',
                      style: const TextStyle(
                        fontFamily: 'Noto Serif',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const Text(
                      'Guests',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _guests++),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.add, color: AppColors.primary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryContainer,
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: const Icon(Icons.schedule, color: AppColors.primary, size: 20),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Select Time',
                  style: TextStyle(
                    fontFamily: 'Noto Serif',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _timeSlots.map((time) {
                final isSelected = time == _selectedTime;
                return GestureDetector(
                  onTap: () => setState(() => _selectedTime = time),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      time,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: isSelected ? AppColors.onPrimary : AppColors.primary,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeatingSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seating Preference',
              style: TextStyle(
                fontFamily: 'Noto Serif',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 4),
            const Text('We will do our best to accommodate.'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _seatingOption('standard', 'table_restaurant', 'Standard Table')),
                const SizedBox(width: 8),
                Expanded(child: _seatingOption('bar', 'local_cafe', 'Bar Seating')),
                const SizedBox(width: 8),
                Expanded(child: _seatingOption('patio', 'deck', 'Patio')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _seatingOption(String value, String icon, String label) {
    final isSelected = value == _selectedSeating;
    return GestureDetector(
      onTap: () => setState(() => _selectedSeating = value),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondaryContainer.withValues(alpha: 0.3) : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(
              _getIconData(icon),
              color: isSelected ? AppColors.primary : AppColors.onSecondaryContainer,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconData(String name) {
    switch (name) {
      case 'table_restaurant':
        return Icons.table_restaurant;
      case 'local_cafe':
        return Icons.local_cafe;
      case 'deck':
        return Icons.deck;
      default:
        return Icons.table_restaurant;
    }
  }

  Widget _buildConfirmButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Reservation details:', style: TextStyle(fontSize: 12)),
                Text(
                  'Thu, Oct $_selectedDay • $_selectedTime • $_guests Guests',
                  style: const TextStyle(
                    fontFamily: 'Noto Serif',
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Confirm Booking'),
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