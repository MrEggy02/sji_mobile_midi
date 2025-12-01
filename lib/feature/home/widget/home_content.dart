import 'package:flutter/material.dart';
import 'package:sji_mobile/feature/home/widget/news_section.dart';
import 'package:sji_mobile/feature/home/widget/social_section.dart';
import 'package:sji_mobile/feature/home/widget/position_section.dart';
import 'package:sji_mobile/feature/home/widget/header.dart';

import 'last_buy_section.dart';


class HomeContent extends StatefulWidget {
  final VoidCallback onMenuPressed;

  const HomeContent({
    super.key,
    required this.onMenuPressed,
  });

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          CombinedHeader(onMenuPressed: widget.onMenuPressed), 
          const WatchlistSection(),
          const MyTrades(),
          const NewsSection(),
            SocialSection(),     
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}