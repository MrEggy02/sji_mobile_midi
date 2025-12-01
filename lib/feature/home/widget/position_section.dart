import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/color/styles_color.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';

class MyTrades extends StatelessWidget {
  const MyTrades({super.key});

  final Map<String, List<double>> _stockCharts = const {
    "AAPL": [175.0, 178.5, 180.2, 179.8, 182.6],
    "TSLA": [248.0, 245.5, 243.2, 244.8, 245.2],
    "MSFT": [372.0, 375.5, 377.2, 376.8, 378.9],
    "GOOGL": [136.5, 137.2, 138.0, 137.8, 138.2],
    "NVDA": [485.0, 490.5, 495.2, 492.8, 495.5],
  };

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Position",
                    style: TextStyle(
                      color: ThemeService.textPrimaryColor.withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ThemeService.cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Header Row
                    _buildHeaderRow(isDarkMode),
                    const SizedBox(height: 16),
                    
                    // Trade Items
                    _buildTradeItem(
                      "AAPL",
                      "Apple Inc.",
                      "\$182.63",
                      "15 Shares",
                      "+2.34%",
                      _stockCharts["AAPL"]!,
                      isDarkMode,
                    ),
                    _buildTradeItem(
                      "TSLA",
                      "Tesla Inc.",
                      "\$245.18",
                      "8 Shares",
                      "-1.25%",
                      _stockCharts["TSLA"]!,
                      isDarkMode,
                    ),
                    _buildTradeItem(
                      "MSFT",
                      "Microsoft",
                      "\$378.85",
                      "12 Shares",
                      "+1.67%",
                      _stockCharts["MSFT"]!,
                      isDarkMode,
                    ),
                    _buildTradeItem(
                      "GOOGL",
                      "Alphabet",
                      "\$138.21",
                      "10 Shares",
                      "+0.89%",
                      _stockCharts["GOOGL"]!,
                      isDarkMode,
                    ),
                    _buildTradeItem(
                      "NVDA",
                      "NVIDIA Corp",
                      "\$495.50",
                      "5 Shares",
                      "+3.45%",
                      _stockCharts["NVDA"]!,
                      isDarkMode,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeaderRow(bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          // Logo/Icon placeholder
   
          const SizedBox(width: 12),
          
          // Stock Info header
          Expanded(
            child: Text(
              "Stock",
              style: TextStyle(
                color: ThemeService.textSecondaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          
          // Chart header - Centered
          Container(
            width: 80, // Increased width for better centering
            child: Center(
              child: Text(
                "Chart",
                style: TextStyle(
                  color: ThemeService.textSecondaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          
          // Price/Holding header
          Container(
            width: 80, // Fixed width for alignment
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Price",
                  style: TextStyle(
                    color: ThemeService.textSecondaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTradeItem(
    String symbol,
    String name,
    String price,
    String holding,
    String change,
    List<double> priceData,
    bool isDarkMode,
  ) {
    bool isPositive = change.contains('+');
    double minPrice = priceData.reduce((a, b) => a < b ? a : b);
    double maxPrice = priceData.reduce((a, b) => a > b ? a : b);
    double priceRange = maxPrice - minPrice;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // Company Logo/Icon
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  (isDarkMode ? Colors.white : Colors.black).withOpacity(0.1),
                  (isDarkMode ? Colors.white : Colors.black).withOpacity(0.1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                symbol.substring(0, 1),
                style: TextStyle(
                  color: ThemeService.textPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          
          // Stock Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  symbol,
                  style: TextStyle(
                    color: ThemeService.textPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: ThemeService.textSecondaryColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          
          // Mini Chart - Centered with proper spacing
          Container(
            width: 80, // Increased width for better centering
            height: 30,
            child: Center( // Center the chart
              child: Container(
                width: 60, // Chart width
                height: 30,
                child: CustomPaint(
                  painter: _MiniChartPainter(
                    data: priceData,
                    minPrice: minPrice,
                    priceRange: priceRange,
                    isPositive: isPositive,
                    lineColor: isPositive ? AppColors.positive : AppColors.negative,
                  ),
                ),
              ),
            ),
          ),
          
          // Price and Holding
          Container(
            width: 80, // Fixed width for alignment
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    color: ThemeService.textPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  holding,
                  style: TextStyle(
                    color: ThemeService.textSecondaryColor, 
                    fontSize: 12
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class _MiniChartPainter extends CustomPainter {
  final List<double> data;
  final double minPrice;
  final double priceRange;
  final bool isPositive;
  final Color lineColor;

  const _MiniChartPainter({
    required this.data,
    required this.minPrice,
    required this.priceRange,
    required this.isPositive,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = lineColor.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final path = Path();
    final pointWidth = size.width / (data.length - 1);

    // Calculate points
    final points = <Offset>[];
    for (int i = 0; i < data.length; i++) {
      double x = i * pointWidth;
      double normalizedY = (data[i] - minPrice) / priceRange;
      double y = size.height - (normalizedY * size.height);
      points.add(Offset(x, y));
    }

    // Create line path
    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }

    // Create fill path
    final fillPath = Path.from(path)
      ..lineTo(points.last.dx, size.height)
      ..lineTo(points.first.dx, size.height)
      ..close();

    // Draw fill and line
    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);

    // Draw data points
    final pointPaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.fill;

    for (final point in points) {
      canvas.drawCircle(point, 1.5, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}