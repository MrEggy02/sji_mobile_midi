import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sji_mobile/feature/home/widget/news_section.dart';
import 'package:sji_mobile/feature/home/widget/social_section.dart';
import 'package:sji_mobile/feature/home/widget/watchlist_section.dart';
import 'package:sji_mobile/feature/home/widget/header.dart';

class HomeContent extends StatefulWidget {
  final VoidCallback onMenuPressed;

  const HomeContent({super.key, required this.onMenuPressed});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool _showBanner = false;

  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeenBanner = prefs.getBool('has_seen_banner') ?? false;

    if (!hasSeenBanner) {
      setState(() {
        _showBanner = true;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CombinedHeader(onMenuPressed: widget.onMenuPressed),

          if (_showBanner) 
        
          const MyTrades(),
        
          SocialSection(),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
