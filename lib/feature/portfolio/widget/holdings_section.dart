import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';
import 'package:sji_mobile/feature/portfolio/widget/analytics_tab.dart';
import 'package:sji_mobile/feature/portfolio/widget/history_tab.dart';
import 'package:sji_mobile/feature/portfolio/widget/holdings_table.dart';
import 'package:sji_mobile/feature/portfolio/widget/orders_tab.dart';

class HoldingsSection extends StatelessWidget {
  const HoldingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tab Header with Simple Underline Indicator
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Positions",
                      style: TextStyle(
                        color: ThemeService.textPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),            
                // Simple Underline Tab Bar
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: ThemeService.backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TabBar(
                    indicator: UnderlineTabIndicator(
                      borderSide: const BorderSide(
                        width: 3.0,
                        color: Color(0xFF00E08F),
                      ),
                      insets: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: ThemeService.textSecondaryColor,
                    labelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: const [
                      Tab(text: "Holdings"),
                      Tab(text: "Orders"),
                      Tab(text: "History"),
                      Tab(text: "Analytics"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Tab Content - Full Height
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7, 
            child: TabBarView(
              children: [
                // Tab 1: Holdings 
                 HoldingsTable(),
                
                // Tab 2: Orders
                 OrdersTab(),
                
                // Tab 3: History
                 HistoryTab(),
                
                // Tab 4: Analytics
                 AnalyticsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}