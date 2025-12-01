import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';

class TradePage extends StatefulWidget {
  const TradePage({super.key});

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  final List<Map<String, dynamic>> _tradeItems = [
    {
      'symbol': 'AAPL',
      'name': 'Apple Inc.',
      'action': 'BUY',
      'quantity': 100,
      'price': 266.58,
      'status': 'Filled',
      'time': '09:30:15',
      'date': '2024-01-15',
      'type': 'Mx50XQ ANRS',
    },
    {
      'symbol': 'TSLA',
      'name': 'Tesla Inc.',
      'action': 'SELL',
      'quantity': 50,
      'price': 396.30,
      'status': 'Filled',
      'time': '10:15:22',
      'date': '2024-01-15',
      'type': 'Mx50XQ ANRS',
    },
    {
      'symbol': 'GOOGL',
      'name': 'Alphabet Inc.',
      'action': 'BUY',
      'quantity': 75,
      'price': 290.71,
      'status': 'Pending',
      'time': '11:05:43',
      'date': '2024-01-15',
      'type': 'Mx50XQ',
    },
    {
      'symbol': 'AMZN',
      'name': 'Amazon.com',
      'action': 'BUY',
      'quantity': 200,
      'price': 217.89,
      'status': 'Cancelled',
      'time': '13:45:18',
      'date': '2024-01-15',
      'type': 'Mx50XQ',
    },
    {
      'symbol': 'MSFT',
      'name': 'Microsoft Corp.',
      'action': 'SELL',
      'quantity': 150,
      'price': 476.74,
      'status': 'Filled',
      'time': '14:20:35',
      'date': '2024-01-15',
      'type': 'Mx50XQ ANRS',
    },
    {
      'symbol': 'GS',
      'name': 'Goldman Sachs',
      'action': 'BUY',
      'quantity': 80,
      'price': 778.48,
      'status': 'Filled',
      'time': '15:10:12',
      'date': '2024-01-15',
      'type': 'nres',
    },
    {
      'symbol': 'V',
      'name': 'Visa Inc.',
      'action': 'BUY',
      'quantity': 120,
      'price': 324.99,
      'status': 'Partial',
      'time': '16:05:27',
      'date': '2024-01-15',
      'type': 'nres',
    },
  ];

  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Filled', 'Pending', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    final filteredItems = _selectedFilter == 'All' 
      ? _tradeItems 
      : _tradeItems.where((item) => item['status'] == _selectedFilter).toList();

    return ValueListenableBuilder<bool>(
      valueListenable: ThemeService.isDarkMode,
      builder: (context, isDarkMode, child) {
        return Scaffold(
          backgroundColor: ThemeService.backgroundColor,
          appBar: AppBar(
            backgroundColor: ThemeService.cardColor,
            elevation: 0,
            title: Text(
              "My Trades",
              style: TextStyle(
                color: ThemeService.textPrimaryColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF00E08F).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF00E08F),
                    width: 1,
                  ),
                ),
                child: Text(
                  "New Trade",
                  style: TextStyle(
                    color: const Color(0xFF00E08F),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: Column(
                children: [
                  // Filter Chips
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _filters.map((filter) {
                          final isSelected = _selectedFilter == filter;
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: FilterChip(
                              label: Text(
                                filter,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : ThemeService.textPrimaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              selected: isSelected,
                              onSelected: (selected) {
                                setState(() {
                                  _selectedFilter = filter;
                                });
                              },
                              backgroundColor: ThemeService.cardColor,
                              selectedColor: const Color(0xFF00E08F),
                              checkmarkColor: Colors.white,
                              side: BorderSide(
                                color: ThemeService.textSecondaryColor.withOpacity(0.2),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  // Table Header
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: ThemeService.cardColor.withOpacity(0.5),
                      border: Border(
                        bottom: BorderSide(
                          color: ThemeService.textSecondaryColor.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Instrument",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Action",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Qty",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Price",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Status",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              // Trade Items
              Expanded(
                child: ListView.builder(
                  itemCount: filteredItems.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    final isBuy = item['action'] == 'BUY';
                    final actionColor = isBuy ? const Color(0xFF00E08F) : const Color(0xFFFF4757);
                    
                    final status = item['status'];
                    Color statusColor = Colors.grey;
                    if (status == 'Filled') {
                      statusColor = const Color(0xFF00E08F);
                    } else if (status == 'Pending') {
                      statusColor = const Color(0xFFFFA502);
                    } else if (status == 'Cancelled') {
                      statusColor = const Color(0xFFFF4757);
                    } else if (status == 'Partial') {
                      statusColor = const Color(0xFF2ED573);
                    }

                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ThemeService.textSecondaryColor.withOpacity(0.05),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            // Instrument Column
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        item['symbol'],
                                        style: TextStyle(
                                          color: ThemeService.textPrimaryColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          item['type'].toString().toLowerCase(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: ThemeService.textSecondaryColor,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    item['name'],
                                    style: TextStyle(
                                      color: ThemeService.textSecondaryColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "${item['date']} ${item['time']}",
                                    style: TextStyle(
                                      color: ThemeService.textSecondaryColor.withOpacity(0.7),
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Action
                            Expanded(
                              flex: 2,
                              child: Text(
                                item['action'],
                                style: TextStyle(
                                  color: actionColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            // Quantity
                            Expanded(
                              flex: 2,
                              child: Text(
                                item['quantity'].toString(),
                                style: TextStyle(
                                  color: ThemeService.textPrimaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            // Price
                            Expanded(
                              flex: 3,
                              child: Text(
                                "\$${item['price'].toStringAsFixed(2)}",
                                style: TextStyle(
                                  color: ThemeService.textPrimaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            // Status
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: statusColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: statusColor.withOpacity(0.3),
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    item['status'],
                                    style: TextStyle(
                                      color: statusColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}