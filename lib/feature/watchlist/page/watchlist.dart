import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  final List<Map<String, dynamic>> _watchlistItems = [
    {
      'symbol': 'GS',
      'name': 'Goldman Sachs',
      'last': 778.48,
      'change': 4.78,
      'changePercent': 0.62,
      'volume': '5.92K',
      'position': 'Pos 1',
      'pnl': 5.80,
      'uhz': 272.58,
      'type': 'nres',
    },
    {
      'symbol': 'MA',
      'name': 'Mastercard',
      'last': 530.88,
      'change': 3.00,
      'changePercent': 0.57,
      'volume': '2.60K',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'nres',
    },
    {
      'symbol': 'AMZN',
      'name': 'Amazon.com',
      'last': 217.89,
      'change': 0.75,
      'changePercent': 0.35,
      'volume': '323K',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'Mx50XQ',
    },
    {
      'symbol': 'DIS',
      'name': 'Walt Disney',
      'last': 103.20,
      'change': 0.50,
      'changePercent': 0.49,
      'volume': '13.2K',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'nres',
    },
    {
      'symbol': 'GOOGL',
      'name': 'Alphabet Inc.',
      'last': 290.71,
      'change': 1.26,
      'changePercent': 0.44,
      'volume': '693K',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'Mx50XQ',
    },
    {
      'symbol': 'COST',
      'name': 'Costco Wholesale',
      'last': 896.95,
      'change': 3.66,
      'changePercent': 0.41,
      'volume': '3.32K',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'Mx50XQ ANRS',
    },
    {
      'symbol': 'V',
      'name': 'Visa Inc.',
      'last': 324.99,
      'change': 1.22,
      'changePercent': 0.38,
      'volume': '13.4K',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'nres',
    },
    {
      'symbol': 'LOW',
      'name': "Lowe's Companies",
      'last': 229.25,
      'change': 0.82,
      'changePercent': 0.36,
      'volume': '680',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'nres',
    },
    {
      'symbol': 'TSLA',
      'name': 'Tesla Inc.',
      'last': 396.30,
      'change': 1.07,
      'changePercent': 0.27,
      'volume': '1.06M',
      'position': 'Pos 17',
      'pnl': 21.59,
      'uhz': 965.71,
      'type': 'Mx50XQ ANRS',
    },
    {
      'symbol': 'MCD',
      'name': "McDonald's",
      'last': 305.00,
      'change': 0.84,
      'changePercent': 0.28,
      'volume': '5.72K',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'nres',
    },
    {
      'symbol': 'JPM',
      'name': 'JP Morgan',
      'last': 299.17,
      'change': 0.79,
      'changePercent': 0.26,
      'volume': '9.92K',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'nres',
    },
    {
      'symbol': 'HD',
      'name': 'Home Depot',
      'last': 333.00,
      'change': 0.62,
      'changePercent': 0.19,
      'volume': '7.52K',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'nres',
    },
    {
      'symbol': 'CAT',
      'name': 'Caterpillar Inc.',
      'last': 547.00,
      'change': 0.87,
      'changePercent': 0.16,
      'volume': '4.20K',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'nres',
    },
    {
      'symbol': 'AAPL',
      'name': 'Apple Inc.',
      'last': 266.58,
      'change': 0.33,
      'changePercent': 0.12,
      'volume': '226K',
      'position': 'Pos 37',
      'pnl': 9.25,
      'uhz': 1625.00,
      'type': 'Mx50XQ ANRS',
    },
    {
      'symbol': 'AMGN',
      'name': 'Amgen Inc.',
      'last': 335.86,
      'change': -0.21,
      'changePercent': -0.06,
      'volume': '3.76K',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'Mx50XQ ANRS',
    },
    {
      'symbol': 'JEPQ',
      'name': 'JPMorgan ETF',
      'last': 55.68,
      'change': -0.14,
      'changePercent': -0.25,
      'volume': '97.4K',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'Mx50XQ ANRS',
    },
    {
      'symbol': 'DELL',
      'name': 'Dell Technologies',
      'last': 117.00,
      'change': -0.40,
      'changePercent': -0.34,
      'volume': '33.3K',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'nres',
    },
    {
      'symbol': 'MSFT',
      'name': 'Microsoft Corp.',
      'last': 476.74,
      'change': -1.69,
      'changePercent': -0.35,
      'volume': '153K',
      'position': null,
      'pnl': null,
      'uhz': null,
      'type': 'Mx50XQ ANRS',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeService.isDarkMode,
      builder: (context, isDarkMode, child) {
        return Scaffold(
          backgroundColor: ThemeService.backgroundColor,
          appBar: AppBar(
            backgroundColor: ThemeService.cardColor,
            elevation: 0,
            title: Text(
              "Watch List",
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
                  "Add Instrument",
                  style: TextStyle(
                    color: const Color(0xFF00E08F),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Container(
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
                      flex: 4,
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
                      flex: 3,
                      child: Text(
                        "Last",
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
                        "Change",
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
                        "Change%",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Volume",
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
            ),
          ),
          body: Column(
            children: [
              // Watchlist Items
              Expanded(
                child: ListView.builder(
                  itemCount: _watchlistItems.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = _watchlistItems[index];
                    final isPositive = item['change'] >= 0;
                    final changeColor = isPositive
                        ? const Color(0xFF00E08F)
                        : const Color(0xFFFF4757);

                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ThemeService.textSecondaryColor.withOpacity(
                              0.05,
                            ),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          // Main row with instrument data
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Row(
                              children: [
                                // Instrument Column
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            item['symbol'],
                                            style: TextStyle(
                                              color:
                                                  ThemeService.textPrimaryColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              item['type']
                                                  .toString()
                                                  .toLowerCase(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: ThemeService
                                                    .textSecondaryColor,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (item['position'] != null) ...[
                                        const SizedBox(height: 4),
                                        Text(
                                          item['position'],
                                          style: TextStyle(
                                            color:
                                                ThemeService.textSecondaryColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "P&L ${item['pnl']}",
                                                style: TextStyle(
                                                  color: ThemeService
                                                      .textSecondaryColor,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "    ",
                                                style: TextStyle(
                                                  color: ThemeService
                                                      .textSecondaryColor,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "UHz ${item['uhz']}",
                                                style: TextStyle(
                                                  color: ThemeService
                                                      .textSecondaryColor,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ),

                                // Last Price
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    item['last'].toStringAsFixed(2),
                                    style: TextStyle(
                                      color: ThemeService.textPrimaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                                // Change
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    isPositive
                                        ? "+${item['change'].toStringAsFixed(2)}"
                                        : item['change'].toStringAsFixed(2),
                                    style: TextStyle(
                                      color: changeColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                                // Change Percentage
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    isPositive
                                        ? "+${item['changePercent'].toStringAsFixed(2)}%"
                                        : "${item['changePercent'].toStringAsFixed(2)}%",
                                    style: TextStyle(
                                      color: changeColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),

                                // Volume
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      item['volume'],
                                      style: TextStyle(
                                        color: ThemeService.textSecondaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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