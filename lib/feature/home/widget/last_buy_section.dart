import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';
// If using network images, import this:
// import 'package:cached_network_image/cached_network_image.dart';

class WatchlistSection extends StatefulWidget {
  const WatchlistSection({super.key});

  @override
  State<WatchlistSection> createState() => _WatchlistSectionState();
}

class _WatchlistSectionState extends State<WatchlistSection> {
  final ScrollController _scrollController = ScrollController();

  // Add your icon URLs or asset paths here
  final Map<String, String> _stockIcons = {
    'APPL': 'assets/images/apple.jpg', 
    'LYFT': 'assets/images/lyft.jpg',
    'TSLA': 'assets/images/tesla.jpg',
    'MSFT': 'assets/images/microsoft.jpg',
    'GOOGL': 'assets/images/google.jpg',
    'AMZN': 'assets/images/amazon.jpg',
  };

  final List<Map<String, dynamic>> _watchlistItems = [
    {
      'symbol': 'APPL',
      'name': 'Apple Inc.',
      'price': 198.24,
      'change': 4.6,
      'isPositive': true,
      'chartData': [
  0.2, 0.4, 0.3, 0.5, 0.7, 1.2, 1.8, 2.5, 3.0, 3.2,
  3.5, 3.8, 4.2, 4.0, 4.3, 4.5, 4.4, 4.6, 4.7, 4.6,
  4.5, 4.7, 4.8, 4.7, 4.6
]


    },
    {
      'symbol': 'LYFT',
      'name': 'Lyft Inc.',
      'price': 410.01,
      'change': 2.5,
      'isPositive': true,
      'chartData': [0.0, 1.0, 0.5, 2.0, 1.8, 2.2, 2.3, 2.5],
    },
    {
      'symbol': 'TSLA',
      'name': 'Tesla Inc.',
      'price': 245.78,
      'change': -1.2,
      'isPositive': false,
      'chartData': [0.0, -0.5, -0.8, -0.3, -0.9, -1.0, -1.1, -1.2],
    },
    {
      'symbol': 'MSFT',
      'name': 'Microsoft Corp.',
      'price': 342.54,
      'change': 3.1,
      'isPositive': true,
      'chartData': [0.0, 1.5, 2.0, 2.5, 2.8, 3.0, 3.0, 3.1],
    },
    {
      'symbol': 'GOOGL',
      'name': 'Alphabet Inc.',
      'price': 152.36,
      'change': 1.8,
      'isPositive': true,
      'chartData': [0.0, 0.5, 1.0, 1.2, 1.5, 1.6, 1.7, 1.8],
    },
    {
      'symbol': 'AMZN',
      'name': 'Amazon.com Inc.',
      'price': 178.45,
      'change': -0.9,
      'isPositive': false,
      'chartData': [0.0, -0.2, -0.4, -0.6, -0.7, -0.8, -0.85, -0.9],
    },
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeService.isDarkMode,
      builder: (context, isDarkMode, child) {
        return Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Last buy",
                    style: TextStyle(
                      color: ThemeService.textPrimaryColor.withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      color: ThemeService.textPrimaryColor.withOpacity(0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildWatchlistScroll(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWatchlistScroll() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: _watchlistItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == _watchlistItems.length - 1 ? 0 : 12,
            ),
            child: _buildWatchlistCard(_watchlistItems[index]),
          );
        },
      ),
    );
  }

  Widget _buildIconWidget(String symbol) {
  final iconPath = _stockIcons[symbol] ?? 'assets/icons/default.png';

  return ClipOval(
    child: Image.asset(
      iconPath,
      width: 30,
      height: 30,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ThemeService.textPrimaryColor.withOpacity(0.12),
          ),
          child: Center(
            child: Text(
              symbol.substring(0, 1).toUpperCase(),
              style: TextStyle(
                color: ThemeService.textPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    ),
  );
}


  Widget _buildWatchlistCard(Map<String, dynamic> item) {
  return Container(
    width: 160,
    decoration: BoxDecoration(
      color: ThemeService.cardColor,
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: icon + symbol & name
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIconWidget(item['symbol']),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['symbol'],
                      style: TextStyle(
                        color: ThemeService.textPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item['name'],
                      style: TextStyle(
                        color: ThemeService.textPrimaryColor.withOpacity(0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${item['price']}',
                          style: TextStyle(
                            color: ThemeService.textPrimaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: item['isPositive']
                                ? Colors.green.withOpacity(0.1)
                                : Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                item['isPositive']
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward,
                                size: 12,
                                color: item['isPositive']
                                    ? Colors.green
                                    : Colors.red,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                '${item['change'].abs()}%',
                                style: TextStyle(
                                  color: item['isPositive']
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Chart Section
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: CustomPaint(
                painter: _LineChartPainter(
                  data: item['chartData'],
                  isPositive: item['isPositive'],
                  isDarkMode: ThemeService.isDarkMode.value,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

}

// Custom painter for drawing the line chart
class _LineChartPainter extends CustomPainter {
  final List<double> data;
  final bool isPositive;
  final bool isDarkMode;

  _LineChartPainter({
    required this.data,
    required this.isPositive,
    required this.isDarkMode,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final paint = Paint()
      ..color = isPositive ? Colors.green : Colors.red
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double minValue = data.reduce((a, b) => a < b ? a : b);
    double maxValue = data.reduce((a, b) => a > b ? a : b);
    
    double range = maxValue - minValue;
    if (range == 0) range = 1;
    
    final scaleY = (size.height - 4) / range;
    final scaleX = size.width / (data.length - 1);

    final path = Path();

    for (int i = 0; i < data.length; i++) {
      double x = i * scaleX;
      double y = size.height - ((data[i] - minValue) * scaleY) - 2;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);

    // Add a fill under the line for positive charts
    if (isPositive) {
      final fillPath = Path()
        ..addPath(path, Offset.zero)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..close();
      
      final fillPaint = Paint()
        ..color = Colors.green.withOpacity(0.1)
        ..style = PaintingStyle.fill;
      
      canvas.drawPath(fillPath, fillPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}