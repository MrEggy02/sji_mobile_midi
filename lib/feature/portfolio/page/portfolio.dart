import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';
import 'package:sji_mobile/feature/portfolio/widget/holdings_section.dart';
import 'package:sji_mobile/feature/portfolio/chart/performance_chart.dart';
import 'package:sji_mobile/feature/portfolio/widget/portfolio_header.dart';
import 'package:sji_mobile/feature/portfolio/widget/portfolio_overview.dart';
import 'package:sji_mobile/feature/portfolio/widget/time_frame_selector.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  int _selectedTimeFrame = 0;
  final List<String> _timeFrames = ['1D', '1W', '1M', '1Y', 'All'];
  bool _isBalanceVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeService.backgroundColor,
      body: _buildPortfolioContent(),
    );
  }

  Widget _buildPortfolioContent() {
    return SafeArea(
      child: Column(
        children: [
          PortfolioHeader(
            isBalanceVisible: _isBalanceVisible,
            onVisibilityChanged: (visible) {
              setState(() {
                _isBalanceVisible = visible;
              });
            },
          ),
          
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PortfolioOverview(isBalanceVisible: _isBalanceVisible),
                  const SizedBox(height: 24),
                  const PerformanceChart(),
                  const SizedBox(height: 2),
                  TimeFrameSelector(
                    timeFrames: _timeFrames,
                    selectedTimeFrame: _selectedTimeFrame,
                    onTimeFrameChanged: (index) {
                      setState(() {
                        _selectedTimeFrame = index;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const HoldingsSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}