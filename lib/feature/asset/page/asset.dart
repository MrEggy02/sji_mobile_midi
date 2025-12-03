import 'package:flutter/material.dart';
import 'package:sji_mobile/core/styles/color/styles_color.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';

class AssetPage extends StatelessWidget {
  const AssetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make background transparent
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'MyStocks',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryGreen, // Or any start color
                Color(0xFF007A5A),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Wallet Card
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF00E08F), Color(0xFF007A5A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.8],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/icons/sji.png',
                          width: 62,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'ບັນຊີຊັບສິນ',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(
                                  Icons.share,
                                  color: Colors.amber,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  '160-12-122-557-711-32',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'ເງິນທີ່ສາມາດຖອນໄດ້:',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '\$ 123,213.21',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/icons/refresh_arrow.png',
                              width: 16,
                              height: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ເງິນທີ່ສາມາດສຳເທື່ອໄດ້:',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$ 200,120.24',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://flagcdn.com/w40/us.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                'USD',
                                style: TextStyle(
                                  color: Colors.white,
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
              Positioned(
                left: 16,
                bottom: 16,
                child: const Image(
                  image: AssetImage('assets/images/Ellipse_260.png'),
                ),
              ),
              Positioned(
                left: 16,
                bottom: 16,
                child: const Image(
                  image: AssetImage('assets/images/Ellipse_261.png'),
                ),
              ),
              Positioned(
                right: 16,
                bottom: 16,
                child: const Image(
                  image: AssetImage('assets/images/Ellipse_262.png'),
                ),
              ),
              Positioned(
                right: 16,
                bottom: 16,
                child: const Image(
                  image: AssetImage('assets/images/Ellipse_263.png'),
                ),
              ),
              Positioned(
                left: 67,
                top: 16,
                child: const Image(
                  image: AssetImage('assets/images/Ellipse_264.png'),
                ),
              ),
              Positioned(
                left: 86,
                top: 16,
                child: const Image(
                  image: AssetImage('assets/images/Ellipse_265.png'),
                ),
              ),
            ],
          ),

          // Action Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(
                  icon: 'assets/icons/transfer_1.png',
                  label: 'Transfer',
                  onTap: () {},
                ),
                _buildActionButton(
                  icon: 'assets/icons/icon_wallet.png',
                  label: 'top up',
                  onTap: () {},
                ),
                _buildActionButton(
                  icon: 'assets/icons/icon_withdraw.png',
                  label: 'withdraw',
                  onTap: () {},
                ),
                _buildActionButton(
                  icon: 'assets/icons/icon_more.png',
                  label: 'More',
                  onTap: () {},
                ),
              ],
            ),
          ),

          // History Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'History',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ThemeService.iconColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, color: ThemeService.cardColor),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          // Transaction List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildTransactionItem(
                  title: 'ຮັບເງິນໂອນ',
                  id: 'SJ81492',
                  amount: '- \$ 500.00',
                  date: '17-12-2025 9:48',
                  isPositive: false,
                ),
                _buildTransactionItem(
                  title: 'ຮັບເງິນໂອນ',
                  id: 'SJ81492',
                  amount: '+ \$ 100.00',
                  date: '17-12-2025 9:48',
                  isPositive: true,
                ),
                _buildTransactionItem(
                  title: 'ຮັບເງິນໂອນ',
                  id: 'SJ81492',
                  amount: '+ \$ 100.00',
                  date: '17-12-2025 9:48',
                  isPositive: true,
                ),
                _buildTransactionItem(
                  title: 'ຮັບເງິນໂອນ',
                  id: 'SJ81492',
                  amount: '- \$ 100.00',
                  date: '17-12-2025 9:48',
                  isPositive: false,
                ),
                _buildTransactionItem(
                  title: 'ຮັບເງິນໂອນ',
                  id: 'SJ81492',
                  amount: '+ \$ 100.00',
                  date: '17-12-2025 9:48',
                  isPositive: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(icon, height: 29, width: 29, fit: BoxFit.cover),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String id,
    required String amount,
    required String date,
    required bool isPositive,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ThemeService.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image(
            image: isPositive
                ? const AssetImage('assets/icons/money_transfer.png')
                : const AssetImage('assets/icons/money_receive.png'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: ThemeService.textPrimaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'ລະຫັດເບິ້ມ: $id',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  color: isPositive ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(color: Colors.grey[600], fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}