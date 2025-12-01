import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> history = [
      {
        'date': 'Today',
        'transactions': [
          {'type': 'Dividend', 'symbol': 'AAPL', 'amount': '+45.20', 'color': Colors.green},
          {'type': 'Fee', 'description': 'Monthly maintenance', 'amount': '-5.00', 'color': Colors.red},
        ],
      },
      {
        'date': 'Yesterday',
        'transactions': [
          {'type': 'Buy', 'symbol': 'TSLA', 'amount': '-1,977.80', 'color': Colors.red},
          {'type': 'Sell', 'symbol': 'META', 'amount': '+3,125.50', 'color': Colors.green},
          {'type': 'Dividend', 'symbol': 'GS', 'amount': '+12.75', 'color': Colors.green},
        ],
      },
    ];

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: ThemeService.cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: history.map((day) => _buildHistoryDay(day)).toList(),
        ),
      ),
    );
  }

  Widget _buildHistoryDay(Map<String, dynamic> day) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: ThemeService.backgroundColor,
            border: Border(
              bottom: BorderSide(
                color: ThemeService.textSecondaryColor.withOpacity(0.1),
              ),
            ),
          ),
          child: Text(
            day['date'],
            style: TextStyle(
              color: ThemeService.textPrimaryColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...day['transactions'].map((transaction) => _buildTransactionItem(transaction)).toList(),
      ],
    );
  }

  Widget _buildTransactionItem(Map<String, dynamic> transaction) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ThemeService.textSecondaryColor.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: transaction['color'].withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getTransactionIcon(transaction['type']),
              color: transaction['color'],
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction['type'],
                  style: TextStyle(
                    color: ThemeService.textPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  transaction['symbol'] ?? transaction['description'] ?? '',
                  style: TextStyle(
                    color: ThemeService.textSecondaryColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            transaction['amount'],
            style: TextStyle(
              color: transaction['color'],
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getTransactionIcon(String type) {
    switch (type) {
      case 'Buy':
        return Icons.shopping_cart;
      case 'Sell':
        return Icons.attach_money;
      case 'Dividend':
        return Icons.account_balance_wallet;
      case 'Fee':
        return Icons.money_off;
      default:
        return Icons.receipt;
    }
  }
}