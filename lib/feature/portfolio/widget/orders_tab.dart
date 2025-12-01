import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> orders = [
      {
        'symbol': 'AAPL',
        'type': 'Buy',
        'quantity': 10,
        'price': 266.86,
        'status': 'Completed',
        'time': '10:30 AM',
      },
      {
        'symbol': 'TSLA',
        'type': 'Sell',
        'quantity': 5,
        'price': 395.56,
        'status': 'Pending',
        'time': '09:15 AM',
      },
      {
        'symbol': 'META',
        'type': 'Buy',
        'quantity': 8,
        'price': 585.00,
        'status': 'Completed',
        'time': 'Yesterday',
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
          children: orders.map((order) => _buildOrderItem(order)).toList(),
        ),
      ),
    );
  }

  Widget _buildOrderItem(Map<String, dynamic> order) {
    bool isBuy = order['type'] == 'Buy';
    bool isCompleted = order['status'] == 'Completed';
    
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
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isBuy 
                  ? Colors.green.withOpacity(0.1)
                  : Colors.red.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isBuy ? Icons.arrow_upward : Icons.arrow_downward,
              color: isBuy ? Colors.green : Colors.red,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order['symbol'],
                      style: TextStyle(
                        color: ThemeService.textPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$${order['price']}",
                      style: TextStyle(
                        color: ThemeService.textPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${order['type']} • ${order['quantity']} shares",
                      style: TextStyle(
                        color: ThemeService.textSecondaryColor,
                        fontSize: 12,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: isCompleted 
                            ? Colors.green.withOpacity(0.1)
                            : Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        order['status'],
                        style: TextStyle(
                          color: isCompleted ? Colors.green : Colors.orange,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  order['time'],
                  style: TextStyle(
                    color: ThemeService.textSecondaryColor,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}