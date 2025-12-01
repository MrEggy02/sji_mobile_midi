import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';
import 'quick_actions.dart';

class CombinedHeader extends StatelessWidget {
  final VoidCallback onMenuPressed;

  const CombinedHeader({super.key, required this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 280,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00E08F), Color(0xFF007A5A)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              // Background image
              Positioned.fill(
                child: Image.asset(
                  'assets/images/thatluang1.png',
                  fit: BoxFit.cover,
                ),
              ),
              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF00E08F).withOpacity(0.7),
                      Color(0xFF007A5A).withOpacity(0.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              _buildAppBar(),
              Positioned(
                top: 85,
                left: 0,
                right: 0,
                child: _buildTotalBalanceSection(),
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -40),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: const QuickActions(),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Menu Icon (using image)
          IconButton(
            icon: Container(
              width: 40,
              height: 40,
             
              child: Image.asset(
                'assets/icons/menubar.png', 
                width: 20,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
            onPressed: onMenuPressed,
          ),

       
         Padding(
  padding: const EdgeInsets.only(left: 42), // ขยับไปทางขวา 10px
  child: Image.asset(
    'assets/icons/sji.png',
    width: 80,
    height: 50,
    fit: BoxFit.contain,
  ),
),


          Row(
            children: [
         
              IconButton(
                icon: Container(
                  width: 30,
                  height: 30,
                
                  child: Image.asset(
                    'assets/icons/help.png', 
                    width: 16,
                    height: 16,
                    fit: BoxFit.contain,
                  ),
                ),
                onPressed: () {},
              ),
              
           
              IconButton(
                icon: Container(
                  width: 30,
                  height: 30,
                  
                  child: Image.asset(
                    'assets/icons/notification.png', 
                    height: 16,
                    fit: BoxFit.contain,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

Widget _buildTotalBalanceSection() {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total Balance",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

  
            Row(
              children: [
                // Eye Icon
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.black,
                    size: 18,
                  ),
                ),

               

               
              ],
            )
          ],
        ),

        const SizedBox(height: 0),

        const Text(
          "\$ 123,213.21",
          style: TextStyle(
            fontFamily: 'Inter',
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 4),

        const Text(
          "ກຳໄລ:\$33,000.00",
          style: TextStyle(
            fontFamily: 'Inter',
            color: Colors.white,
            fontSize: 12,
           
          ),
        ),

        const SizedBox(height: 3),

        const Text(
          "ມູນຄ່າຕົ້ນທຶນ:\$90,000.00",
          style: TextStyle(
            fontFamily: 'Inter',
            color: Colors.white,
            fontSize: 12,
         
          ),
        ),
      ],
    ),
  );
}


}