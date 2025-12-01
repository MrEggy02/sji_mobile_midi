import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';

class TimeFrameSelector extends StatelessWidget {
  final List<String> timeFrames;
  final int selectedTimeFrame;
  final Function(int) onTimeFrameChanged;

  const TimeFrameSelector({
    super.key,
    required this.timeFrames,
    required this.selectedTimeFrame,
    required this.onTimeFrameChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      height: 36,
      decoration: BoxDecoration(
        color: ThemeService.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          timeFrames.length,
          (index) => GestureDetector(
            onTap: () {
              onTimeFrameChanged(index);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: selectedTimeFrame == index
                    ? const Color(0xFF00E08F)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                timeFrames[index],
                style: TextStyle(
                  color: selectedTimeFrame == index
                      ? Colors.white
                      : ThemeService.textSecondaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}