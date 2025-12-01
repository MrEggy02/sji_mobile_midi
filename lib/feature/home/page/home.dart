import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';
import 'package:sji_mobile/feature/home/widget/app_bar.dart';
import 'package:sji_mobile/feature/home/widget/bottom_navigation_bar.dart';
import 'package:sji_mobile/feature/home/widget/drawer.dart';
import 'package:sji_mobile/feature/home/widget/home_content.dart';
import 'package:sji_mobile/feature/portfolio/page/portfolio.dart';
import 'package:sji_mobile/feature/trade/trade.dart';
import 'package:sji_mobile/feature/watchlist/page/watchlist.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeService.isDarkMode,
      builder: (context, isDarkMode, child) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: ThemeService.backgroundColor,
          drawer: CustomDrawer(scaffoldKey: _scaffoldKey),
          body: _buildBody(),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildBody() {
  if (_currentIndex == 0) {
    return HomeContent(
      onMenuPressed: () {
        _scaffoldKey.currentState?.openDrawer(); 
      },
    );
  } else if (_currentIndex == 1) {
    return const PortfolioPage();
  } else if (_currentIndex == 2) {
    return const TradePage();
  } else if (_currentIndex == 3) {
    return const WatchlistPage();
  } else {
    // For Market, use the SimpleAppBar
    return Column(
      children: [
        SimpleAppBar(
          currentIndex: _currentIndex,
          onBackPressed: () {
            setState(() {
              _currentIndex = 0;
            });
          },
        ),
        Expanded(
          child: _buildMarketContent(),
        ),
      ],
    );
  }
}

  // Widget _buildCurrentPage() {
  //   switch (_currentIndex) {
     
  //     case 4:
  //       return _buildMarketContent();
  //     default:
  //       return Container();
  //   }
  // }

  // Your existing methods for Trade and Market content...
  Widget _buildMarketContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.public, color: ThemeService.textSecondaryColor, size: 64),
          const SizedBox(height: 16),
          Text(
            "Market",
            style: TextStyle(
              color: ThemeService.textSecondaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

 
}