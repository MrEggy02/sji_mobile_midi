import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/color/styles_color.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';

class SocialSection extends StatelessWidget {
  SocialSection({super.key});

  final List<Map<String, dynamic>> _socialItems = const [
    {
      'name': 'INSIGHTER YIXI',
      'handle': '@yixi_insighter',
      'content': 'And yes guys... this move was not random at BTC dipped exactly into that liquidity pocket around 88,600.grabbed every late short and panic long... and instantly bounce...',
      'time': '2h ago',
      'isFollowing': true,
      'symbol': 'BTC',
      'change': '-49.27%',
      'isPositive': false,
      'likes': 124,
      'comments': 23,
      'shares': 8,
      'isLiked': false,
      'imageUrl': 'https://picsum.photos/400/200?random=1',
    },
    {
      'name': 'EyeOnChain',
      'handle': '@EyeOnChain11',
      'content': 'THE MAX-LEVERAGE MAYERICK IS BACK AND THIS TIME HE\'S SHORTING EVERYTHING--- the undisputed king of maximum-leverage carnage on Hyperliquid, and the largest sOL shorter on the entire..',
      'time': '4h ago',
      'isFollowing': false,
      'symbol': 'SOL',
      'change': '+12.5%',
      'isPositive': true,
      'likes': 89,
      'comments': 15,
      'shares': 3,
      'isLiked': true,
      'imageUrl': 'https://picsum.photos/400/200?random=2',
    },
  ];

  final List<String> _filterOptions = [
    'All',
    'BTC',
    'ETH',
    'SOL',
    'Trending',
    'Latest',
    'Following',
    'Popular',
    'News',
    'Analysis'
  ];

  int _selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeService.isDarkMode,
      builder: (context, isDarkMode, child) {
        return Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News and Social Feed",
                    style: TextStyle(
                      color: ThemeService.textPrimaryColor.withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              
              Container(
                decoration: BoxDecoration(
                  color: ThemeService.cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Filter Buttons Row
                    _buildFilterButtons(isDarkMode),
                    
                    // Social Items
                    ..._socialItems.map((social) => _buildSocialItem(social, isDarkMode, context)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterButtons(bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ThemeService.textSecondaryColor.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _filterOptions.length,
          itemBuilder: (context, index) {
            final isSelected = index == _selectedFilterIndex;
            return Container(
              margin: const EdgeInsets.only(right: 8),
              child: FilterChip(
                label: Text(
                  _filterOptions[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : ThemeService.textPrimaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                selected: isSelected,
                onSelected: (bool selected) {
                  _selectedFilterIndex = selected ? index : 0;
                  // You might want to use a StatefulWidget or state management to handle this
                  // For now, this is just a visual representation
                },
                backgroundColor: ThemeService.cardColor.withOpacity(0.5),
                selectedColor: AppColors.primaryGreen,
                checkmarkColor: Colors.white,
                side: BorderSide(
                  color: ThemeService.textSecondaryColor.withOpacity(0.2),
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

 

  Widget _buildSocialItem(Map<String, dynamic> social, bool isDarkMode, BuildContext context) {
    Color changeColor = social['isPositive'] ? AppColors.positive : AppColors.negative;
    bool hasImage = social['imageUrl'] != null && social['imageUrl'].isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ThemeService.textSecondaryColor.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar/Profile
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      (isDarkMode ? Colors.white : Colors.black).withOpacity(0.1),
                      (isDarkMode ? Colors.white : Colors.black).withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    social['name'].toString().substring(0, 1),
                    style: TextStyle(
                      color: ThemeService.textPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          social['name'],
                          style: TextStyle(
                            color: ThemeService.textPrimaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          social['handle'],
                          style: TextStyle(
                            color: ThemeService.textSecondaryColor,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          social['time'],
                          style: TextStyle(
                            color: ThemeService.textSecondaryColor,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      social['content'],
                      style: TextStyle(
                        color: ThemeService.textPrimaryColor.withOpacity(0.8),
                        fontSize: 13,
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    
                    // Crypto Info
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: changeColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            "${social['symbol']} ${social['change']}",
                            style: TextStyle(
                              color: changeColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    
                    // Image
                    if (hasImage) ...[
                      const SizedBox(height: 12),
                      Container(
                        width: 600,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(social['imageUrl']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                    
                    // Social Actions
                    const SizedBox(height: 12),
                    _buildSocialActions(social, isDarkMode),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialActions(Map<String, dynamic> social, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Like Button
        _buildActionButton(
          icon: social['isLiked'] ? Icons.favorite : Icons.favorite_outline,
          label: '${social['likes']}',
          isActive: social['isLiked'],
          onTap: () {
            // Handle like action
          },
        ),
        
        // Comment Button
        _buildActionButton(
          icon: Icons.chat_bubble_outline,
          label: '${social['comments']}',
          onTap: () {
            // Handle comment action
          },
        ),
        
        // Share Button
        _buildActionButton(
          icon: Icons.share_outlined,
          label: '${social['shares']}',
          onTap: () {
            // Handle share action
          },
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ThemeService.cardColor.withOpacity(0.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isActive 
                  ? AppColors.negative 
                  : ThemeService.textSecondaryColor,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isActive 
                    ? AppColors.negative 
                    : ThemeService.textSecondaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}