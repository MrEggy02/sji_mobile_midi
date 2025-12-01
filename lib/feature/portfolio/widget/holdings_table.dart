import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';

class HoldingsTable extends StatelessWidget {
  final List<Map<String, dynamic>> _holdings = [
    {
      'instrument': 'AAPL NASDAQ NMS',
      'lastPosition': 266.86,
      'options': 37,
      'pnl': 15.91,
      'avgPrice': 217.17,
      'unitedPnl': 1.8,
    },
    {
      'instrument': 'TSLA NASDAQ NMS',
      'lastPosition': 395.56,
      'options': 17,
      'pnl': 9.86,
      'avgPrice': 339.81,
      'unitedPnl': 951.1,
    },
    {
      'instrument': 'ASML NASDAQ NMS',
      'lastPosition': 963.83,
      'options': 2,
      'pnl': -34.54,
      'avgPrice': 712.55,
      'unitedPnl': 502.4,
    },
    {
      'instrument': 'GS NYSE',
      'lastPosition': 778.48,
      'options': 1,
      'pnl': 1.25,
      'avgPrice': 506.92,
      'unitedPnl': 268.1,
    },
    {
      'instrument': 'ANET NYSE',
      'lastPosition': 118.80,
      'options': 3,
      'pnl': -2.37,
      'avgPrice': 79.87,
      'unitedPnl': 116.7,
    },
    {
      'instrument': 'ARBE NASDAQ SCM',
      'lastPosition': 1.23,
      'options': 300,
      'pnl': -12.00,
      'avgPrice': 1.96,
      'unitedPnl': -212.1,
    },
    {
      'instrument': 'META NASDAQ NMS',
      'lastPosition': 585.00,
      'options': 5.3,
      'pnl': -21.89,
      'avgPrice': 648.15,
      'unitedPnl': -334.1,
    },
    {
      'instrument': 'NVO NYSE',
      'lastPosition': 47.00,
      'options': 27.5,
      'pnl': -17.05,
      'avgPrice': 90.71,
      'unitedPnl': -1.21,
    },
    {
      'instrument': 'RR NASDAQ SCM',
      'lastPosition': 2.95,
      'options': 850,
      'pnl': -51.00,
      'avgPrice': 4.70,
      'unitedPnl': -1.41,
    },
    {
      'instrument': 'MSFT NASDAQ NMS',
      'lastPosition': 420.50,
      'options': 25,
      'pnl': 8.45,
      'avgPrice': 380.25,
      'unitedPnl': 1.2,
    },
    {
      'instrument': 'GOOGL NASDAQ NMS',
      'lastPosition': 2850.75,
      'options': 8,
      'pnl': 12.34,
      'avgPrice': 2600.50,
      'unitedPnl': 2.1,
    },
    {
      'instrument': 'AMZN NASDAQ NMS',
      'lastPosition': 3500.25,
      'options': 12,
      'pnl': -5.67,
      'avgPrice': 3650.80,
      'unitedPnl': -0.8,
    },
  ];

   HoldingsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          // Table Header (Fixed)
          Container(
            decoration: BoxDecoration(
              color: ThemeService.cardColor.withOpacity(0.9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(2.5),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
                4: FlexColumnWidth(1.2),
              },
              children: [
                TableRow(
                  children: [
                    _buildTableHeaderCell("Instrument"),
                    _buildTableHeaderCell("Options"),
                    _buildTableHeaderCell("P&L"),
                    _buildTableHeaderCell("Avg Price"),
                    _buildTableHeaderCell("United P&L"),
                  ],
                ),
              ],
            ),
          ),
          
          // Scrollable Table Body
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(2.5),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1.2),
                },
                border: TableBorder(
                  horizontalInside: BorderSide(
                    color: ThemeService.textSecondaryColor.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                children: _holdings.map((holding) => TableRow(
                  children: [
                    _buildInstrumentCell(
                      holding['instrument'],
                      holding['lastPosition'],
                    ),
                    _buildTableCell(
                      holding['options'].toString(),
                      TextAlign.center,
                    ),
                    _buildPnlCell(holding['pnl']),
                    _buildTableCell(
                      "\$${holding['avgPrice'].toStringAsFixed(2)}",
                      TextAlign.center,
                    ),
                    _buildUnitedPnlCell(holding['unitedPnl']),
                  ],
                )).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Text(
        text,
        style: TextStyle(
          color: ThemeService.textSecondaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTableCell(String text, TextAlign align) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      child: Text(
        text,
        style: TextStyle(
          color: ThemeService.textPrimaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        textAlign: align,
      )
    );
  }

  Widget _buildInstrumentCell(String instrument, double lastPosition) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            instrument.split(' ')[0],
            style: TextStyle(
              color: ThemeService.textPrimaryColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                instrument.split(' ').sublist(1).join(' '),
                style: TextStyle(
                  color: ThemeService.textSecondaryColor,
                  fontSize: 10,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "\$${lastPosition.toStringAsFixed(2)}",
                style: TextStyle(
                  color: ThemeService.textSecondaryColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPnlCell(double pnl) {
    bool isPositive = pnl >= 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isPositive ? Icons.arrow_upward : Icons.arrow_downward,
            color: isPositive ? Colors.green : Colors.red,
            size: 12,
          ),
          const SizedBox(width: 4),
          Text(
            pnl.toStringAsFixed(2),
            style: TextStyle(
              color: isPositive ? Colors.green : Colors.red,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnitedPnlCell(double unitedPnl) {
    bool isPositive = unitedPnl >= 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isPositive 
              ? Colors.green.withOpacity(0.1)
              : Colors.red.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isPositive 
                ? Colors.green.withOpacity(0.3)
                : Colors.red.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Text(
          "\$${unitedPnl.toStringAsFixed(1)}",
          style: TextStyle(
            color: isPositive ? Colors.green : Colors.red,
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}