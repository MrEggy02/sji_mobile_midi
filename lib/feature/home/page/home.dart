import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';
import 'package:sji_mobile/feature/home/widget/app_bar.dart';
import 'package:sji_mobile/feature/home/widget/banner_widget.dart';
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
  bool _showBanner = true; 
  int _bannerIndex = 0;
  Timer? _bannerTimer;
  List<String> bannerImages = [
    "assets/images/banner_5.png",
    "assets/images/banner_6.png",
    "assets/images/banner_7.png",
  ];

  @override
  void initState() {
    super.initState();
    _loadBannerIndex();
    _startBannerTimer();
    
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  void dispose() {
    _bannerTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadBannerIndex() async {
    final prefs = await SharedPreferences.getInstance();
    int savedIndex = prefs.getInt('banner_index') ?? 0;
    
    setState(() {
      _bannerIndex = savedIndex;
    });
  }

  void _startBannerTimer() {
    _bannerTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_showBanner && _currentIndex == 0 && mounted) {
        setState(() {
          _bannerIndex = (_bannerIndex + 1) % bannerImages.length;
        });
        
        // Save the new banner index
        _saveBannerIndex();
      }
    });
  }

  Future<void> _saveBannerIndex() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('banner_index', _bannerIndex);
  }

  Future<void> _closeBanner() async {
    setState(() {
      _showBanner = false;
    });
    
 
    _bannerTimer?.cancel();
    _bannerTimer = null;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeService.isDarkMode,
      builder: (context, isDarkMode, child) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: ThemeService.cardColor,
          drawer: CustomDrawer(scaffoldKey: _scaffoldKey),
          body: _buildBody(),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Banner above bottom navigation bar - ALWAYS SHOW
              if (_showBanner && _currentIndex == 0)
                HomeBanner(
                  imagePath: bannerImages[_bannerIndex],
                  onClose: _closeBanner,
                ),
              CustomBottomNavigationBar(
                currentIndex: _currentIndex,
                onIndexChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ],
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