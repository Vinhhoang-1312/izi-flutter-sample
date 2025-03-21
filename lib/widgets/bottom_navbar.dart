import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final int cartItemCount;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.cartItemCount,
  });

  @override
  Widget build(BuildContext context) {
    // Sử dụng MediaQuery để lấy chiều rộng thực tế của màn hình
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 81,
      width: screenWidth,
      color: Colors.white,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(Icons.home, 'Trang chủ', 0),
              _buildNavItem(Icons.local_offer, 'Khuyến mãi', 1),
              _buildNavItemWithBadge(
                  Icons.shopping_cart, 'Giỏ hàng', 2, cartItemCount),
              _buildNavItem(Icons.account_circle, 'Tài khoản', 3),
            ],
          ),
          Positioned(
            top: 0,
            left: (selectedIndex * (screenWidth / 4)) +
                ((screenWidth / 4 - 34) / 2),
            child: Container(
              width: 34,
              height: 3,
              color: Color(0xFF72A834),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData iconData, String label, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            child: Icon(
              iconData,
              size: 32,
              color: selectedIndex == index
                  ? Color(0xFF72A834)
                  : Color(0xFF677275),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight:
                  selectedIndex == index ? FontWeight.bold : FontWeight.w300,
              color: selectedIndex == index
                  ? Color(0xFF72A834)
                  : Color(0xFF677275),
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItemWithBadge(
      IconData iconData, String label, int index, int badgeCount) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            child: Stack(
              children: [
                Icon(
                  iconData,
                  size: 32,
                  color: selectedIndex == index
                      ? Color(0xFF72A834)
                      : Color(0xFF677275),
                ),
                if (badgeCount > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: Text(
                        '$badgeCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight:
                  selectedIndex == index ? FontWeight.bold : FontWeight.w300,
              color: selectedIndex == index
                  ? Color(0xFF72A834)
                  : Color(0xFF677275),
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
