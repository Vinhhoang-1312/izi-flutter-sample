import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController _pageController = PageController();
  int activeIndex = 0;

  final List<String> urlImages = [
    "assets/images/banner1.png",
    "assets/images/banner2.png",
    "assets/images/banner3.png",
    "assets/images/banner4.png",
    "assets/images/banner5.png",
    "assets/images/banner6.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: urlImages.length,
            onPageChanged: (index) {
              setState(() {
                activeIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                urlImages[index],
                width: double.infinity,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        const SizedBox(height: 10),

        /// **Thêm SmoothPageIndicator**
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: urlImages.length,
          effect: const WormEffect(
            dotWidth: 10,
            dotHeight: 10,
            spacing: 8,
            activeDotColor: Colors.green,
            dotColor: Colors.grey,
          ),
          onDotClicked: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}
